Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E405CD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 21:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E4FE836A5;
	Fri,  5 Jun 2026 21:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4nww5l4gXHT; Fri,  5 Jun 2026 21:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DFD683689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780693213;
	bh=6KF5OD0LSKwWXVcqWz8Y5sZNnhRgdzhAxvfkTnHtjxQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gm+VrG+mTRUaGtE7OwPsXj27htX+1AYUCiHefTRx7RXbQh2r1eV0w7j3B72E2c7Rt
	 dhCFrlRhejsldudt9ooITWAUNE0mgQifn4Zvx/o2EIf2vQlBM+0za1aLXiRDn5xC66
	 tSjDyvvwW2cc9RIp49WKTj+CVtzNInzM552AwFB9kaEb7JACsZ2zUoAblvvyl6/T/t
	 jD0Tovlj1M/DWTZo5vYuN3rG4lSHAMm6c/PoKb+lPkNqdZ+CYqeV3MsXnRQA0TimqH
	 y8sYDPpSB5W+7alIhdf6epEh3yWQxHqJhIIRNKOQ+e3bDSUHxcRYmKDFLEOveNEoPD
	 ldQlGD38k9/NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DFD683689;
	Fri,  5 Jun 2026 21:00:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0B4FDE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 21:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B269741EEA
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phyR9OP4Y-8v for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 21:00:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6861541EE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6861541EE9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6861541EE9
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 21:00:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0C67A2003D3;
 Fri,  5 Jun 2026 23:00:04 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Jun 2026 23:00:04 +0200
MIME-Version: 1.0
Date: Fri, 05 Jun 2026 23:00:04 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
In-Reply-To: <20260605070003.3911896-1-peter@korsgaard.com>
References: <20260605070003.3911896-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <a433bc2036e98d719277c87cafcc333a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780693207;
 bh=p57BB/zTfZJjx3H3q5DSjCb0dtqTRdx3EDDLG3XDCjw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lIGysC4vs2ETm/ilXsQ+FXGVzkJ7BiwuSbxf44Wq9nRz+j5SUCs+dDBP2/suD8EUG
 9r46d5I74lGUp5aGm9QDeBQVOEPkRmGNr3S/2TMrfde5lyWtY1GHb0PS9ScJ57rw5K
 uVV3lQc7fTTSR+S4RHd+7q6G1OnU7RwF2KHnFuaEq5XGtrCAJN1fZ/HuqNs9s9etks
 jO3+GjSoU2eOjRwXjz90mCdST9vE/Cz5Qr233Td/5aUHkgLrlynU2Ej+k1+Hq56nMW
 iDkSkf4Yy+XbeBiexj0MN++1wzhLS2xd5qobiNNoIHuWYOo7xmh9BOwdO+gWtgL9yu
 vqP0TNUtKHulA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lIGysC4v
Subject: Re: [Buildroot] [PATCH] package/libusb: security bump to version
 1.0.30
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05/06/2026 09:00, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2026-23679: libusb before version 1.0.30 contains a NULL pointer
> dereference vulnerability that allows attackers to crash applications 
> by
> supplying a malformed USB configuration descriptor where an interface 
> claims
> bNumEndpoints greater than zero but is followed by a class-specific
> descriptor whose bLength exceeds the remaining buffer size, causing
> parse_interface() to return early without allocating the endpoint 
> array.
> Attackers can exploit this flaw through 
> libusb_get_active_config_descriptor
> or libusb_get_config_descriptor by providing crafted descriptors via
> virtualized USB passthrough, file-based descriptor parsing, or network
> sources, causing any application iterating over endpoints to 
> dereference a
> NULL endpoint pointer and crash.
> 
> https://nvd.nist.gov/vuln/detail/CVE-2026-23679
> 
> CVE-2026-47104: libusb before version 1.0.30 contains a one-byte
> out-of-bounds read vulnerability in parse_iad_array() in descriptor.c 
> that
> allows attackers to trigger a denial of service by supplying a 
> malformed USB
> descriptor whose bLength equals size minus one, causing the bounds 
> check to
> use the original buffer size instead of the remaining size.  Attackers 
> in
> virtualized environments with USB passthrough can supply crafted 
> descriptors
> through libusb_get_active_interface_association_descriptors or
> libusb_get_interface_association_descriptors to read one byte past the 
> end
> of the malloc allocation, resulting in a denial of service.
> 
> https://nvd.nist.gov/vuln/detail/CVE-2026-47104
> 
> For more details, see the announcement:
> https://sourceforge.net/p/libusb/mailman/message/59335553/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

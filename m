Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B952CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43028612AA;
	Sun,  3 May 2026 21:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSCO7Xt1bQ6T; Sun,  3 May 2026 21:28:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2636F6128F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777843693;
	bh=k5aqe6euFNwirigKwlZNFbLWOpX7OXXEnzUJQQbj6Cs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g184CyIBd/opTZr8+YaM+wSaEqiVuYgA0T8hH/zbSXBuYPlAgEZTJRN/z2BkAlL/e
	 NztlWLk1cB0Qpq2oSsKJZBL3vOQvcXYHRKW+ISWSeLaJarspZPxkNtAb8RpVlgES4C
	 Dh2VImKMz6ydUPUugdvO64v0BIIbu/3vp2iPdwQTofP4sdiFgFVStJraiReVircjCb
	 5HE92RQxw3pk34qI7du4/POSIhRbaNvfvTCHvfJo0ScwCs3Bgzzl1XEIAabU4RW4ao
	 zlh0Y9wNRQuR80Ml9GKfAix2LADKCTJJDRYm5tAHl6cCqCeiPocX9UPLqs1ZPlSynH
	 eBYqpsqbZGXPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2636F6128F;
	Sun,  3 May 2026 21:28:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A38BC204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 21:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 807B96128F
 for <buildroot@buildroot.org>; Sun,  3 May 2026 21:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyUcyxwhWsFh for <buildroot@buildroot.org>;
 Sun,  3 May 2026 21:28:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7512A610C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7512A610C8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7512A610C8
 for <buildroot@buildroot.org>; Sun,  3 May 2026 21:28:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5645F2003C1;
 Sun,  3 May 2026 23:28:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 23:28:05 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 23:28:05 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
In-Reply-To: <20260430054544.9473-1-chakrabortyshubham66@gmail.com>
References: <20260430054544.9473-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <7808fa76ab6fa74bc3c61528ec65ecc0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777843687;
 bh=K/wXwVxq3Er7U9sqO2ILSNS4UmqB1nxNmdGXW/j86Gg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z8i4guVBCirvRltt+PxbSs6Srm3oTywzQOqUGgooYwysDH8xKlfyxJW5tCaytezC7
 AD5T2WjnLM2zpzQI5PrOg8pnL+s8A/dysrOVHqV+h07Sjn4ta5JE5HEtwFaAAPb/Rw
 rFm+NfRdtW0xjl92Jd6+DfsCynqfmK3kHA0vekVWAbtR59YbcqF3LM+sTZxAYafK2Y
 cc8D7mIVmH/fIzqKxCzich6beuQ0b/NqTyni+yNAed/ZeDxDCjTUxSPHFvzoQfCkez
 p7fV91WJ5fldVKod1OdXemo3YiCxQB1735gEAE8X1H+ShX8Xcw3kYrT/GKcxsou52p
 qdu4z46Gp/EKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z8i4guVB
Subject: Re: [Buildroot] [PATCH] package/iproute2: bump to version 7.0.0
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

On 30/04/2026 07:45, Shubham Chakraborty wrote:
> - dpll: Fix notifications and add fractional frequency offset support
> - tc: Add cake_mq support
> - mptcp: Show interface names with color support
> - devlink: Support param display and reset to defaults
> - lib/bpf_legacy: Use userspace SHA-1
> - Update kernel headers to 7.0-rc0
> - Remove upstreamed musl patch
> 
> https://lwn.net/Articles/1067497/
> 
> Tested Using:
> - utils/test-pkg -a -p iproute2
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks. For info, I replaced the announce URL
from lwn to lore (which is the primary list). See:
https://gitlab.com/buildroot.org/buildroot/-/commit/c1e6b201aaa815d54d8a8d00a02f8ec4168aed87

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

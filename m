Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A388C5DF7D
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 20:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12E4840C6B;
	Fri, 21 Aug 2026 20:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArQQ_1ECZXBV; Fri, 21 Aug 2026 20:32:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787344363;
	bh=mC7bU9mJ2CIrr9fXQnjQALyNzdMF9B2sLjRSZ1kvRhI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PFreEqKJIIyjiCZRELGZwS2CiEVgZbUjf0b6HyBdXyC0v/1YAlqoa/k9beNyvdRyk
	 01OcDTi3qcEBfynQgH3hz39OsopEaRKqqeYngCUpveukYQ6J3YLDlplWUQl9YDLpm4
	 8Vj/X1En0Qj8K4JpqtvQVSUGxq9oD7TIdMLlQLF7+/kwzcqdJUV9MoW3f5mcHDs1zJ
	 G6xFUd09e0InIFYBSXh13B0tNkU5Mpcj8SumVNd3nfmRWMeos2dACGi/A1dkylUoHi
	 wvFkwM9u/UJOwNUIODU6nq2EZBU6WxTFRnmiuCv93grPqti6OGEIjQ0VYrVpbPQ+ka
	 FWUWqeNilHlbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B34140C54;
	Fri, 21 Aug 2026 20:32:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4BC1263
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB11F81311
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8KS8sbNwfaa7 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 20:32:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C83AC8130D
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 20:32:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id F257713F8AD;
 Fri, 21 Aug 2026 22:32:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Aug 2026 22:32:37 +0200
MIME-Version: 1.0
Date: Fri, 21 Aug 2026 22:32:37 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260820202736.1301073-2-thomas.petazzoni@bootlin.com>
References: <20260820202736.1301073-1-thomas.petazzoni@bootlin.com>
 <20260820202736.1301073-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <adc62aa51dfb52d708a46b5854e2e9e5@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 2/2] package/igh-ethercat: bump to 1.6.12
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

On 20/08/2026 22:27, Thomas Petazzoni via buildroot wrote:
> The two patches are upstream, so they can be dropped.
> 
> From NEWS.md:
> 
> Version 1.6.12
> 
> - Backported CCAT fixes from Beckhoff
> 
> Version 1.6.11
> 
> - Protect datagram receiving mechanism against re-ordering
> - Prevent creating datagrams that are too large for one frame
> - Reacted to stmmac API changed during Linux 6.12
> - Adapted debug ring to kernel 5.6+ time API changes
> - Use str.read() to read into char* (deprecated in C++20)
> - Unload `ec_bhf` before loading CCAT
> - Added cpplint checks in pre-commit and CI tests.
> - Improved and formatted markdown documents and added pre-commit checks
> 
> Version 1.6.10
> 
> - Added RasPi 5 macb (Cadence GEM / RP1) driver for kernel 6.18.
> - Added igb and igc for kernel 6.8
> - Security fixes against malicious subdevices
>   - Protected `rec_size` calculation in FoE.
>   - Check for malicious EoE frame details.
> - Avoid writing invalid MAC onto r8169 NIC on removal
> - Fixed insufficient re-allocation of SoE request buffer.
> 
> Version 1.6.9
> 
> - Protect datagram injection mechanism against re-ordering.
> - Fixed for genet and igb drivers for openSUSE Leap 16.0 kernel 6.12.
> - tty: Implemented new timer interface since kernel 6.15.
> - Do not require .config to exist in kernel sources.
> - Fix: Attach slaves before calculating DCs.
> - Discard EoE traffic in CoE statemachine, if EoE is disabled.
> - Support for Linux 6.19
> - Added `--with-kmod-dir` and `--with-ip-cmd` configuration switches
>   to specify the paths of the tools used in the `ethercatctl` script.
> - Changed the default path of the `ip` command to `/sbin/ip`.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

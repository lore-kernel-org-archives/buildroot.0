Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7E1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 12:59:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADD3361027
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 12:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADD3361027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C98B4019D;
	Sun, 14 Nov 2021 12:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S9e44-dTGfH7; Sun, 14 Nov 2021 12:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DA1F40199;
	Sun, 14 Nov 2021 12:59:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70FDE1BF228
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 12:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60ABF80CD1
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 12:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id izD22U5XrMDH for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 12:59:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F078E80CC4
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 12:59:43 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 3CFE4440EEF;
 Sun, 14 Nov 2021 14:59:22 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1636894762;
 bh=cLmVE8oRjvtfqPqyZX/JRuhl081BNzrtXRv8VJtIbWw=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=gO3Gt4zXclDtz7snhMiM1PcXw1FpRsixcstOEdrd7EQ52rYzLX64JobD4qonsikmv
 hP3WDsdgCT66CVCsy9Mb6svayTUDGTdA4rNCps7nEmXWOQYzBLhrHMTU+TNKKlb0DA
 tW2NvL8lbWdkKfF0dr715qLyD6JmKjdsmK9FyoExch30SLqeh+rZ2NuSWKupyrjqgS
 QJDHVuPvpkorpHFhU2HOjBGMr5cyOFStlkC36HQdSbPMQD4dHYTEWcqr7IbrkcXV8s
 ovcV1MBKQ8tssc3Zn1QQyDC1pfnkSMZLme0o3jb11H+XizAu6oq2BnEQAQiGrwW2td
 t6PwhRFc8JQOg==
References: <20211114123432.30540-1-peter@korsgaard.com>
User-agent: mu4e 1.6.9; emacs 27.1
To: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Nov 2021 14:58:40 +0200
In-reply-to: <20211114123432.30540-1-peter@korsgaard.com>
Message-ID: <87v90ulwp1.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-next] configs/beagleboneai_defconfig: move
 to u-boot 2021.04 / mainline linux 5.10.79
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Sun, Nov 14 2021, Peter Korsgaard wrote:
> This board is now supported by mainline u-boot and Linux.  For U-Boot we
> unfortunately still need a patch as the available (<rev A2) boards do not
> have an identification eeprom, causing boot failures.
>
> Use the workaround patch by Robert Nelson also used by the official bb.org
> builds.

I could not find this patch here. Missed 'git add'?

baruch

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../uboot/0001-BeagleBone-AI-support.patch    | 1783 -----------------
>  configs/beagleboneai_defconfig                |   11 +-
>  2 files changed, 6 insertions(+), 1788 deletions(-)
>  delete mode 100644 board/beagleboneai/patches/uboot/0001-BeagleBone-AI-support.patch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

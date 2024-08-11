Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8951C3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 03:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46D8B40B7B;
	Sun, 11 Aug 2024 03:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_wQrhydWRQl; Sun, 11 Aug 2024 03:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D06040BA7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D06040BA7;
	Sun, 11 Aug 2024 03:39:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F272A1BF3F9
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 03:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE9C340511
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 03:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2h8FC89wax1U for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 03:39:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C8E84050C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C8E84050C
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C8E84050C
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 03:39:41 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id D263244046E;
 Sun, 11 Aug 2024 06:38:03 +0300 (IDT)
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87frrdq5yv.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 09 Aug 2024 13:40:56 +0200")
References: <20231002165235.346092-1-fontaine.fabrice@gmail.com>
 <87frrdq5yv.fsf@dell.be.48ers.dk>
Date: Sun, 11 Aug 2024 06:39:34 +0300
Message-ID: <87le137mo9.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1723347483;
 bh=EUltdpKVOFfgZFQsmzofnFLaru4tlq2PvG5hX09SrHU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=adgS2ypQAkYMVr6jCC6N3dqLXt6dVkwO2/jPcu7r/A26XjaN/0v631VvJoeC9oojr
 8qWx6vqzsWdrt5yC4SMaPzC3QGiZEjioSg9ZWth/NQwM6CmE5sToVtmPnRh2ErGtjb
 zKNuHB8auN90B7rw/DcJpZhEcSVaU/6QiuSHkcqFIHqf5WXdw2KYU5OszIXuka/8eH
 gIC7MPfXFtcNVM5zXBBygi62zrMPkkSpiy9aAsws9e4kmzVKbujSVgmggtTWg+efos
 9BluXzAwo4gZc00QQV4hcFQHeppEtAttudxhEkLiiv1NcVVFjgWewQZXHVa6V7+acR
 RmjJMm5asAB4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=adgS2ypQ
Subject: Re: [Buildroot] [PATCH 1/1] package/sunxi-tools: sunxi-fel needs
 dynamic library
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Fri, Aug 09 2024, Peter Korsgaard wrote:
>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > Fix the following build failure raised since bump to version
>  > 1.4.2-168-ged3039c in commit 2e330dff6a7ce7965ceb0dccdc9dcbcb329167bb:
>
>  > /home/buildroot/autobuild/run/instance-1/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/12.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld:
>  > attempted static link of dynamic object `libfdt/libfdt-1.6.1.so'
>
>  > Fixes:
>  >  - http://autobuild.buildroot.org/results/6788d86c10d551b3d617e33c85083b817eb5d0b2
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Committed to 2024.02.x and 2024.05.x, thanks.

Not in 2024.02.x as of commit 1c9821800527 ("package/gcc: bump 12.x
series to 12.4").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

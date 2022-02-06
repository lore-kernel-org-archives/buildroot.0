Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2438C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74AB94032E;
	Sun,  6 Feb 2022 10:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ja35gb3vs_SU; Sun,  6 Feb 2022 10:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 638FD401ED;
	Sun,  6 Feb 2022 10:47:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50DEF1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D230401ED
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:47:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWVEfCssUxhd for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:47:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE2F9400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:47:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D3CC1E0006;
 Sun,  6 Feb 2022 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644144468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SW7DfogbbjyUOCo2cMKMGa/aAHwIKtrKljRmTvTv1fs=;
 b=ij7W/sP5q/GxaeKWUlKICDgaCaowTPiVM3eeN1Zd1Hjtx2t1NGQctJXd8Lqbx4e3qXiZDN
 Xml73+MCEHnleZduif0Xmii8n3Ec2v81WncHb7n+IBM8QrQ4urg15RKuYv0iyvKQogbASF
 24RrjuY9DW4uP3o8Cmh2s9DpxM8OK0YMT9bqRwsVi8B8GjTimVE5RDgy0VmRJvbnNEvtPE
 AVy+SE4P/BJuebU0HhkLYzAWwT5BINybQB+SuqXV5QBWG7+zwNCuWCK2ichFUgLjXcUMYp
 7rsCZkpbfSH0L2IRNKFak61tpyccHFWekMxXhsxiigWnjOKCM5gWVBGJts/dHg==
Date: Sun, 6 Feb 2022 11:47:47 +0100
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20220206114747.4b02f9d7@windsurf>
In-Reply-To: <20220131212456.3176156-1-geomatsi@gmail.com>
References: <20220131212456.3176156-1-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] board/orangepi/orangepi-zero-plus2: fix
 build after genimage update
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Feb 2022 00:24:55 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type
> 
> To fix the first genimage error report, change 'partition-type' entries
> to the appropriate 'partition-type-uuid'. Then genimage starts to
> complain about overlaps:
> 
> ERROR: hdimage(sdcard.img): partition [GPT array] (offset 0x100000, size 0x4000) overlaps previous partition u-boot (offset 0x2000, size 0x102000)
> ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.
> 
> To fix the second genimage error report, update the size of bootloader
> file. Do not reserve additional space for GPT partition table since
> new genimage is able to keep track of it.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  board/orangepi/orangepi-zero-plus2/genimage.cfg | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Both applied, thanks! In the commit log of the first patch, I've added
a reference to the Gitlab CI failure that the patch is fixing, as
suggested by Giulio.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

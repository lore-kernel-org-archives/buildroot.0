Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE497C433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 07:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 087F483ED6;
	Fri, 25 Feb 2022 07:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGQ2OK1jQ4Ur; Fri, 25 Feb 2022 07:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB8CA83ED5;
	Fri, 25 Feb 2022 07:26:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A02CE1BF354
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CB2840395
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 95LymyD6ApKE for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 07:26:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91C2D40151
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 07:26:26 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id p20so6283643ljo.0
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 23:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YxP/RU7sq2r2ln6dbXQw7F2XcajQLIUkQOW3IgcQKy8=;
 b=XDKNLRPPRUKHIGLTdcbE7shiA314sA9G+J4faSjZTMwN/QcYGfoE72B6/vtYJqb2wg
 UdKMKLwScuwop93cUtIppIp7wB5HLkRWDS7fMQFq/qbuP00o68wseczrQDccebVo+O95
 nmYNpDFxFdX3UAhRUJo4FfsI6zf7mePDsTlm8JKfX00E+vcwFuT+KSXNqIHVcx7l5DeP
 semvTCjlqECkvR1c4KPWaxYgbKuH67W+1df4XYdChW+Pk6nGIF2x9necaDrxh2Rq4q/S
 uK/NKCkYtyE2eDOxaLaPKzF62+0lmpPLFVw4wPl8I7J6UaWSk/8G8+gwcKUxDXD4hq31
 3b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YxP/RU7sq2r2ln6dbXQw7F2XcajQLIUkQOW3IgcQKy8=;
 b=x23brC6g1EJO3c+w0oybjlhCqLiaqSEykIDzIS0eNQ0vYmQrqPc8j77cISylp+Vwav
 FNtbCC7I4x5mj8IwIAyJUJ8weqc5dQ8C2hMjeODm7AZFtOpE+Uophc7Trfq44d4Gl01e
 4Zo0wilXNyv3wOrzosmC2gMT8vdJ3NssbznuU2Q5IFz5f7PNbc9I0HrCMmQLdv7RJUDA
 0vKhx+wrNRsJDjmUyQwdJ/uc+IIw26eSRXTqm/4Dr6XDk86beao/Scz56ml789kNPzRx
 jbtdqjtphhKi2jw2jh1S9yyl7dmOI/v+VR8dADbrckciR7RGKBvp2PwdLyuiv2VfYbHn
 Pnfw==
X-Gm-Message-State: AOAM533HFtR2w4oOT2ESVagLioVD07tD3oNi5IjtgFY3hFVwzFZ4+gyH
 Ec3Uoh7yq6DHZikP7BEPswNgRCF3FiQ=
X-Google-Smtp-Source: ABdhPJxKLtf0loOb8EvH2xJ7IpzaXC0ibyeW92SnLfjPDUyMIxJEgrsXnbH9gQMpECi+hWh+p7PcCw==
X-Received: by 2002:a2e:8e6f:0:b0:246:4306:e412 with SMTP id
 t15-20020a2e8e6f000000b002464306e412mr4536035ljk.8.1645773984157; 
 Thu, 24 Feb 2022 23:26:24 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 z25-20020a2eb539000000b00244db8751a7sm184592ljm.67.2022.02.24.23.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 23:26:23 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 10:26:16 +0300
Message-Id: <20220225072622.3584480-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/6] orangepi/linksprite: convert more
 allwinner boards to extlinux
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Recently extlinux infrastructure has been added for  orangepi boards by
Sergey Kuzminov: see commit c0312f71cc89 ("configs/orangepi_zero_defconfig:
switch to extlinux"). This patch series converts to extlinux some of the
boards that I have at my disposal:
- orangepi-zero-plus2
- orangepi-pc-plus
- orangepi-one
- linksprite-pcduino

All these changes have been build- and boot- tested. Also I added
orangepi-zero-plus2 to my list in DEVELOPERS file to keep an eye
on its build failures.

Regards,
Sergey

v1 -> v2
- add linksprite-pcduino changes
- update commit messages according to Giulio Benetti comments


Sergey Matyukevich (6):
  board/orangepi/orangepi-zero-plus2: switch to extlinux
  board/orangepi/orangepi-pc-plus: switch to extlinux
  board/orangepi/orangepi-one: switch to extlinux
  board/linksprite/pcduino: switch to extlinux
  configs/linksprite_pcduino_defconfig: update Linux/U-Boot versions
  DEVELOPERS: add Sergey Matyukevich for orangepi-zero-plus2

 DEVELOPERS                                    |  2 +
 board/linksprite/pcduino/boot.cmd             |  8 ----
 board/linksprite/pcduino/genimage.cfg         | 43 -------------------
 board/linksprite/pcduino/post-build.sh        | 11 -----
 board/linksprite/pcduino/post-image.sh        | 16 -------
 board/orangepi/orangepi-one/boot.cmd          |  8 ----
 board/orangepi/orangepi-one/genimage.cfg      | 37 ----------------
 board/orangepi/orangepi-pc-plus/boot.cmd      |  8 ----
 board/orangepi/orangepi-pc-plus/genimage.cfg  | 43 -------------------
 board/orangepi/orangepi-zero-plus2/boot.cmd   |  6 ---
 .../orangepi/orangepi-zero-plus2/genimage.cfg | 41 ------------------
 configs/linksprite_pcduino_defconfig          | 18 ++++----
 configs/orangepi_one_defconfig                |  9 ++--
 configs/orangepi_pc_plus_defconfig            |  9 ++--
 configs/orangepi_zero_plus2_defconfig         | 14 +++---
 15 files changed, 24 insertions(+), 249 deletions(-)
 delete mode 100644 board/linksprite/pcduino/boot.cmd
 delete mode 100644 board/linksprite/pcduino/genimage.cfg
 delete mode 100755 board/linksprite/pcduino/post-build.sh
 delete mode 100755 board/linksprite/pcduino/post-image.sh
 delete mode 100644 board/orangepi/orangepi-one/boot.cmd
 delete mode 100644 board/orangepi/orangepi-one/genimage.cfg
 delete mode 100644 board/orangepi/orangepi-pc-plus/boot.cmd
 delete mode 100644 board/orangepi/orangepi-pc-plus/genimage.cfg
 delete mode 100644 board/orangepi/orangepi-zero-plus2/boot.cmd
 delete mode 100644 board/orangepi/orangepi-zero-plus2/genimage.cfg

-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

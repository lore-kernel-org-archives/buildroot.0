Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238CDC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 06:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CF284063F;
	Wed, 22 Dec 2021 06:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kC-td_hMlT6; Wed, 22 Dec 2021 06:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83D074047D;
	Wed, 22 Dec 2021 06:25:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4635B1BF5B4
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 06:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3203F4047D
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 06:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wOgyM3AFK8Ev for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 06:25:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 419FE4013E
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 06:25:46 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g11so3109957lfu.2
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 22:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MP5tg7eHLUhe3CXK4fdmj1rN/gx2NBu3XWqg/Qo7OXA=;
 b=pfypTj5uoiQcmRfwUfjERlXW7XsrEjBvVoVJwTc7Lh2SKFc8mpMZ0KCvGmFe3Sudy9
 iGhI9CraBrBCw7/G+WFBNXwuMzbYaYdRVIGaWATQbVRsFye6B0D2UAWAIvHRg2NDkemR
 CAGsAgWITv2mnZ64tRDxyJpWiRK9gH/OBczKk0GsVvoZjr5r6rGDmIFDsUr3HDNwSdJP
 fopJhthvRs4MkQVF43VzJEoYPF4WNNw60lM5pTaxyqQkCqsXGL8291v6NYTkFG+zfbWm
 sjylrF6aby7BPqpHz6BfHB/TcMdCk/2RxBTvnH3KY4u5N1tsVHs46IeGLPT+ya5ZswXM
 yaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MP5tg7eHLUhe3CXK4fdmj1rN/gx2NBu3XWqg/Qo7OXA=;
 b=5q+NWqRZPo975VS0ZXs43W2LNNyZvhUbpycGM5LoBlh1V7i6Az6frTKoZ09/sF7/Yz
 EBQcxJTk3pCGl2lwKg1osDJF3Pen7fW9E/1zm4hVWsdlL/rC9E8wYhyWs6+nPzGMoTdQ
 cFPLaHoI/6d3msW/MpvlJt3u77w8RXM3kNzy/pZjnuX4Mx1jx8GipG5kk0WirzhQLElJ
 8CLcbgF31FT8Yx+mDwivkJ2SifVgV0tq47y/KDpOjJvbVGf+twYrIlBaMkXRjrorKIg2
 ZTph07wB7bh9QfxhMKW4WpXTAX+EC1slScV4HdjKKRjaRkmdT/YlOmJP2G4BF96NDVv3
 4V5Q==
X-Gm-Message-State: AOAM530NzWuRKMTNUU+qP4d3eRMIx3iQJjOfJN98EmpNOHrPrHr/5qX1
 LubifydxxgNtnT1BLk21Af6cpuIpIuw=
X-Google-Smtp-Source: ABdhPJwwCbBdMAEZFQkq2qhMU1KrWAuVmnbRsJRws7MJhOwXzxZ1B0nOgiwneJI3G2u7c48cMbW5Bw==
X-Received: by 2002:a19:484a:: with SMTP id v71mr1402231lfa.309.1640154343853; 
 Tue, 21 Dec 2021 22:25:43 -0800 (PST)
Received: from localhost.localdomain ([98.128.186.122])
 by smtp.gmail.com with ESMTPSA id f33sm118624lfv.39.2021.12.21.22.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 22:25:43 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 07:25:37 +0100
Message-Id: <20211222062538.1073176-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/makedevs: allow recursive on
 directory with symlinks
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using BR2_ROOTFS_DEVICE_TABLE to change ownership of /etc, like so:

  /etc        r  -1 root     wheel     - - - - -

makdevs fails due to it trying to chown() a symlink:

  makedevs: chown failed for /src/myLinux/output/build/buildroot-fs/ext2/target/etc/mtab: No such file or directory
  makedevs: line 25: recursive failed for /src/myLinux/output/build/buildroot-fs/ext2/target/etc: No such file or directory
  make[2]: *** [fs/ext2/ext2.mk:63: /src/myLinux/output/images/rootfs.ext2] Error 1
  make[1]: *** [Makefile:84: _all] Error 2
  make[1]: Leaving directory '/src/myLinux/buildroot'

This patch checks the type of fpath before continuing, since we call
nftw() with FTW_PHYS we can rely on FTW_SL to check and skip.

Also included, some minor coding style cleanup and marking of unused
callback arguments.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/makedevs/makedevs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index c57b964f5c..7927b4122a 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -437,8 +437,10 @@ void bb_show_usage(void)
 	exit(1);
 }
 
-int bb_recursive(const char *fpath, const struct stat *sb,
-		int tflag, struct FTW *ftwbuf){
+int bb_recursive(const char *fpath, const struct stat *_, int type, struct FTW *__)
+{
+	if (type == FTW_SL)
+		return 0;	/* Skip symlinks, cannot chown/chmod them */
 
 	if (chown(fpath, recursive_uid, recursive_gid) == -1) {
 		bb_perror_msg("chown failed for %s", fpath);
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

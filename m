Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2EEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 22:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E708340361;
	Sat, 20 Nov 2021 22:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXdJCc5d4A4P; Sat, 20 Nov 2021 22:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 106C740167;
	Sat, 20 Nov 2021 22:31:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 946901BF3DE
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 22:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 813D540167
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 22:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PFB9HCE3_Ne8 for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 22:31:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65B49400CE
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 22:31:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d24so24993841wra.0
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 14:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wfaSmphJG2/3aSLNPBJIWAwRyUE3ZFhixXrxFy5/3BI=;
 b=JzDXDdyOjC2ej1zOUk0Op/1NKc4YPMi5mYiMGBOlt+WVac3LVv6y5oboCkOZ72wC2H
 NUU512gM9sRpG2aVKWyDhZXgKhNujUTJEzKPyd7M+57qfqo0fRivN4Rs8sIdP35bw9gB
 USkOR9z40CM23Rwg2p0WL4m8rEMxl1xNpwAdPk613i4CNUb3lbm7/ssx07f4BrLgJhWh
 H3YEylQTGn1GReZWV+/LiUZI3GiNFnRPZuww1MM90qsDbv1QSV6MhFrarNjXSucBwrWI
 ZaPf5fcRM4TnNTfxUU9LDU43eUWuca86jtHWOPdhdf9vyHr3QF99TNrpEhlF/ku7+yLN
 ghmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wfaSmphJG2/3aSLNPBJIWAwRyUE3ZFhixXrxFy5/3BI=;
 b=AcaLDVUveLHa5Daa3/cFTwk6e7MGARssz9uAJQd44Pwovd0OXQ8e9NAvJlaOjc5SX+
 siI+H/qBw1wqFiFKUWLpqfvYwCxV+5Rc34XQCKmKSzS3mmV3KY2K1OxVmRiDQBBjFefU
 weO13+7WPMDg8aQyzoq7acJIgzFars2W+b9ScPY0n2mEfLYJZd6MgYHD37xCOOEPCjDW
 5bhX2y1LQqZoF2d4usN7wSVhN1ZrqA2CKSllXn8H5XkXwfXCbuxKnnEmmD/mbltoZBti
 HAo9g1ZZV7YJtdcERqCgABgOrBH0XVEHK4Z/BvSQulyAes2PbhG1dRgzzHmuCxR4bqlc
 Lqww==
X-Gm-Message-State: AOAM531XrOWfEsOnLtyTJrzTtxH1dxJHPchveLunUlxUi5dCVWPomRY0
 SZxwQUwfxPko44vFDqRMxLnQ/7i6FtA=
X-Google-Smtp-Source: ABdhPJzw2EQ5xlebojMBRtCkl+2yURbO/wj/hcprWBZ2YNQk04GT+brYvLI/eYyuPcVBeM2Kr6kSMg==
X-Received: by 2002:adf:f787:: with SMTP id q7mr21820375wrp.1.1637447476355;
 Sat, 20 Nov 2021 14:31:16 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id y142sm4275894wmc.40.2021.11.20.14.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 14:31:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 23:28:57 +0100
Message-Id: <20211120222857.3110528-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/busybox: mount /sys
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14351

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/busybox/inittab | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/busybox/inittab b/package/busybox/inittab
index ff1725c775..22e63d1603 100644
--- a/package/busybox/inittab
+++ b/package/busybox/inittab
@@ -15,6 +15,7 @@
 
 # Startup the system
 ::sysinit:/bin/mount -t proc proc /proc
+::sysinit:/bin/mount -t sysfs sysfs /sys
 ::sysinit:/bin/mount -o remount,rw /
 ::sysinit:/bin/mkdir -p /dev/pts /dev/shm
 ::sysinit:/bin/mount -a
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

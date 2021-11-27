Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022D0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 08:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95EA6409A7;
	Sat, 27 Nov 2021 08:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2oOAaw2Nxxjs; Sat, 27 Nov 2021 08:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D116040455;
	Sat, 27 Nov 2021 08:44:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E47121BF376
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 08:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0D138105B
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 08:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmZNdkx66aHe for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 08:44:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7A3D80F75
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 08:44:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p18so9943982wmq.5
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 00:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lptMzD3jgdfEX5B5tJCDa0qD3Gq82YuoCiaz2pYt74U=;
 b=nm2ENHBQepKRH70Swv/BDEyyXoWRipUOWqDBvu2pFnoFWi9yPGB9LMqHk9bGGqEEzz
 e03zDXbtPJh1oGHxlWc9YsgJ9JjTL5sz4xO1hDpgsdyYSYMDH9z803TUF7Vr6C0ySMsJ
 KxNc9llMyA+8mJX6vVT/pgDV0Y8/ukZq3mWOpBrURrT2+9i+2KCIldH5JOx/Ik9EC56c
 ZFGl+BA+8MGVmBjaebKqevSwuTZUmS4E20y5NEPLZN2n5EjnrYwd4nwdlvKULCoctLfx
 TenwVOs1pTqnfsSqJYccNaWGc/Wg7JdGUl2tqP4qpG6wFYg1vYrHhCGPhuJVOu7aq8Fy
 iqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lptMzD3jgdfEX5B5tJCDa0qD3Gq82YuoCiaz2pYt74U=;
 b=d+BIa8qJN/cud3yoKROR/A4w7LO4m34mWWRRjOFSC2I6HjxvdEAtsjPnJThZuZ2/pJ
 8btHQdYIYsPf3wggi+Wz4CfXfbcopiddKOsPGy3Ekc2UH9PyWR535tgUu9793DIuaMw1
 uf1kPIQtiVi2l9DY4+jpUL2YWHz7cqZLgsfoY/PtJXfelQOzyZSe5eY5zsKc2/GsSJy7
 cGEql+phQirHDplMuzDKBMwPGsHuQ3FBrVIztqEK5Ixk237itiS9LM8bDo+LSsRYBVfD
 VUHof8BdQs87xltpM2NIjQ4ogggxQb896ccd6PmHD+gxd9Ajc8HBRion7riNPQRj+Zpu
 CQqw==
X-Gm-Message-State: AOAM5321ILbvWIn6IuBYuAJ6PeS56ZarPBgSzoOTaO0Vwl02Fapcsiai
 oVzMDsjM13kbPRhUCmpND3QrVkhTKiw=
X-Google-Smtp-Source: ABdhPJwBvhHOEGXoYYVO7XhsaJ3J9FTgT8sxG2rVMQcLFY31kHcTLc6XmsW0iAosH5cwWp/McY0H9A==
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr21324005wmk.152.1638002684572; 
 Sat, 27 Nov 2021 00:44:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id m20sm15773232wmq.11.2021.11.27.00.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 00:44:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 09:42:14 +0100
Message-Id: <20211127084214.1525965-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libglib2: update fourth patch
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

Update fourth patch to add girdir in gio-2.0.pc. This will fix the
following build failure with libnice raised since commit
aade2fd293fc8a13bc5665fa70a4002ddac9aae6:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler nice/Nice-0.1.gir --output nice/Nice-0.1.typelib --includedir=/usr/share/gir-1.0
Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir

Fixes:
 - http://autobuild.buildroot.org/results/3088ef32b03e0bb984291b1227b187f1ff816eb7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...irdir-to-gio-2.0.pc-and-glib-2.0.pc.patch} | 23 +++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)
 rename package/libglib2/{0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch => 0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch} (53%)

diff --git a/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch b/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
similarity index 53%
rename from package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
rename to package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
index 7eeecbe336..a29587bd31 100644
--- a/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
+++ b/package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
@@ -1,21 +1,36 @@
-From 04bdfff007c91fc620ed0b7cd02fd2e1e83bdefc Mon Sep 17 00:00:00 2001
+From ff3db531608eb0f9de8a88c1bc34fe0f1d93121c Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 12 Nov 2021 18:01:05 +0100
-Subject: [PATCH] glib/meson.build: add girdir to glib.2.0.pc
+Subject: [PATCH] meson.build: add girdir to gio-2.0.pc and glib-2.0.pc
 
-Add girdir to glib-2.0.pc to fix the following build failure with atk:
+Add girdir to gio-2.0.pc and glib-2.0.pc to fix the following build
+failure with atk or libnice:
 
 /home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
 Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
 
 Fixes:
  - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
+ - http://autobuild.buildroot.org/results/3088ef32b03e0bb984291b1227b187f1ff816eb7
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
+ gio/meson.build  | 1 +
  glib/meson.build | 1 +
- 1 file changed, 1 insertion(+)
+ 2 files changed, 2 insertions(+)
 
+diff --git a/gio/meson.build b/gio/meson.build
+index 29473d26b..112d4ada9 100644
+--- a/gio/meson.build
++++ b/gio/meson.build
+@@ -831,6 +831,7 @@ pkg.generate(libgio,
+   variables : ['datadir=' + join_paths('${prefix}', get_option('datadir')),
+                'schemasdir=' + join_paths('${datadir}', schemas_subdir),
+                'bindir=' + join_paths('${prefix}', get_option('bindir')),
++               'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
+                'giomoduledir=' + pkgconfig_giomodulesdir,
+                'gio=' + join_paths('${bindir}', 'gio'),
+                'gio_querymodules=' + join_paths('${bindir}', 'gio-querymodules'),
 diff --git a/glib/meson.build b/glib/meson.build
 index f78f32969..6c5486699 100644
 --- a/glib/meson.build
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

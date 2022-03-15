Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67173C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08A9760B02;
	Tue, 15 Mar 2022 21:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94ri3SsjrkOd; Tue, 15 Mar 2022 21:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF616068F;
	Tue, 15 Mar 2022 21:00:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 600C71BF263
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CEF26068F
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WD4ECTrDcOty for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:00:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2B3360640
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:00:31 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r6so310378wrr.2
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HY95sAo0HxKlVxgssOtZKdEehKDJfaksfivYPSzaVMI=;
 b=BQa55FuD8tf4od02IZElBv4YGvyZ3XHB3wygFDFV2F2oGTnfCmJYF1sQOpYIita/s+
 BDBq/h8QGIh3e9XYM/wR1rc2amAUI/HsLvyA1041gXUOoTjpM7kL28vxALZECuOZOI24
 /5Uya2D7Q+c1HhQhFf4ubuhpm8FD+l1pr+/IsTYu5rig+mMzzGktiIwQ0VvgFiunLAuJ
 cCSZvVYsCSVL48yS+9bqLhhm/U1Uu73cInYK1C1TdKfA4ZEQ/Yl+hrcenTUeYSmJgePc
 UpO+q9CLBpQxAcF+4/8TE7cNs9zDt1MI01gPcZDD7LdSZlzCyMg1PsuEFUag/6MviE50
 mG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HY95sAo0HxKlVxgssOtZKdEehKDJfaksfivYPSzaVMI=;
 b=I9rrTCRYSMH7TJQK7mr5XvBfDht4eYQcrjnrzY0TKHjameZlxf4njbMYloed4KTnU8
 ZqjEIbutGb+HWENKzoBmJUJWijfku6g/2oa0qBrVxYikhUpWZyYSecSwyKKe81z4sixs
 GWNg003Fa1qPHN9fFswtsfwR0x+dS9DjnvHo+9K5nZzsDofRfU5Tu/foBs7PJGlCJmre
 LYOfTT791cIZ2G0EOjPL03ScPLww1EU30sp1azalTSAJnlETYZYmTF3Ib6AgsKl9FfFY
 KufT2O5Z1jeDB0sI7439gMh9y1DOES5syb8+HWnFQPjREE3qkB77R5BG7hnn7yhLfd8g
 3tMg==
X-Gm-Message-State: AOAM532ogh7jm4P8wdMH1Mwq2oPC29wyY1jlikecR1cZPqbmrI4AQUkZ
 GsGtbZGeCU/2dBBEDBIb6zJJQS0qyd8=
X-Google-Smtp-Source: ABdhPJzfPjtx77BXWMNQ3wQPrb9X9PhMvFG0qORaVsHhozAD8JAE1kYzrBl9KdgengNUUljD3iOPDw==
X-Received: by 2002:a05:6000:2c4:b0:203:72c9:ef37 with SMTP id
 o4-20020a05600002c400b0020372c9ef37mr20892858wry.387.1647378029884; 
 Tue, 15 Mar 2022 14:00:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm5379001wms.9.2022.03.15.14.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 14:00:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 21:59:18 +0100
Message-Id: <20220315205918.2211690-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rygel: fix g_ir_compiler calls
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

Fix the following build failure raised since bump to version 0.40.2 in
commit 6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3:

[108/298] Generating src/librygel-core/RygelCore-2.6.typelib with a custom command
FAILED: src/librygel-core/RygelCore-2.6.typelib
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler --output src/librygel-core/RygelCore-2.6.typelib /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir
Could not find GIR file 'GUPnP-1.2.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir: Failed to parse included gir GUPnP-1.2

Fixes:
 - http://autobuild.buildroot.org/results/2b8956818f03f66a53480f7ed5fc0abb4f05288d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-meson.build-fix-g_ir_compiler-calls.patch | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch

diff --git a/package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch b/package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch
new file mode 100644
index 0000000000..3961ad0564
--- /dev/null
+++ b/package/rygel/0002-meson.build-fix-g_ir_compiler-calls.patch
@@ -0,0 +1,84 @@
+From bed9e2effae60f7d736731e93d9e699cb173f04e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 15 Mar 2022 19:20:33 +0100
+Subject: [PATCH] meson.build: fix g_ir_compiler calls
+
+Fix the following build failure when cross-compiling which is raised
+because rygel is using a custom_target target instead of the standard
+gnome.generate_gir:
+
+[108/298] Generating src/librygel-core/RygelCore-2.6.typelib with a custom command
+FAILED: src/librygel-core/RygelCore-2.6.typelib
+/home/giuliobenetti/autobuild/run/instance-3/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler --output src/librygel-core/RygelCore-2.6.typelib /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir
+Could not find GIR file 'GUPnP-1.2.gir'; check XDG_DATA_DIRS or use --includedir
+error parsing file /home/giuliobenetti/autobuild/run/instance-3/output-1/build/rygel-0.40.2/build/src/librygel-core/RygelCore-2.6.gir: Failed to parse included gir GUPnP-1.2
+
+Indeed, the custom_target command is unable to retrieve the correct
+--includedir from glib-2.0.pc so add an ugly hack to custom_target calls
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2b8956818f03f66a53480f7ed5fc0abb4f05288d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: probably not upstreamable]
+---
+ src/librygel-core/meson.build         | 4 +++-
+ src/librygel-renderer-gst/meson.build | 1 +
+ src/librygel-renderer/meson.build     | 1 +
+ src/librygel-server/meson.build       | 1 +
+ 4 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/librygel-core/meson.build b/src/librygel-core/meson.build
+index fd43bebe..e6be2b5e 100644
+--- a/src/librygel-core/meson.build
++++ b/src/librygel-core/meson.build
+@@ -70,7 +70,9 @@ core_gir = custom_target('RygelCore-2.6.gir',
+ # so we depend on the custom_target from that step and pass the input through
+ # commandline.
+ custom_target('RygelCore-2.6.typelib',
+-               command: [g_ir_compiler, '--output', '@OUTPUT@', join_paths(meson.current_build_dir(), 'RygelCore-2.6.gir')],
++               command: [g_ir_compiler, '--output', '@OUTPUT@',
++                         '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
++                         join_paths(meson.current_build_dir(), 'RygelCore-2.6.gir')],
+                output: 'RygelCore-2.6.typelib',
+                depends: [ core_lib, core_gir ],
+                install: true,
+diff --git a/src/librygel-renderer-gst/meson.build b/src/librygel-renderer-gst/meson.build
+index ad98a3a7..e8baefe1 100644
+--- a/src/librygel-renderer-gst/meson.build
++++ b/src/librygel-renderer-gst/meson.build
+@@ -36,6 +36,7 @@ custom_target('RygelRendererGst-2.6.typelib',
+                         '--output', '@OUTPUT@',
+                         '--includedir', core_girdir,
+                         '--includedir', renderer_girdir,
++                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
+                         join_paths(meson.current_build_dir(), 'RygelRendererGst-2.6.gir')],
+                output: 'RygelRendererGst-2.6.typelib',
+                depends: [renderer_gst_lib, renderer_lib, renderer_gst_gir, renderer_gir],
+diff --git a/src/librygel-renderer/meson.build b/src/librygel-renderer/meson.build
+index 5f401527..821273ff 100644
+--- a/src/librygel-renderer/meson.build
++++ b/src/librygel-renderer/meson.build
+@@ -43,6 +43,7 @@ custom_target('RygelRenderer-2.6.typelib',
+                command: [g_ir_compiler,
+                         '--output', '@OUTPUT@',
+                         '--includedir', core_girdir,
++                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
+                         join_paths(meson.current_build_dir(), 'RygelRenderer-2.6.gir')],
+                output: 'RygelRenderer-2.6.typelib',
+                depends: [ renderer_lib, renderer_gir, core_gir ],
+diff --git a/src/librygel-server/meson.build b/src/librygel-server/meson.build
+index a3bd77d9..6b084eb6 100644
+--- a/src/librygel-server/meson.build
++++ b/src/librygel-server/meson.build
+@@ -122,6 +122,7 @@ custom_target('RygelServer-2.6.typelib',
+                command: [g_ir_compiler,
+                         '--output', '@OUTPUT@',
+                         '--includedir', core_girdir,
++                        '--includedir', meson.get_external_property('sys_root') + get_option('prefix') + '/' + gir_dir,
+                         join_paths(meson.current_build_dir(), 'RygelServer-2.6.gir')],
+                output: 'RygelServer-2.6.typelib',
+                depends: [ server_lib, server_gir, core_gir ],
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

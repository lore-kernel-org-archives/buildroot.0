Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789CEC433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 09:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D075A40584;
	Mon, 20 Dec 2021 09:33:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbP-eztHQ-c4; Mon, 20 Dec 2021 09:33:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BE9D40577;
	Mon, 20 Dec 2021 09:33:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95A291BF3F6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 09:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 809A541BE3
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 09:33:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K4qUBBe3NuHm for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 09:33:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 898A241BD2
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 09:33:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i22so18687902wrb.13
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 01:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lMq4aQRMQGPVj2fJftjtwtpj1TSYkIwTLZ/DQZTvAiw=;
 b=JZ8DFbkvF62Rruj255G5mX0skex1qPl6jDEZr2VM8m9KWG0Vd9wEfzFNCWn8kL/BgZ
 f5bGAY8H3wZKGgBu0ata9Y+ucyIaFTAxX+YcfYtvVsXS5eatanDEb2WaEeLaUUrcTeej
 /z+gwFaDBQP7n6A/srDI9Lz2r1tQBSoLpIGcrW3lMOuP4/OpFVUcio8+ntp9vN+4O+vY
 Y2uDY/+GUCRYtHMbqrBuUmeXXGscM711ZUK2ZilQY0phXcf3ypMUUS/sZgEY8hqQyqJ6
 nZqxHGMTdlD3z/8dc1veLptlRwdKU/EatDeC0T7/NFHJqZcrSyCmOtytTUpeqHcj12sv
 CYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lMq4aQRMQGPVj2fJftjtwtpj1TSYkIwTLZ/DQZTvAiw=;
 b=P7hX7y8XUBVDzwOYaiKyB/vD+lSDwo1+cPKUfKSyAd3XrioeoaIl3ANm6IdtYTwVKu
 FqCzhjb9kU1E61PlJh/6g54HbYgiRJTyfmLItXg3PTX64ThB5z2y+4VLaHYtbL8OMB3j
 W01Leez/8qESx86tpCjGngL4aefA089RtzLffGbEEJrokjkV1M4A7zYD/PI5ZHhohtG+
 m1vGVWY82Bl7ZITcCFN3sKbWvFXMrrrE5GDfyilCkqWHBIrysvwmTPvMRfmUWf8hvOrx
 CVe3JaX86XSDOzPEaveYKsqwGNrrrQPqLBjberh22+m4Cj1Y9XN9EPCauhNfSit0zaiZ
 Dx4w==
X-Gm-Message-State: AOAM531Y4xio/uoTcOULKixy1s1gs4K29pNF0dwwb2rTkpPKg22YX+QY
 LJT0toK6vadGP/EURPdqnDQBLSIdO10aQA==
X-Google-Smtp-Source: ABdhPJwMpGJn4O0UvdjEG8knwGybPJpF/0WuOXemnfxRVmPbjnC4BQhH2tBbJx+ULUrfFixLiVlWeg==
X-Received: by 2002:adf:e8d2:: with SMTP id k18mr12448186wrn.187.1639992830427; 
 Mon, 20 Dec 2021 01:33:50 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id k7sm15032914wri.110.2021.12.20.01.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 01:33:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 10:33:11 +0100
Message-Id: <20211220093311.1927043-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-rtsp-server: fix
 introspection
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

Fix the following build failure with introspection:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler gst/rtsp-server/GstRtspServer-1.0.gir --output gst/rtsp-server/GstRtspServer-1.0.typelib --includedir=/usr/share/gir-1.0
Could not find GIR file 'Gst-1.0.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file gst/rtsp-server/GstRtspServer-1.0.gir: Failed to parse included gir Gst-1.0
If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"

Fixes:
 - http://autobuild.buildroot.org/results/04af6b22cfa0cffb6a3109a3b32b27137ad2e0b0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-rtsp-server-meson.build-add-gst_dep.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch

diff --git a/package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch b/package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch
new file mode 100644
index 0000000000..b63f634598
--- /dev/null
+++ b/package/gstreamer1/gst1-rtsp-server/0001-gst-rtsp-server-meson.build-add-gst_dep.patch
@@ -0,0 +1,41 @@
+From b6bc8fbb72d6d3914c616dc64d15b961493cb9c2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 20 Dec 2021 10:09:36 +0100
+Subject: [PATCH] gst/rtsp-server/meson.build: add gst_dep
+
+Add gst_dep to gst_rtsp_server_deps, in the context of buildroot, this
+will avoid the following build failure, because the correct girdir
+location will be retrieved from gstreamer-1.0.pc:
+
+/home/giuliobenetti/autobuild/run/instance-3/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler gst/rtsp-server/GstRtspServer-1.0.gir --output gst/rtsp-server/GstRtspServer-1.0.typelib --includedir=/usr/share/gir-1.0
+Could not find GIR file 'Gst-1.0.gir'; check XDG_DATA_DIRS or use --includedir
+error parsing file gst/rtsp-server/GstRtspServer-1.0.gir: Failed to parse included gir Gst-1.0
+If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
+Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/04af6b22cfa0cffb6a3109a3b32b27137ad2e0b0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/gstreamer/gst-rtsp-server/-/merge_requests/217]
+---
+ gst/rtsp-server/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/rtsp-server/meson.build b/gst/rtsp-server/meson.build
+index 24d7c39..874da14 100644
+--- a/gst/rtsp-server/meson.build
++++ b/gst/rtsp-server/meson.build
+@@ -55,7 +55,7 @@ rtsp_server_headers = [
+ 
+ install_headers(rtsp_server_headers, subdir : 'gstreamer-1.0/gst/rtsp-server')
+ 
+-gst_rtsp_server_deps = [gstrtsp_dep, gstrtp_dep, gstsdp_dep, gstnet_dep, gstapp_dep]
++gst_rtsp_server_deps = [gstrtsp_dep, gstrtp_dep, gstsdp_dep, gstnet_dep, gstapp_dep, gst_dep]
+ gst_rtsp_server = library('gstrtspserver-@0@'.format(api_version),
+   rtsp_server_sources,
+   include_directories : rtspserver_incs,
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

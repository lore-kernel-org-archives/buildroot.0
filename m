Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39367C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 07:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6789241B42;
	Sat, 16 Apr 2022 07:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xq55XfrJksSG; Sat, 16 Apr 2022 07:22:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBBA6419D6;
	Sat, 16 Apr 2022 07:22:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FD141BF3DD
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 07:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9877419D6
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 07:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xnkknJoilx5B for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 07:22:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5814419C5
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 07:22:45 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id r64so6010263wmr.4
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 00:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p889X+H57lZ5225NZEt8+S1wEs89mn9tFTPdPsId7mA=;
 b=DgKpxvzXFR7KL2AeX6LXZc7KFukf0ksJSZLnUGI5/3yTpNPWrTFdb7q0YTR0QCgsXw
 0clyDUyczfygrZpx+SgBuVXQIVh46HpJU0eQSaVNQstBb2V7OcgfLIfb8sVM6KBqEenx
 PFcibD7uUKQS2i3r5+JAIB1DsZrsJtUP51Fv1TXv51qh1kjf2lpGljVLD6IUPdRMpXgf
 ulk7FUrK7Ek2GXad9zkbT64f7JtuXLnhKxhK0Hj/V1ErbXkwEQFnE8dVSFNoEyCLxhNP
 3R2ByzapQ5J1XLQy3t/auNKydovptgNW+yOD4T1o3gRWArVQsNrl73BV6sObI4rtOehe
 0PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p889X+H57lZ5225NZEt8+S1wEs89mn9tFTPdPsId7mA=;
 b=wZXG7LE9VNIjPKLw6BpJkQXbWUeSQVPX3VIgMJTpVjt099rNG8HkkoG7jjkZ48kWLa
 yfu6L/9TrP4Dom+DKkJID9b0JlMaWIrLzZp92kS8vrqaaQh9e8t7Si4THIYAKCdGLF7C
 D35p0FhQIYdYI6VK+5oxa2VtOnPGCLng7F8rnC3ObqpUaIc8/a4JnW9Utyj1JwKcn4K+
 KUYNqCltryHF0+3eVuFBKn9IikQphiwW+Y6Jy3iqomzo0tVcVU8qtvNo3r8nwEevbAYQ
 unN3EYeW+/259TQZJOVioQeNyxIv9+rc9Cj4Xd/OemDPKE+8wKP1ToM4dG3RxheHasn7
 PIwA==
X-Gm-Message-State: AOAM532bVG31iglU5jLR8bf2HEqqaK1tUoXtwBClwlzdyIZenAeX0rRP
 DB8WtB+07glcmDcKp74fXQ4opJBsDxk=
X-Google-Smtp-Source: ABdhPJzJiyttnUEExGe3WfC7tGQyMENnxuGS9ZRpglS5hz8k9pcqbsOJHrz2i8W24N6K7VyJHTYEgQ==
X-Received: by 2002:a1c:acc6:0:b0:38e:b184:7721 with SMTP id
 v189-20020a1cacc6000000b0038eb1847721mr2120053wme.94.1650093763073; 
 Sat, 16 Apr 2022 00:22:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm322377wmb.15.2022.04.16.00.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 00:22:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 09:20:06 +0200
Message-Id: <20220416072006.1099281-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-python: fix build
 without C++
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

Fix the following build failure without C++ raised since the addition of
the package in commit ba0d78b90705fa6f564e105437be4817caf2ca6c:

The following exception(s) were encountered:
Running "/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++'"

Fixes:
 - http://autobuild.buildroot.org/results/eebf65036f79d21d347714d62afecd0108393308

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-build-on-systems-without-C-compiler.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch

diff --git a/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch b/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch
new file mode 100644
index 0000000000..7d3059d61a
--- /dev/null
+++ b/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch
@@ -0,0 +1,35 @@
+From 26c2385faed0bb997368daabd4c64207b3fc01ca Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 15 Apr 2022 18:58:49 +0200
+Subject: [PATCH] gst-python: fix build on systems without C++ compiler
+
+Fix the following build failure on systems without C++ compiler:
+
+The following exception(s) were encountered:
+Running "/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++'"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/eebf65036f79d21d347714d62afecd0108393308
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2200>
+
+[Retrieved (and backported) from:
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/26c2385faed0bb997368daabd4c64207b3fc01ca]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ subprojects/gst-python/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1462604b297..c28df16192a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('gst-python', 'c', 'cpp',
++project('gst-python', 'c',
+   version : '1.20.1',
+   meson_version : '>= 0.60',
+   default_options : [ 'warning_level=1',
+-- 
+GitLab
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

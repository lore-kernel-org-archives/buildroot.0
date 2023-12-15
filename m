Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B064BC4167B
	for <buildroot@archiver.kernel.org>; Fri, 15 Dec 2023 19:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53B194175F;
	Fri, 15 Dec 2023 19:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53B194175F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17LIYWPZxWu3; Fri, 15 Dec 2023 19:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A2FA4047C;
	Fri, 15 Dec 2023 19:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A2FA4047C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4351BF83A
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 19:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0B8A80BE3
 for <buildroot@lists.busybox.net>; Fri, 15 Dec 2023 19:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0B8A80BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jcf5EHMWMYEd for <buildroot@lists.busybox.net>;
 Fri, 15 Dec 2023 19:50:22 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 652A280BC3
 for <buildroot@busybox.net>; Fri, 15 Dec 2023 19:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 652A280BC3
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c19f5f822so5908585e9.1
 for <buildroot@busybox.net>; Fri, 15 Dec 2023 11:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702669820; x=1703274620;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=riN8OmZsG0ou+5yfUai27PO2WvVCixdDD70cfsonE5M=;
 b=X1o7o4wXYkvZRKK5eJzdRlHO6AROIl3+1ENuuepysLWPgeOWDCXsUBvY3qzqkVR3Jy
 mfyuVRvQvDuu4E4Ii/hSyEhkZFUlEXvzhAIbZf1/nSoBEfepkjvI3i23U+9On4ec5b43
 /AnY7zLCEatfBhimWx8a6v9M5gyr8Q7TTkEqGhgP05uRJ256UNxa1eIS3wtaZNnGXWGk
 0AMSHqrbhvwybmW95IfFOHLr1xy5R+qo0pa/FKq77AFS7ZLR/MNNzA7Fx4UyVUIZIhgD
 /5UxbplkXVVc+U1umJc8A6DDmxPC6JIyZlmVhDpmwif47s31db8zQFc1/rcgWsSgJit8
 36og==
X-Gm-Message-State: AOJu0YyQFKi3VGGMmP8Pon/IfTfCOxJhft14OrdvXVDhHVMKWrmZMCAs
 sb/fvQEmCewmKATrS5QUyljuv4z4OYk=
X-Google-Smtp-Source: AGHT+IEA2uKQglC1q1+fm5HpwiH9jt3xmod4AMvHytUdaEYipFclxFL8COWFp4rJ5jK0OvtC1G3qng==
X-Received: by 2002:a05:600c:6907:b0:40b:5e4a:2344 with SMTP id
 fo7-20020a05600c690700b0040b5e4a2344mr6675695wmb.70.1702669820174; 
 Fri, 15 Dec 2023 11:50:20 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 f10-20020adff8ca000000b003365951cef9sm1314939wrq.55.2023.12.15.11.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 11:50:19 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 15 Dec 2023 20:50:14 +0100
Message-Id: <20231215195015.2356-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702669820; x=1703274620; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=riN8OmZsG0ou+5yfUai27PO2WvVCixdDD70cfsonE5M=;
 b=eZCI6EUTAml0oCpOug3TjRj3xHNEeyfyxcV7T9rrxe+QdORcP7yjHSCjCBXJRvaktx
 qrcCEky18HwNhrFFt47pJ88AyUZUtY0KzIN6tkuK4axNIFUuWv2XBBph60xwECYJPKEw
 sKqEcsKAQv6o/HtF1j+1ksR+UYdgVbhrL6IIi/X2aRdF6ht02ypU8Sl0L40xVvHFEKXb
 cXBiO/U+LiiRyyFt+nzQkdQcS0XFOpIS68HGg57EQotVMqND5LrlOMtlxNNgUh1VrP3M
 Zuq1Ubp5CSn3eLmv43Ki01q+3q5p4meAmH582dJUVe5AfJWHF9gOQ41GdawQFzhK+49o
 LNxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eZCI6EUT
Subject: [Buildroot] [PATCH 1/2] package/lua-ansicolors: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                          |  1 +
 package/lua-ansicolors/Config.in           |  6 ++++++
 package/lua-ansicolors/lua-ansicolors.hash |  3 +++
 package/lua-ansicolors/lua-ansicolors.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/lua-ansicolors/Config.in
 create mode 100644 package/lua-ansicolors/lua-ansicolors.hash
 create mode 100644 package/lua-ansicolors/lua-ansicolors.mk

diff --git a/package/Config.in b/package/Config.in
index 5a3410d75..e52360448 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -715,6 +715,7 @@ menu "Lua libraries/modules"
 	source "package/lpty/Config.in"
 	source "package/lrandom/Config.in"
 	source "package/lsqlite3/Config.in"
+	source "package/lua-ansicolors/Config.in"
 	source "package/lua-argon2/Config.in"
 	source "package/lua-augeas/Config.in"
 	source "package/lua-basexx/Config.in"
diff --git a/package/lua-ansicolors/Config.in b/package/lua-ansicolors/Config.in
new file mode 100644
index 000000000..33ffdde72
--- /dev/null
+++ b/package/lua-ansicolors/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_ANSICOLORS
+	bool "lua-ansicolors"
+	help
+	  Library for color Manipulation.
+
+	  https://github.com/kikito/ansicolors.lua
diff --git a/package/lua-ansicolors/lua-ansicolors.hash b/package/lua-ansicolors/lua-ansicolors.hash
new file mode 100644
index 000000000..53208afae
--- /dev/null
+++ b/package/lua-ansicolors/lua-ansicolors.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  df6126501af3b9b944019164a08aed91377d82e6845c24432769140f12c815d6  ansicolors-1.0.2-3.src.rock
+sha256  cf2980c520ea89935bbe8a5415c5e0ff2606ffc7a89d6854796d856fa066c48e  ansicolors.lua-1.0.2/COPYING
diff --git a/package/lua-ansicolors/lua-ansicolors.mk b/package/lua-ansicolors/lua-ansicolors.mk
new file mode 100644
index 000000000..5879b66e6
--- /dev/null
+++ b/package/lua-ansicolors/lua-ansicolors.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-ansicolors
+#
+################################################################################
+
+LUA_ANSICOLORS_VERSION_UPSTREAM = 1.0.2
+LUA_ANSICOLORS_VERSION = $(LUA_ANSICOLORS_VERSION_UPSTREAM)-3
+LUA_ANSICOLORS_NAME_UPSTREAM = ansicolors
+LUA_ANSICOLORS_SUBDIR = ansicolors.lua-$(LUA_ANSICOLORS_VERSION_UPSTREAM)
+LUA_ANSICOLORS_LICENSE = MIT
+LUA_ANSICOLORS_LICENSE_FILES = $(LUA_ANSICOLORS_SUBDIR)/COPYING
+
+$(eval $(luarocks-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

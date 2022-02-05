Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCA6C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 23:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B0FF401F6;
	Sat,  5 Feb 2022 23:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9JfLP_XV-AlE; Sat,  5 Feb 2022 23:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D577401D2;
	Sat,  5 Feb 2022 23:03:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC7E61BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BADFB401D2
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 23:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LaUWnpQwf1WX for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 23:03:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAC34401CB
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 23:03:05 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id s18so12123529ioa.12
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 15:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YA0mcJ+9kgH3eRo4JgVzn8JNKQHaf8FLIS2J2d+AWjE=;
 b=JiVJzY6RK4addfIrm0xMBqVkItMtk4rnUJG3mvYdB6lEf/Zen9NYhYTLZzSfkcT/si
 hApU7uhcSDGZZO/4rtyDYEXArymo8oOvoBzgbwellRYXkdDe44ny49I8flTplwRLADzb
 kaQszpKjlxRNXnOCkRJ4T7v7QQFzd/Kgv1fG76KZaEJB3oSRjIiqBmN6jgrgs8L5Eur2
 dehzOXTH+1FS5GBLkZOPi8mk5FEACLFSzL6Yp1AOna3wJjUSjT2yfVjns7aY3bwPJpJx
 lAV2txWWyewfbnrqQkCijhXM47j8L/5J2YP0I+dV/qGu8j0VlzpQT5JiKy3C2YrX9bzd
 NFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YA0mcJ+9kgH3eRo4JgVzn8JNKQHaf8FLIS2J2d+AWjE=;
 b=pq+pt8Je7DDlO1J/1vvInPNFltaXrMyVMtjRSo0g+PmeVYN/sZXK7yaYe2oa4Azn41
 wvu0obdl7n4NiVXBuY//dSkucOIgrcXJ3Cyj4v1smafanVx1peCwZr5CgUJdULhX0lMF
 YhtPaPXXzaKOgMWpfkvjnwNBwXR3T8JcHlx18HDGgnvlOMnlN/OEm3ibU0YFGtViPNFl
 YPvpYw98tO2tdjbXqBY6d2fW3DwwIDxNW5yLCkkMPu9KZVoF3XTTl786VQq31mruYqZL
 qhgD6xQlNug0hH/puyRP6yP1lPgLBRFsI0MqybFlKFZ/ARiN3EyC7Es/nBMyU2FzEAl2
 deSQ==
X-Gm-Message-State: AOAM532HRoOh0W8MVUvUaG4NmtZbDSIc+FA/NJQ9iZLp3Blr38EV7rcW
 hgDS5t7Oe/LTrEW/lQPynJjiVf2cJZo=
X-Google-Smtp-Source: ABdhPJx5dWFpNix7k61MmxudD11EMywjsTqEAY9Gg+1YeI3YsMZ31a63RYcbWZBrkoZC933GcovviQ==
X-Received: by 2002:a05:6602:2e90:: with SMTP id
 m16mr2573939iow.74.1644102184541; 
 Sat, 05 Feb 2022 15:03:04 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id n23sm3062348ioo.55.2022.02.05.15.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 15:03:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 16:03:01 -0700
Message-Id: <20220205230302.3837382-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/wayland-protocols: bump to version
 1.25
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...and-scanner-is-only-needed-for-tests.patch | 42 -------------------
 .../wayland-protocols/wayland-protocols.hash  |  8 ++--
 .../wayland-protocols/wayland-protocols.mk    |  2 +-
 3 files changed, 5 insertions(+), 47 deletions(-)
 delete mode 100644 package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch

diff --git a/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch b/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch
deleted file mode 100644
index ff3ec5719c..0000000000
--- a/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 80e97bd00bf6263845aa98b411507baba28be67e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 19 Sep 2021 11:01:00 +0200
-Subject: [PATCH] meson.build: wayland-scanner is only needed for tests
-
-wayland-scanner is only needed for tests so don't require it if tests
-are disabled
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://gitlab.freedesktop.org/wayland/wayland-protocols/-/commit/80e97bd00bf6263845aa98b411507baba28be67e]
----
- meson.build       | 2 --
- tests/meson.build | 1 +
- 2 files changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 94b49e7..15dbc37 100644
---- a/meson.build
-+++ b/meson.build
-@@ -8,8 +8,6 @@ wayland_protocols_version = meson.project_version()
- 
- fs = import('fs')
- 
--dep_scanner = dependency('wayland-scanner', native: true)
--
- stable_protocols = [
- 	'presentation-time',
- 	'viewporter',
-diff --git a/tests/meson.build b/tests/meson.build
-index 66337e7..74824ae 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -1,4 +1,5 @@
- prog_scan_sh = find_program('scan.sh')
-+dep_scanner = dependency('wayland-scanner', native: true)
- prog_scanner = find_program(dep_scanner.get_pkgconfig_variable('wayland_scanner'))
- 
- libwayland = [
--- 
-GitLab
-
diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index b76bafb437..1262f0f9d7 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041979.html
-md5  31a6c469718db37d2688109e548506e4  wayland-protocols-1.23.tar.xz
-sha1  8c4ebdce35953b1e2af458c139a432a308af6f50  wayland-protocols-1.23.tar.xz
-sha256  6c0af1915f96f615927a6270d025bd973ff1c58e521e4ca1fc9abfc914633f76  wayland-protocols-1.23.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-January/042102.html
+md5  0c192bf32de09ec30de4a82d1c65329c  wayland-protocols-1.25.tar.xz
+sha1  275298332d124e40e345aa82bc8f48ef8cad3480  wayland-protocols-1.25.tar.xz
+sha256  f1ff0f7199d0a0da337217dd8c99979967808dc37731a1e759e822b75b571460  wayland-protocols-1.25.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 41ab1e1c99..746d82e308 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.23
+WAYLAND_PROTOCOLS_VERSION = 1.25
 WAYLAND_PROTOCOLS_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

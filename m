Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC48EED60F
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BBAB40776;
	Thu,  1 Jan 2026 15:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqiNcw0QGhym; Thu,  1 Jan 2026 15:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 131C1407FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767280075;
	bh=jFizQY1D9mDNiaDST7aYp207Md1tzIwnRbR5rNeN6bE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZD87yT8VXpqGcar3qN5pYgynYFJmzJKMiRIvIge7giUtzvkHYGCqXF0lezWF0XMU0
	 1TlsCaUISqz5yQ8/lAGpxhocBAAJP0Tob0zbwBwnV/MQagSEOgr/FHCikOeJ7yXL0i
	 LHwNfZ8p8NVXo4xlPooQns4Gqi2xLrOMem0PYjFA9hp0A9RN2ldinzL2hcvtOl0vtz
	 6GBTDK/e5ltIsLyopAqJ4iF0DnmxO8Wzsn0fjqt+VWh3J5Bw/5TdMplguNSmy45/MR
	 QvZw89zDf3emzyJHJKCT1PGJ7q9XMKkLpnhAGaXW2pvz5hc3GNH4MiggMqLyPFj2bJ
	 vunDHFoi2Znrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 131C1407FA;
	Thu,  1 Jan 2026 15:07:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78F0D438
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F7B160786
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Of4heX5KzV7b for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97BB760781
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97BB760781
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:07:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8938B87DD1; Thu,  1 Jan 2026 15:07:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 15:49:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25b5ecf30bd652c8164359d1eaee4dfd3d2ea44d
X-Git-Newrev: 486801db070e201b68220c347812fedd8225eb8c
X-Patchwork-Hint: ignore
Message-Id: <20260101150751.8938B87DD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-tools: bump to version 2.14.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4120502835366867475=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4120502835366867475==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=486801db070e201b68220c347812fedd8225eb8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The changelog for lttng-tools 2.14.0 can be found here:

  https://git.lttng.org/?p=lttng-tools.git;a=blob;f=ChangeLog;h=fc88591423cc856360172165418e8ef7159ab24e;hb=refs/heads/stable-2.14

Signed-off-by: Devin Steffler <devin.buildroot@gmail.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd: bumped to 2.14.0, added patch 0002 to fix musl build, updated
 link to changelog]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ....cpp-Remove-the-scope-resolution-operator.patch | 48 ++++++++++++++++++++++
 package/lttng-tools/lttng-tools.hash               |  4 +-
 package/lttng-tools/lttng-tools.mk                 |  2 +-
 3 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/package/lttng-tools/0002-Fix-eventfd.cpp-Remove-the-scope-resolution-operator.patch b/package/lttng-tools/0002-Fix-eventfd.cpp-Remove-the-scope-resolution-operator.patch
new file mode 100644
index 0000000000..d4b46d3a5a
--- /dev/null
+++ b/package/lttng-tools/0002-Fix-eventfd.cpp-Remove-the-scope-resolution-operator.patch
@@ -0,0 +1,48 @@
+From d94d2b90c5148c4d83f1424b6e984044f2d8191f Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 24 Jul 2025 14:35:51 +0800
+Subject: [PATCH] Fix: eventfd.cpp: Remove the scope resolution operator
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Remove the scope resolution operator :: to fix the below build failure
+with musl.
+ | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
+ |    18 |                 int flags = ::EFD_CLOEXEC;
+ |       |                               ^~~~~~~~~~~
+ | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
+ |    21 |                         flags |= ::EFD_SEMAPHORE;
+ |       |                                    ^~~~~~~~~~~~~
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+Signed-off-by: JÃ©rÃ©mie Galarneau <jeremie.galarneau@efficios.com>
+Change-Id: I405f6f15a25f7e6b7f0676093091a9e8a384739d
+
+Upstream: https://git.lttng.org/?p=lttng-tools.git;a=commitdiff;h=d94d2b90c5148c4d83f1424b6e984044f2d8191f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/common/eventfd.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/common/eventfd.cpp b/src/common/eventfd.cpp
+index d331bbe40..447520f25 100644
+--- a/src/common/eventfd.cpp
++++ b/src/common/eventfd.cpp
+@@ -15,10 +15,10 @@
+ 
+ lttng::eventfd::eventfd(bool use_semaphore_semantics, std::uint64_t initial_value) :
+ 	file_descriptor([use_semaphore_semantics, initial_value]() {
+-		int flags = ::EFD_CLOEXEC;
++		int flags = EFD_CLOEXEC;
+ 
+ 		if (use_semaphore_semantics) {
+-			flags |= ::EFD_SEMAPHORE;
++			flags |= EFD_SEMAPHORE;
+ 		}
+ 
+ 		const auto raw_fd = ::eventfd(initial_value, flags);
+-- 
+2.47.3
+
diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index b48904d0b9..a181cd6dc0 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-tools/lttng-tools-2.13.8.tar.bz2.sha256
-sha256  b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1  lttng-tools-2.13.8.tar.bz2
+# From https://lttng.org/files/lttng-tools/lttng-tools-2.14.0.tar.bz2.sha256
+sha256  d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3  lttng-tools-2.14.0.tar.bz2
 
 # Locally computed
 sha256  068e55c7dbe597400199aee75ac5e71bdb2ca88c4c9a4cfa8e1fbc61f933eda5  LICENSE
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index add1f12a8c..9a66ede669 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.13.8
+LTTNG_TOOLS_VERSION = 2.14.0
 LTTNG_TOOLS_SITE = https://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_INSTALL_STAGING = YES

--===============4120502835366867475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4120502835366867475==--

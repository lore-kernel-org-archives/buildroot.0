Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01AFCAC597
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 09:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 851536133E;
	Sat, 20 Sep 2025 09:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksRnY-xhkUKY; Sat, 20 Sep 2025 09:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A48DB615D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A48DB615D2;
	Sat, 20 Sep 2025 09:11:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26EAFE7
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D2F24141A
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yxnw2y9-fjbi for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 09:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11D5F41405
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11D5F41405
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 09:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFC3E85D09; Sat, 20 Sep 2025 09:11:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Sep 2025 20:52:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f0a9596e35dfdcdc82dce1a2e16a74974d3e4d9
X-Git-Newrev: 36357247d5826386b57de8c8cf5d16ca3d471789
X-Patchwork-Hint: ignore
Message-Id: <20250920091134.EFC3E85D09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: add patch for CVE-2025-6375
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=36357247d5826386b57de8c8cf5d16ca3d471789
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following vulnerability:

- CVE-2025-6375:

A vulnerability was found in poco up to 1.14.1. It has been rated as
problematic. Affected by this issue is the function MultipartInputStream
of the file Net/src/MultipartReader.cpp. The manipulation leads to null
pointer dereference. The attack needs to be approached locally. The
exploit has been disclosed to the public and may be used. Upgrading to
version 1.14.2 is able to address this issue. The patch is identified as
6f2f85913c191ab9ddfb8fae781f5d66afccf3bf. It is recommended to upgrade
the affected component.

For more information see:
  - https://nvd.nist.gov//vuln/detail/CVE-2025-6375
  - https://github.com/pocoproject/poco/commit/6f2f85913c191ab9ddfb8fae781f5d66afccf3bf

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch | 34 ++++++++++++++++++++++
 package/poco/poco.mk                               |  3 ++
 2 files changed, 37 insertions(+)

diff --git a/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch b/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
new file mode 100644
index 0000000000..cfb22d690a
--- /dev/null
+++ b/package/poco/0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
@@ -0,0 +1,34 @@
+From 6f2f85913c191ab9ddfb8fae781f5d66afccf3bf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?G=C3=BCnter=20Obiltschnig?= <guenter.obiltschnig@appinf.com>
+Date: Wed, 16 Apr 2025 09:15:33 +0200
+Subject: [PATCH] fix(Net): A SEGV at Net/src/MultipartReader.cpp:164:1 #4915
+ (move assertion out of ctor)
+
+Upstream: https://github.com/pocoproject/poco/commit/6f2f85913c191ab9ddfb8fae781f5d66afccf3bf
+CVE: CVE-2025-6375
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ Net/src/MultipartReader.cpp | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Net/src/MultipartReader.cpp b/Net/src/MultipartReader.cpp
+index f3a2f2bba2..f4aa27dd86 100644
+--- a/Net/src/MultipartReader.cpp
++++ b/Net/src/MultipartReader.cpp
+@@ -36,7 +36,6 @@ MultipartStreamBuf::MultipartStreamBuf(std::istream& istr, const std::string& bo
+ 	_boundary(boundary),
+ 	_lastPart(false)
+ {
+-	poco_assert (!boundary.empty() && boundary.length() < STREAM_BUFFER_SIZE - 6);
+ }
+ 
+ 
+@@ -47,7 +46,7 @@ MultipartStreamBuf::~MultipartStreamBuf()
+ 
+ int MultipartStreamBuf::readFromDevice(char* buffer, std::streamsize length)
+ {
+-	poco_assert_dbg (length >= _boundary.length() + 6);
++	poco_assert (!_boundary.empty() && _boundary.length() < length - 6);
+ 
+ 	static const int eof = std::char_traits<char>::eof();
+ 	std::streambuf& buf = *_istr.rdbuf();
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index ee740b2377..f7d9cdc009 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -11,6 +11,9 @@ POCO_LICENSE_FILES = LICENSE
 POCO_CPE_ID_VENDOR = pocoproject
 POCO_INSTALL_STAGING = YES
 
+# 0001-fix-Net-A-SEGV-at-Net-src-MultipartReader-cpp.patch
+POCO_IGNORE_CVES += CVE-2025-6375
+
 POCO_DEPENDENCIES = \
 	pcre2 \
 	zlib \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

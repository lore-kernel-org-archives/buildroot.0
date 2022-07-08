Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6314EC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 20:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFACF846AB;
	Fri,  8 Jul 2022 20:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFACF846AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mWt9xIGwoapV; Fri,  8 Jul 2022 20:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE62A83E81;
	Fri,  8 Jul 2022 20:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE62A83E81
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6FE1BF322
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 20:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7777661465
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 20:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7777661465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hj12Qv6PgdiC for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 20:26:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 826876005E
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 20:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 826876005E
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 362338360F; Fri,  8 Jul 2022 20:13:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Jul 2022 22:25:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76625df05206fab6948df411d6133c3ed499701b
X-Git-Newrev: 5f966716569ad0b133ae40662d3f5817e09fa313
X-Patchwork-Hint: ignore
Message-Id: <20220708201301.362338360F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: bump to version 1.4.65
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5f966716569ad0b133ae40662d3f5817e09fa313
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove upstream patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...002-build-meson-fix-typo-in-variable-name.patch | 25 ----------------------
 package/lighttpd/lighttpd.hash                     |  4 ++--
 package/lighttpd/lighttpd.mk                       |  2 +-
 3 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch b/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch
deleted file mode 100644
index d338979d46..0000000000
--- a/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 876a1e1b2cc21282a0df5245004197cdffe1d380 Mon Sep 17 00:00:00 2001
-From: Glenn Strauss <gstrauss@gluelogic.com>
-Date: Thu, 20 Jan 2022 07:04:51 -0500
-Subject: [PATCH] [build] meson: fix typo in variable name
-
-[Retrieved from:
-https://github.com/lighttpd/lighttpd1.4/commit/876a1e1b2cc21282a0df5245004197cdffe1d380]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 4ee163468..b35c1037f 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -266,7 +266,7 @@ endif
- libbrotli = []
- if get_option('with_brotli')
- 	libbrotli = [ compiler.find_library('brotlienc') ]
--	if compiler.has_function('BrotliEncoderCreateInstance', args: defs, dependencies: libbrotlienc, prefix: '#include <brotli/encode.h>')
-+	if compiler.has_function('BrotliEncoderCreateInstance', args: defs, dependencies: libbrotli, prefix: '#include <brotli/encode.h>')
- 		conf_data.set('HAVE_BROTLI_ENCODE_H', true)
- 		conf_data.set('HAVE_BROTLI', true)
- 	else
diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index ce026b9b4a..0b4310aa72 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.64.sha512sum
-sha512  8e2ad0830ff80fcebf0c33600caafb5ab4e9ff6b5073c12572f88a44fdfe85f777fa8b22b2fc2964fecbeb556997ad660867dcee80efb224d63329c8b18ea936  lighttpd-1.4.64.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.65.sha512sum
+sha512  e9ecb3e99dd5cd0efbf98cfc937f0cfcfafe712ab0e6c11f9cdee936c508820cd8de06ef03d2f888dab19a842eebae342a83818e601dd21094f154832acb69ec  lighttpd-1.4.65.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 595c59cb37..bedb9c8f33 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).64
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).65
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

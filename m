Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9573BC433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EE7284323;
	Tue, 15 Mar 2022 20:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3D7m1xykSBF; Tue, 15 Mar 2022 20:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A048842C5;
	Tue, 15 Mar 2022 20:20:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 011F41BF31E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2572415B5
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2-0HdH3A0P7 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:18:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94D14415BB
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:18:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BCC3483F84; Tue, 15 Mar 2022 20:10:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 20:54:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2106f02bae984e97bc151fe47de0a792b84919a7
X-Git-Newrev: b9391c7dd21dee3eff04e665bf6a92ef6fc5f234
X-Patchwork-Hint: ignore
Message-Id: <20220315201012.BCC3483F84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valijson: drop boost dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9391c7dd21dee3eff04e665bf6a92ef6fc5f234
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

boost is not mandatory since the deactivation of tests when bumping to
version 0.2.0 in commit d8e2876104be3f9f01613b17d3e60120883be1a1 and
https://github.com/tristanpenman/valijson/commit/1844241d2a2379bca79a0d654f4b007209b10883

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/valijson/Config.in   | 8 ++------
 package/valijson/valijson.mk | 1 -
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/valijson/Config.in b/package/valijson/Config.in
index 10721b3703..07706cd963 100644
--- a/package/valijson/Config.in
+++ b/package/valijson/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_VALIJSON
 	bool "valijson"
-	depends on BR2_USE_WCHAR
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_REGEX
 	help
 	  Valijson is a header-only JSON Schema Validation library for
 	  C++. Valijson provides a simple validation API that allows
@@ -14,5 +10,5 @@ config BR2_PACKAGE_VALIJSON
 
 	  https://github.com/tristanpenman/valijson
 
-comment "valijson needs a toolchain w/ C++, threads, wchar  support"
-	depends on !BR2_INSTALL_LIBSTDCPP  || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+comment "valijson needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index e425757d26..71c5b05f2b 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -11,7 +11,6 @@ VALIJSON_LICENSE_FILES = LICENSE
 VALIJSON_CPE_ID_VENDOR = valijson_project
 VALIJSON_INSTALL_STAGING = YES
 VALIJSON_INSTALL_TARGET = NO
-VALIJSON_DEPENDENCIES = boost
 VALIJSON_CONF_OPTS = -Dvalijson_INSTALL_HEADERS=TRUE -Dvalijson_BUILD_TESTS=FALSE
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

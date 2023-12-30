Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA54C4706F
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAF9060F24;
	Sat, 30 Dec 2023 18:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF9060F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqVUlD34jicu; Sat, 30 Dec 2023 18:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB5E61033;
	Sat, 30 Dec 2023 18:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB5E61033
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7EC21BF86B
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A199660FBA
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A199660FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_E5hQswbtGg for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:01:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B62AD60797
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B62AD60797
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E859839D5; Sat, 30 Dec 2023 18:01:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 18:57:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0040b2ec0f4829f6d0e30ecea3ba24d424ef1980
X-Git-Newrev: 075554bbb828c0a67990cd933d9b3d7557454440
X-Patchwork-Hint: ignore
Message-Id: <20231230180136.9E859839D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libostree: switch to libsoup3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=075554bbb828c0a67990cd933d9b3d7557454440
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsoup3 is supported since bump to version 2023.3 in commit
618eb375a046cc4ff007758510c883788e6ff690 and
https://github.com/ostreedev/ostree/commit/d0ea2db4300eb7871b59d0b997a7f06869120297

So switch to libsoup3 and drop libsoup2 as:
 - libsoup2 is unmaintained (as stated by commit
   b45c2a048d02a0e30da8534b5c048d048b252452)
 - libsoup2 will be removed at some point (as stated by commit
   f93380ab1a36bdd019cfbc651a9df5904096e189)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libostree/libostree.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index d13f484041..a737dc047f 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -17,6 +17,7 @@ LIBOSTREE_CONF_ENV = \
 	GPG_ERROR_CONFIG=$(STAGING_DIR)/usr/bin/gpg-error-config
 LIBOSTREE_CONF_OPTS += \
 	--with-gpgme-prefix=$(STAGING_DIR)/usr \
+	--without-soup \
 	--disable-gtk-doc \
 	--disable-gtk-doc-html \
 	--disable-gtk-doc-pdf \
@@ -44,10 +45,10 @@ else
 LIBOSTREE_CONF_OPTS += --without-avahi
 endif
 
-#cURL support depends on libsoup
-ifeq ($(BR2_PACKAGE_LIBSOUP),y)
-LIBOSTREE_CONF_OPTS += --with-soup
-LIBOSTREE_DEPENDENCIES += libsoup
+# cURL support depends on libsoup3
+ifeq ($(BR2_PACKAGE_LIBSOUP3),y)
+LIBOSTREE_CONF_OPTS += --with-soup3
+LIBOSTREE_DEPENDENCIES += libsoup3
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBOSTREE_CONF_OPTS += --with-curl
 LIBOSTREE_DEPENDENCIES += libcurl
@@ -55,7 +56,7 @@ else
 LIBOSTREE_CONF_OPTS += --without-curl
 endif
 else
-LIBOSTREE_CONF_OPTS += --without-soup --without-curl
+LIBOSTREE_CONF_OPTS += --without-soup3 --without-curl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

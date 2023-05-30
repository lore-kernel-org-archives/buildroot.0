Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B821C77B73
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 19:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF851417C8;
	Tue, 30 May 2023 19:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF851417C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F4P_PVhGlDXV; Tue, 30 May 2023 19:45:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C19B4173C;
	Tue, 30 May 2023 19:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C19B4173C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9C231BF966
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C126340579
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C126340579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oseV1dlxzQ4T for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 19:44:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87EE940181
 for <buildroot@buildroot.org>; Tue, 30 May 2023 19:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87EE940181
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7396186A92; Tue, 30 May 2023 19:44:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 21:23:25 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c6452ab1673bb8a965a9cac65928bd95b35267ef
X-Git-Newrev: 23ac9f2a6e121eae576b9adbb565aafb1a1d3966
X-Patchwork-Hint: ignore
Message-Id: <20230530194424.7396186A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libcurl: disable
 NTLM support definitely
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

commit: https://git.buildroot.net/buildroot/commit/?id=23ac9f2a6e121eae576b9adbb565aafb1a1d3966
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- do not only disable NTLM delegation to winbinds ntlm_auth but
  disable NTLM support overall (and drop enforced libopenssl DES
  dependency introduced by 'package/libcurl: make sure openssl
  supports DES' (commit f25c820a4f93ad0ca7eaf5e504667bd4099b878c)
- change man page hint to https URL
- rearrange configure options to one option per line

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7b1a980465452af44636b06197abe1835da9ed9f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/Config.in  |  1 -
 package/libcurl/libcurl.mk | 21 ++++++++++++++-------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 218309ed56..adab1ca3e6 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -57,7 +57,6 @@ choice
 config BR2_PACKAGE_LIBCURL_OPENSSL
 	bool "OpenSSL"
 	depends on BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 
 config BR2_PACKAGE_LIBCURL_BEARSSL
 	bool "BearSSL"
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a5313e686f..0f7ae640f6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -16,15 +16,22 @@ LIBCURL_CPE_ID_VENDOR = haxx
 LIBCURL_CPE_ID_PRODUCT = libcurl
 LIBCURL_INSTALL_STAGING = YES
 
-# We disable NTLM support because it uses fork(), which doesn't work
-# on non-MMU platforms. Moreover, this authentication method is
-# probably almost never used. See
-# http://curl.se/docs/manpage.html#--ntlm.
+# We disable NTLM delegation to winbinds ntlm_auth ('--disable-ntlm-wb')
+# support because it uses fork(), which doesn't work on non-MMU platforms.
+# Moreover, this authentication method is probably almost never used (see
+# https://curl.se/docs/manpage.html#--ntlm), so disable NTLM support overall.
+#
 # Likewise, there is no compiler on the target, so libcurl-option (to
 # generate C code) isn't very useful
-LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
-	--with-random=/dev/urandom --disable-curldebug \
-	--disable-libcurl-option --disable-ldap --disable-ldaps
+LIBCURL_CONF_OPTS = \
+	--disable-manual \
+	--disable-ntlm \
+	--disable-ntlm-wb \
+	--with-random=/dev/urandom \
+	--disable-curldebug \
+	--disable-libcurl-option \
+	--disable-ldap \
+	--disable-ldaps
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

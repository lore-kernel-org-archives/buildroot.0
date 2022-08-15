Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE045ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60AB260F64;
	Sun, 11 Sep 2022 08:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60AB260F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbK7MvWeO-in; Sun, 11 Sep 2022 08:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D61E6103B;
	Sun, 11 Sep 2022 08:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D61E6103B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 025551BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 276F983ECB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 276F983ECB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTBtAQII54he for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2039783EBF
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2039783EBF
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 09F97835E4; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:50:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ae900bcf965b79982a8780d5010ee512576a735
X-Git-Newrev: 4990cf7a599f41324b91e946f81a9f836e14469e
X-Patchwork-Hint: ignore
Message-Id: <20220911084824.09F97835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: bump version to 3.2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=4990cf7a599f41324b91e946f81a9f836e14469e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix https://nvd.nist.gov/vuln/detail/CVE-2022-29154

Remove 0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch, applied to master:
https://github.com/WayneD/rsync/commit/c3f7414c450faaf6a8281cc4a4403529aeb7d859

remove 0002-Handle-linking-with-a-zlib-with-external-read_buf.patch b/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch, applied to naster:
https://github.com/WayneD/rsync/commit/60dd42be603a79cd57cec076fe1680e9037be774

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ame-in-the-certificate-when-using-openssl.patch | 29 ----------------------
 ...inking-with-a-zlib-with-external-read_buf.patch | 27 --------------------
 package/rsync/rsync.hash                           |  6 ++---
 package/rsync/rsync.mk                             |  2 +-
 4 files changed, 4 insertions(+), 60 deletions(-)

diff --git a/package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch b/package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
deleted file mode 100644
index 13edeff944..0000000000
--- a/package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c3f7414c450faaf6a8281cc4a4403529aeb7d859 Mon Sep 17 00:00:00 2001
-From: Matt McCutchen <matt@mattmccutchen.net>
-Date: Wed, 26 Aug 2020 12:16:08 -0400
-Subject: [PATCH] rsync-ssl: Verify the hostname in the certificate when using
- openssl.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://git.samba.org/?p=rsync.git;a=commitdiff;h=c3f7414c450faaf6a8281cc4a4403529aeb7d859]
----
- rsync-ssl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rsync-ssl b/rsync-ssl
-index 8101975a..46701af1 100755
---- a/rsync-ssl
-+++ b/rsync-ssl
-@@ -129,7 +129,7 @@ function rsync_ssl_helper {
-     fi
- 
-     if [[ $RSYNC_SSL_TYPE == openssl ]]; then
--	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -connect $hostname:$port
-+	exec $RSYNC_SSL_OPENSSL s_client $caopt $certopt -quiet -verify_quiet -servername $hostname -verify_hostname $hostname -connect $hostname:$port
-     elif [[ $RSYNC_SSL_TYPE == gnutls ]]; then
- 	exec $RSYNC_SSL_GNUTLS --logfile=/dev/null $gnutls_cert_opt $gnutls_opts $hostname:$port
-     else
--- 
-2.25.1
-
diff --git a/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch b/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch
deleted file mode 100644
index 0af090732c..0000000000
--- a/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 60dd42be603a79cd57cec076fe1680e9037be774 Mon Sep 17 00:00:00 2001
-From: Wayne Davison <wayne@opencoder.net>
-Date: Mon, 11 Apr 2022 08:29:54 -0700
-Subject: [PATCH] Handle linking with a zlib with external read_buf.
-
-[Retrieved from:
-https://github.com/WayneD/rsync/commit/60dd42be603a79cd57cec076fe1680e9037be774]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- rsync.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/rsync.h b/rsync.h
-index 4b30570b..e5aacd25 100644
---- a/rsync.h
-+++ b/rsync.h
-@@ -1172,6 +1172,10 @@ struct name_num_obj {
- 	struct name_num_item list[10]; /* we'll get a compile error/warning if this is ever too small */
- };
- 
-+#ifdef EXTERNAL_ZLIB
-+#define read_buf read_buf_
-+#endif
-+
- #ifndef __cplusplus
- #include "proto.h"
- #endif
diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 92f6156ba8..f0ba4d321d 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/rsync/src/rsync-3.2.3.tar.gz.asc
-sha256  becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e  rsync-3.2.3.tar.gz
+# https://download.samba.org/pub/rsync/src/rsync-3.2.5.tar.gz.asc
+sha256  2ac4d21635cdf791867bc377c35ca6dda7f50d919a58be45057fd51600c69aba  rsync-3.2.5.tar.gz
 # Locally calculated
-sha256  0d33aa97d302cb9df27f99dfa28d58001c2479a02317956f1a7a890f3937a976  COPYING
+sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 5b51ca1df7..d2c772a75a 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.2.3
+RSYNC_VERSION = 3.2.5
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

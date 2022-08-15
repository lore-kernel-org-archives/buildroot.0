Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAC6C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 04:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA7D83F8D;
	Mon, 15 Aug 2022 04:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EA7D83F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1pGpoitaRSk; Mon, 15 Aug 2022 04:06:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69F6783F86;
	Mon, 15 Aug 2022 04:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69F6783F86
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9691BF301
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 04:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0780260E56
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 04:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0780260E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8QEC-kB1XIvn for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 04:06:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BD1E60E55
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BD1E60E55
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 04:06:10 +0000 (UTC)
Date: Mon, 15 Aug 2022 04:06:02 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <OnXRv428u0aogON15S-eaYq1e-8O0pEK8Ul7AshrDFTo6BbyTTGBdXgiYGzOMtmsIf0eluZocPSIya_d2i2LimqdcrK5eEGaQ5SdOwIppSg=@protonmail.com>
Feedback-ID: 6956783:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=protonmail.com; 
 s=protonmail3; t=1660536367; x=1660795567;
 bh=WnQRxhwYxO1be/lUFtQoADMWZwVjUlqED/q/kcalNw0=;
 h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
 Date:Subject:Reply-To:Feedback-ID:Message-ID;
 b=F4bw7pfOmFaHQFoD99EmQqFjr3erCpVer01s9DOnB81DD5eRLDGi9sEWB4HffCCQ6
 9VDqKit4MY9GGN1OuQSorp1RAuGv4dBWiKc84KeIt4XRHkm0OXiOHCWe8j6aCkaP+U
 5617T8hCMfh/HnsBROiELJ3wkeoqQdqf+iP39Qe7VH3Bd+bMCX2AtVWsVtNDPUts9J
 86tsLKsrlj1K9/qWr9v0rVZmrWL5uKXPw91J7adCoR7muMpK9jWgtRArY0GZcYrheq
 L2A//hZKV1KtSUWqmvTZnABh+bKGJiQNis16YeYjdyYNrwdGJm9AwU96faHqN1CCuF
 bmor/pRPwxaNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=F4bw7pfO
Subject: [Buildroot] [PATCH 1/1] package/rsync: bump version to 3.2.5
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
From: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
Reply-To: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix https://nvd.nist.gov/vuln/detail/CVE-2022-29154

Remove 0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch, applied to master:
https://github.com/WayneD/rsync/commit/c3f7414c450faaf6a8281cc4a4403529aeb7d859

remove 0002-Handle-linking-with-a-zlib-with-external-read_buf.patch b/package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch, applied to naster:
https://github.com/WayneD/rsync/commit/60dd42be603a79cd57cec076fe1680e9037be774

Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
---
 ...n-the-certificate-when-using-openssl.patch | 29 -------------------
 ...g-with-a-zlib-with-external-read_buf.patch | 27 -----------------
 package/rsync/rsync.hash                      |  6 ++--
 package/rsync/rsync.mk                        |  2 +-
 4 files changed, 4 insertions(+), 60 deletions(-)
 delete mode 100644 package/rsync/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-when-using-openssl.patch
 delete mode 100644 package/rsync/0002-Handle-linking-with-a-zlib-with-external-read_buf.patch

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
-- 
2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

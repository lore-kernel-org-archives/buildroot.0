Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25FEC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:30:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A851261102
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 21:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A851261102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79A1780F8C;
	Fri, 20 Aug 2021 21:30:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6oKKOGJsJfoZ; Fri, 20 Aug 2021 21:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AC4980FFE;
	Fri, 20 Aug 2021 21:30:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BCFE1BF304
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A2DE42517
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 21:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fS0QbpgRBDqR for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 21:30:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D8A04254B
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 21:30:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A3644877C9; Fri, 20 Aug 2021 21:29:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 23:27:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cfaf5e23ea63291b1fb0debfec9204a10e1451b
X-Git-Newrev: 181a5e229b347c1996eeca7d7727ee66bc566f01
X-Patchwork-Hint: ignore
Message-Id: <20210820212915.A3644877C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libressl: always expose
 SSL_OP_NO_TLSv1_3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=181a5e229b347c1996eeca7d7727ee66bc566f01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the build of vsftpd 3.0.4

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-always-expose-SSL_OP_NO_TLSv1_3.patch     | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
new file mode 100644
index 0000000000..f34ae85834
--- /dev/null
+++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
@@ -0,0 +1,37 @@
+always expose SSL_OP_NO_TLSv1_3
+
+like in OpenSSL, see https://github.com/openssl/openssl/blob/master/include/openssl/ssl.h.in#L399
+
+like SSL_OP_NO_DTLSv1_2, see commit "Expose various DTLSv1.2 specific functions and defines"
+
+this change fixes the compilation of vsftpd 3.0.4 & 3.0.5, which fails with the following error:
+```
+ssl.c: In function 'ssl_init':
+ssl.c:98:18: error: 'SSL_OP_NO_TLSv1_3' undeclared (first use in this function); did you mean 'SSL_OP_NO_TLSv1_1'?
+```
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+Fetched from: https://github.com/libressl-portable/openbsd/pull/124
+---
+ include/openssl/ssl.h | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/include/openssl/ssl.h b/include/openssl/ssl.h
+index 46f24b2ea..4048a6e63 100644
+--- a/include/openssl/ssl.h
++++ b/include/openssl/ssl.h
+@@ -516,11 +516,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
+ #define SSL_OP_NO_TLSv1					0x04000000L
+ #define SSL_OP_NO_TLSv1_2				0x08000000L
+ #define SSL_OP_NO_TLSv1_1				0x10000000L
+-
+-#if defined(LIBRESSL_HAS_TLS1_3) || defined(LIBRESSL_INTERNAL)
+ #define SSL_OP_NO_TLSv1_3				0x20000000L
+-#endif
+-
+ #define SSL_OP_NO_DTLSv1				0x40000000L
+ #define SSL_OP_NO_DTLSv1_2				0x80000000L
+ 
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

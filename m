Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2FCEB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 18:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4671040127;
	Tue, 27 Jun 2023 18:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4671040127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxnLheOsFTFK; Tue, 27 Jun 2023 18:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F67C40164;
	Tue, 27 Jun 2023 18:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F67C40164
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC2301BF3EF
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 18:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0EA84190F
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 18:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0EA84190F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ecyeqIuC5Wv for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 18:25:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA885418FF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA885418FF
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 18:25:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9882FA4C018A;
 Tue, 27 Jun 2023 20:25:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53864)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qEDNi-0006Ni-2T;
 Tue, 27 Jun 2023 20:25:38 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 20:25:38 +0200
Message-Id: <20230627182538.259570-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687890339;
 bh=wxxtkmGyjr+A/pjwzSjhjFK1jMSFTRuIGPUSFIdZOC4=;
 h=From:To:Cc:Subject:Date:From;
 b=EM+M3EfD4nCp1UGdHd4RXXYZiOBlYg5+oKiN6sgPur6dvcDzGlok8NAOkE+peim/I
 DkK5dxmHWaXIeHvcI5idDgzeMDr/p8xh84XlQck+cr6L9PDZbnlofer4CwKBVnRmEY
 Pn+HKiv3jNm5XCc1OgDbpCBE6cj7kzs5lJBT0s9ln/cUAKENGUClJB+YYnMX8mBojR
 29u8MyxcqU5KyHiRRMS0y1mS8EivCDoCktRn4472CNEvGZUAThqZ5ZZ1AiaXP42Dfe
 T3TpOIceK7YET39AXj/jgrbjWPpccoyxH2m6E7sS9YpW3nhjPZm04596vT8wQvtb8x
 4so70Sxz7wxmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=EM+M3EfD
Subject: [Buildroot] [PATCH 1/1] package/audit: update musl fix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream proposed a different fix:
https://github.com/linux-audit/audit-userspace/pull/311#issuecomment-1609953611

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ine-__attribute_malloc__-when-needed.patch | 35 +++++++++++++++++
 ...ute_malloc__-with-__attribute__-__ma.patch | 39 -------------------
 2 files changed, 35 insertions(+), 39 deletions(-)
 create mode 100644 package/audit/0001-Define-__attribute_malloc__-when-needed.patch
 delete mode 100644 package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch

diff --git a/package/audit/0001-Define-__attribute_malloc__-when-needed.patch b/package/audit/0001-Define-__attribute_malloc__-when-needed.patch
new file mode 100644
index 0000000000..3dd5359bfc
--- /dev/null
+++ b/package/audit/0001-Define-__attribute_malloc__-when-needed.patch
@@ -0,0 +1,35 @@
+From cf93d8579d5cec0b1ba585bd661776f03c2743ba Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 27 Jun 2023 20:19:13 +0200
+Subject: [PATCH] Define __attribute_malloc__ when needed
+
+attribute_malloc is not available on musl
+
+auparse.h: In function 'auparse_init':
+auparse.h:54:2: error: expected declaration specifiers before '__attribute_malloc__'
+   54 |  __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
+
+Upstream: https://github.com/linux-audit/audit-userspace/pull/311
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ auparse/auparse.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/auparse/auparse.h b/auparse/auparse.h
+index 95cf256d..5cb7402e 100644
+--- a/auparse/auparse.h
++++ b/auparse/auparse.h
+@@ -32,6 +32,9 @@
+ # define __attr_dealloc(dealloc, argno)
+ # define __attr_dealloc_free
+ #endif
++#ifndef __attribute_malloc__
++#  define __attribute_malloc__
++#endif
+ 
+ #ifdef __cplusplus
+ extern "C" {
+-- 
+2.39.2
+
diff --git a/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch b/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
deleted file mode 100644
index 1a276ca2df..0000000000
--- a/package/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 79c8d6a2755c9dfa00a5e86378e89a94eef0504d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Aug 2022 23:57:03 -0700
-Subject: [PATCH] Replace __attribute_malloc__ with 
- __attribute__((__malloc__))
-
-__attribute_malloc__ is not available on musl
-
-Fixes
-| ../../git/auparse/auparse.h:54:2: error: expected function body after function declarator
-|         __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
-|         ^
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream: https://github.com/linux-audit/audit-userspace/pull/311
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
-
- auparse/auparse.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/auparse/auparse.h b/auparse/auparse.h
-index 95cf256d..c7dbe5ff 100644
---- a/auparse/auparse.h
-+++ b/auparse/auparse.h
-@@ -51,7 +51,7 @@ typedef void (*auparse_callback_ptr)(auparse_state_t *au,
- void auparse_destroy(auparse_state_t *au);
- void auparse_destroy_ext(auparse_state_t *au, auparse_destroy_what_t what);
- auparse_state_t *auparse_init(ausource_t source, const void *b)
--	__attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
-+	__attribute__((__malloc__)) __attr_dealloc (auparse_destroy, 1);
- int auparse_new_buffer(auparse_state_t *au, const char *data, size_t data_len)
- 	__attr_access ((__read_only__, 2, 3));
- int auparse_feed(auparse_state_t *au, const char *data, size_t data_len)
--- 
-2.37.1
-
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

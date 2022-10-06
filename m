Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAA7C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07D1140BE3;
	Thu,  6 Oct 2022 18:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07D1140BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dgxi_H03BQFR; Thu,  6 Oct 2022 18:02:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECDBE40BA5;
	Thu,  6 Oct 2022 18:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECDBE40BA5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 167EE1BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB584419E1
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB584419E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlA-KfpjF8Sy for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 848C8419E9
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 848C8419E9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73B0D86937; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 19:57:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baca1e12baaf3ecd06dbfe3a74c8f2883099b955
X-Git-Newrev: cced5b68acba02abfd72f66264faed60f4bfd65a
X-Patchwork-Hint: ignore
Message-Id: <20221006175949.73B0D86937@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/darkhttpd: security bump to
 version 1.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=cced5b68acba02abfd72f66264faed60f4bfd65a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Fix CVE-2020-25691: https://github.com/emikulic/darkhttpd/issues/21

https://github.com/emikulic/darkhttpd/releases/tag/v1.14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...lare-vars-outside-of-for-loop-for-std-c90.patch | 39 ----------------------
 package/darkhttpd/darkhttpd.hash                   |  4 +--
 package/darkhttpd/darkhttpd.mk                     |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch b/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch
deleted file mode 100644
index 7584bff98e..0000000000
--- a/package/darkhttpd/0001-Declare-vars-outside-of-for-loop-for-std-c90.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 81b491e60affd67f4ec2feccbee1cdf98dc57b81 Mon Sep 17 00:00:00 2001
-From: Emil Mikulic <emikulic@gmail.com>
-Date: Sun, 21 Mar 2021 15:03:14 +1100
-Subject: [PATCH] Declare vars outside of for() loop for -std=c90.
-
-Fixes #2.
-
-[Retrieved from:
-https://github.com/emikulic/darkhttpd/commit/81b491e60affd67f4ec2feccbee1cdf98dc57b81]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- darkhttpd.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/darkhttpd.c b/darkhttpd.c
-index 219a8a3..268628a 100644
---- a/darkhttpd.c
-+++ b/darkhttpd.c
-@@ -966,8 +966,9 @@ static char *base64_encode(char *str) {
-     char *encoded_data = malloc(output_length+1);
-     if (encoded_data == NULL) return NULL;
- 
--    for (int i = 0, j = 0; i < input_length;) {
--
-+    int i;
-+    int j;
-+    for (i = 0, j = 0; i < input_length;) {
-         uint32_t octet_a = i < input_length ? (unsigned char)str[i++] : 0;
-         uint32_t octet_b = i < input_length ? (unsigned char)str[i++] : 0;
-         uint32_t octet_c = i < input_length ? (unsigned char)str[i++] : 0;
-@@ -981,7 +982,7 @@ static char *base64_encode(char *str) {
-     }
- 
-     const int mod_table[] = {0, 2, 1};
--    for (int i = 0; i < mod_table[input_length % 3]; i++)
-+    for (i = 0; i < mod_table[input_length % 3]; i++)
-         encoded_data[output_length - 1 - i] = '=';
-     encoded_data[output_length] = '\0';
- 
diff --git a/package/darkhttpd/darkhttpd.hash b/package/darkhttpd/darkhttpd.hash
index af5a2bf8c9..188afff767 100644
--- a/package/darkhttpd/darkhttpd.hash
+++ b/package/darkhttpd/darkhttpd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  1d88c395ac79ca9365aa5af71afe4ad136a4ed45099ca398168d4a2014dc0fc2  darkhttpd-1.13.tar.gz
-sha256  44e784df460954c7760e2eeae69aecb12a3d23ca1c0a4f6047c3c6452b2e2f49  darkhttpd.c
+sha256  e063de9efa5635260c8def00a4d41ec6145226a492d53fa1dac436967670d195  darkhttpd-1.14.tar.gz
+sha256  f002944c9a8516e3346002d39c3e13681306833358c0f3c7781dff1fdb639710  darkhttpd.c
diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
index bc68d43ef9..bda08899b8 100644
--- a/package/darkhttpd/darkhttpd.mk
+++ b/package/darkhttpd/darkhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DARKHTTPD_VERSION = 1.13
+DARKHTTPD_VERSION = 1.14
 DARKHTTPD_SITE = $(call github,emikulic,darkhttpd,v$(DARKHTTPD_VERSION))
 DARKHTTPD_LICENSE = MIT
 DARKHTTPD_LICENSE_FILES = darkhttpd.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

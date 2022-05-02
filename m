Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4C4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 17:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE78940A8D;
	Mon,  2 May 2022 17:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nZD_Q17p8Fu; Mon,  2 May 2022 17:09:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A15724064D;
	Mon,  2 May 2022 17:09:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78BF01BF32C
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 17:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6624C4064D
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 17:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdyEr9mLSSWV for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 17:09:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5990D40133
 for <buildroot@buildroot.org>; Mon,  2 May 2022 17:09:16 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout08.t-online.de (Postfix) with SMTP id 6EEBF13D18;
 Mon,  2 May 2022 19:09:13 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.177.194]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nlZXt-4XICqv0; Mon, 2 May 2022 19:09:13 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:47888)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nlZXs-0000L0-Gz;
 Mon, 02 May 2022 19:09:12 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 19:09:12 +0200
Message-Id: <20220502170912.412062-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1651511353-0000C4DD-284D2CC9/0/0 CLEAN NORMAL
X-TOI-MSGID: aad61f92-580a-4871-badd-6869b84d74a9
Subject: [Buildroot] [PATCH 1/1] package/libcurl: fix build with mbedtls
 when h2-enabled
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bug was introduced by bumping libcurl to 7.83.0 in
https://git.busybox.net/buildroot/commit/?id=b0b25f145469a14e3d85becf19aaca0a40fd4e25

Fixes:
http://autobuild.buildroot.net/results/825/825b0ae84d5212200710628689079ec54a4bda3f/
http://autobuild.buildroot.net/results/881/8812ffdf42a3adf2df834c4b6e36316cd932821e/
http://autobuild.buildroot.net/results/3e8/3e840c896e4b8aacc9d784f16a6388eac4178246/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-mbedtls-fix-compile-when-h2-enabled.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch

diff --git a/package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch b/package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch
new file mode 100644
index 0000000000..61cbabd84a
--- /dev/null
+++ b/package/libcurl/0001-mbedtls-fix-compile-when-h2-enabled.patch
@@ -0,0 +1,32 @@
+From 6eb7fb37d901ed1e4ce07cbd628ee11bf02db1f3 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 28 Apr 2022 17:11:50 +0200
+Subject: [PATCH] mbedtls: fix compile when h2-enabled
+
+Fixes #8766
+Reported-by: LigH-de on github
+Closes #8768
+
+Downloaded from upstream commit
+https://github.com/curl/curl/commit/6eb7fb37d901ed1e4ce07cbd628ee11bf02db1f3
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ lib/vtls/mbedtls.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
+index 64f57c5d8321..5f9b87e6b75b 100644
+--- a/lib/vtls/mbedtls.c
++++ b/lib/vtls/mbedtls.c
+@@ -815,8 +815,8 @@ mbed_connect_step2(struct Curl_easy *data, struct connectdata *conn,
+     if(next_protocol) {
+       infof(data, VTLS_INFOF_ALPN_ACCEPTED_1STR, next_protocol);
+ #ifdef USE_HTTP2
+-      if(!strncmp(next_protocol, ALPN_H2, ALPN_H2_LEN) &&
+-         !next_protocol[ALPN_H2_LEN]) {
++      if(!strncmp(next_protocol, ALPN_H2, ALPN_H2_LENGTH) &&
++         !next_protocol[ALPN_H2_LENGTH]) {
+         conn->negnpn = CURL_HTTP_VERSION_2;
+       }
+       else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

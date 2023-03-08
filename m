Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53DCC678D5
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 17:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F295610C4;
	Wed,  8 Mar 2023 17:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F295610C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdEUqICMOJOW; Wed,  8 Mar 2023 17:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ACB061041;
	Wed,  8 Mar 2023 17:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ACB061041
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 197731BF47D
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 17:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7A3140C00
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 17:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7A3140C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oapONKq5flcV for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 17:31:18 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5907240153
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5907240153
 for <buildroot@buildroot.org>; Wed,  8 Mar 2023 17:31:18 +0000 (UTC)
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1N8ojI-1qfRtn3Gmk-015pGK; Wed, 08 Mar 2023 18:26:09 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Wed,  8 Mar 2023 18:25:33 +0100
Message-Id: <20230308172533.773-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:+ZTCu1zfz80i7otIUHMD+qpXBU/bkgPGW8En0//tXyNd9lntHNi
 yImumOT54aHQFAALKuu0U3ohXbz+MbARDj462G3ICQijQtUhkC2zHt1kZrhdcSq0oKpEHI1
 Dcb6RNJtwKLt7g2D1sNFou+dTmELv5Q5444Amq7l4alz9Kqr/JcWstbubHPauHtis/9vPWJ
 FE5/WUqXUljDcV04+XLaQ==
UI-OutboundReport: notjunk:1;M01:P0:h5RMQUoicCU=;aRpWruovTSo5snz2Y3BEEN8ULMv
 3PES33UQARILCwlIivGo0nESdNpDI3CyoV6zzuqI4kWV8zlI4y0/J1sS45Pynn4n8JHA1bivr
 ipR3slBEyMjnV0z7g+ZbdiFfurF4rtyXfXS4sF+MfFy+skt88yLcZSsObDh7bcbGC99i+EJfp
 gLO3BmSQB7Swk1/c6AwlEcaajuP20EF0NhUxKqX72LgYHi8Ar5DcljlePf6E9NxiC3Tsa5qn/
 v7f/Ge62Z8A0WlgrqEZ+H/BudsHCKe4oezJUC44q3nNbYgflXzpeUgNbSjJU/1mc1D+CvRhue
 nAQ1ZjVn2xGZfzOqfnbEoWbIiVdRlfkuHdsvslyLw/dwpjrKCSNzxZ/pCy//5VNIMDSwdv7/u
 9TyfAig65qD5NmMd+LHV3EFa8oJKa5dJW8QMiv6+jxJviWR3er6PwBKnqC8wj8oYN3ju26LBW
 FdonAUfLQnsfdUAyjGEMZW/26Z0z1ot8T1MmR9kq7CgyJl7tZrxuVglA2djlz7RHtTp3Xy36R
 vMJdOI8l5sIhN1hf5kPzUOMzOIlvMhqItS/FmTvpY16swIjNoVYu7oXp2eTTVh92FSE0k1KbO
 nfywFLBKYSEDFOOwoUanb1NI5zC+aSnlilHdA/IbrsFn1vqiSRgxys5yhGjANDiyKGpkegbpT
 p4XN3mDzNPMIyp6QmHeyTDHWXx+okUu9MMzvuvtQ/w==
Subject: [Buildroot] [PATCH next 1/1] package/janus-gateway: bump to version
 1.1.2
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove patch applied upstream.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 ...se-parentheses-to-ensure-compilation.patch | 27 -------------------
 package/janus-gateway/janus-gateway.hash      |  2 +-
 package/janus-gateway/janus-gateway.mk        |  2 +-
 3 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 package/janus-gateway/0003-Use-parentheses-to-ensure-compilation.patch

diff --git a/package/janus-gateway/0003-Use-parentheses-to-ensure-compilation.patch b/package/janus-gateway/0003-Use-parentheses-to-ensure-compilation.patch
deleted file mode 100644
index f91c13d1f6..0000000000
--- a/package/janus-gateway/0003-Use-parentheses-to-ensure-compilation.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 51431c36cd5f2997c0f7723909195b9883ae0486 Mon Sep 17 00:00:00 2001
-From: Benson Muite <bkmgit@users.noreply.github.com>
-Date: Wed, 4 Jan 2023 13:33:36 +0300
-Subject: [PATCH] Use parentheses to ensure compilation (#3138)
-
-Compiler fails with latest Curl release. Use parenthesis to ensure compiler evaluates expression correctly.
-
-[Retrieved from:
-https://github.com/meetecho/janus-gateway/commit/51431c36cd5f2997c0f7723909195b9883ae0486]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/turnrest.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/turnrest.c b/src/turnrest.c
-index b8560d22f2..42e6114de8 100644
---- a/src/turnrest.c
-+++ b/src/turnrest.c
-@@ -165,7 +165,7 @@ janus_turnrest_response *janus_turnrest_request(const char *user) {
- 	JANUS_LOG(LOG_VERB, "Sending request: %s\n", request_uri);
- 	janus_mutex_unlock(&api_mutex);
- 	curl_easy_setopt(curl, CURLOPT_URL, request_uri);
--	curl_easy_setopt(curl, api_http_get ? CURLOPT_HTTPGET : CURLOPT_POST, 1);
-+	curl_easy_setopt(curl, (api_http_get ? CURLOPT_HTTPGET : CURLOPT_POST), 1);
- 	if(!api_http_get) {
- 		/* FIXME Some servers don't like a POST with no data */
- 		curl_easy_setopt(curl, CURLOPT_POSTFIELDS, query_string);
diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 7a87ae737a..a147a8afff 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bb83c19d6137e39833e8eb2b1deeecb33b5d19d4f503d51703bdcc478c447940  janus-gateway-1.1.1.tar.gz
+sha256  f721d62a22b38ba3a341a5502f06b8b3a5a4f7bd0e9cc6c53de257fe99695e17  janus-gateway-1.1.2.tar.gz
 sha256  91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6  COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index dd898563e5..786bc211d4 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 1.1.1
+JANUS_GATEWAY_VERSION = 1.1.2
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

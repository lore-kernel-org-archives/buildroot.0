Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C459C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 10:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1539440348;
	Sun, 12 Mar 2023 10:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1539440348
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BiW9gQXxxXOc; Sun, 12 Mar 2023 10:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7A90402B1;
	Sun, 12 Mar 2023 10:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7A90402B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 395D31BF310
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 10:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 211124013B
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 10:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 211124013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GxAwoU7VerLM for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 10:27:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EACA4010F
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 10:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EACA4010F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B1CB86EAC; Sun, 12 Mar 2023 10:27:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 11:08:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9ce280ba180f8668bfcd92175842a3c2d9567223
X-Git-Newrev: b83550bd0c2bbfc894d1c82ec0ea330c8283deee
X-Patchwork-Hint: ignore
Message-Id: <20230312102709.2B1CB86EAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/janus-gateway: bump to
 version 1.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b83550bd0c2bbfc894d1c82ec0ea330c8283deee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove patch applied upstream.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...003-Use-parentheses-to-ensure-compilation.patch | 27 ----------------------
 package/janus-gateway/janus-gateway.hash           |  2 +-
 package/janus-gateway/janus-gateway.mk             |  2 +-
 3 files changed, 2 insertions(+), 29 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

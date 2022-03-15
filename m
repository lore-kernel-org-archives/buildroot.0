Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6904AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EA0484316;
	Tue, 15 Mar 2022 21:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zSiHCmnEn_T8; Tue, 15 Mar 2022 21:52:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B38E842F8;
	Tue, 15 Mar 2022 21:52:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A05D1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D63740154
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PSDTSOEu7JcD for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:50:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A30FE4053E
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B74BF8412D; Tue, 15 Mar 2022 21:41:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:28:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db2b8a1ce22e9ee458532d2900d4c8cbe96d9ba0
X-Git-Newrev: 06bb3640c13191f7515f2140c2207f5b7a2cb7ab
X-Patchwork-Hint: ignore
Message-Id: <20220315214147.B74BF8412D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/azure-iot-sdk-c: bump to version
 LTS_01_2022_Ref01
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

commit: https://git.buildroot.net/buildroot/commit/?id=06bb3640c13191f7515f2140c2207f5b7a2cb7ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/Azure/azure-iot-sdk-c/releases/tag/LTS_01_2022_Ref01

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...hmac-c-fix-mismatching-function-prototype.patch | 35 ----------------------
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash       |  2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk         |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch b/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
deleted file mode 100644
index 0c262e6c46..0000000000
--- a/package/azure-iot-sdk-c/0001-hmac-c-fix-mismatching-function-prototype.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3a7997af72e7a4f70109d1639e6725b39046443e Mon Sep 17 00:00:00 2001
-From: Francesco Giancane <30423178+fgiancane8@users.noreply.github.com>
-Date: Fri, 2 Jul 2021 20:47:38 +0200
-Subject: [PATCH] hmac.c: fix mismatching function prototype (#537)
-
-The reported function raises a warning when compilers assert the flag
-`-Warray-parameter=`, signaling that an array-type argument was promoted
-to a pointer-type argument.
-
-While in practice in most C implementations this is correct, fixing the
-warning (and, in this case, indicating the maximum size for the array)
-would represent a best-practice for finding out-of-bound accesses or
-identifying wrongly-sized arrays passed in the function.
-
-Signed-off-by: Francesco Giancane <francesco.giancane@accenture.com>
-[Retrieved from:
-https://github.com/Azure/azure-c-shared-utility/commit/3a7997af72e7a4f70109d1639e6725b39046443e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/hmac.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/hmac.c b/src/hmac.c
-index 53f2411f8..160af9d2f 100644
---- a/c-utility/src/hmac.c
-+++ b/c-utility/src/hmac.c
-@@ -208,7 +208,7 @@ int hmacFinalBits(HMACContext *ctx,
- *   sha Error Code.
- *
- */
--int hmacResult(HMACContext *ctx, uint8_t *digest)
-+int hmacResult(HMACContext *ctx, uint8_t digest[USHAMaxHashSize])
- {
-     if (!ctx) return shaNull;
- 
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index 72fa99c44d..5dbb530954 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  987b469aa76d6c81e5dbcd62e81f4ece0620770930cf65722754c76aedd6049f  azure-iot-sdk-c-LTS_01_2021_Ref01-br1.tar.gz
+sha256  082e41f7cdf06fec036b8cfa1793f03e81ba527b55ea13c66be0e4cf9f20ff7b  azure-iot-sdk-c-LTS_01_2022_Ref01-br1.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index e6de8c851b..874646c445 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = LTS_01_2021_Ref01
+AZURE_IOT_SDK_C_VERSION = LTS_01_2022_Ref01
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A89C10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 10:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3B0A6083D;
	Mon,  6 May 2024 10:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xupe3pzHZwmr; Mon,  6 May 2024 10:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE3C460840
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE3C460840;
	Mon,  6 May 2024 10:56:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 409921BF33E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D05F60846
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAqSDiA7s99t for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 10:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A43260840
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A43260840
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:56:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 508D486728; Mon,  6 May 2024 10:56:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 12:51:59 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2ebf2a85c0fe64384660def2621e37d7ee04c603
X-Git-Newrev: 5efb91c2bff4714c1c6a0b8afca977bee07ded56
X-Patchwork-Hint: ignore
Message-Id: <20240506105620.508D486728@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] toolchain/helpers.mk: use
 int as main() return type in checks
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

commit: https://git.buildroot.net/buildroot/commit/?id=5efb91c2bff4714c1c6a0b8afca977bee07ded56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Although -Wmain-return-type is not considered as error (unlike
-Wimplicit-int), but just a warning, let's fix it for the future.

<stdin>:1:1: warning: return type of 'main' is not 'int' [-Wmain-return-type]

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3c9d06759051b3c23e3794f443af96d824aae239)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index e5c838c0af..839ee278d0 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -483,7 +483,7 @@ check_unusable_toolchain = \
 #
 check_toolchain_ssp = \
 	__CROSS_CC=$(strip $1) ; \
-	__HAS_SSP=`echo 'void main(){}' | $${__CROSS_CC} -Werror -fstack-protector -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 && echo y` ; \
+	__HAS_SSP=`echo 'int main(){}' | $${__CROSS_CC} -Werror -fstack-protector -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 && echo y` ; \
 	if [ "$(BR2_TOOLCHAIN_HAS_SSP)" != "y" -a "$${__HAS_SSP}" = "y" ] ; then \
 		echo "SSP support available in this toolchain, please enable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP" ; \
 		exit 1 ; \
@@ -494,7 +494,7 @@ check_toolchain_ssp = \
 	fi ; \
 	__SSP_OPTION=$(2); \
 	if [ -n "$${__SSP_OPTION}" ] ; then \
-		if ! echo 'void main(){}' | $${__CROSS_CC} -Werror $${__SSP_OPTION} -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 ; then \
+		if ! echo 'int main(){}' | $${__CROSS_CC} -Werror $${__SSP_OPTION} -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 ; then \
 			echo "SSP option $${__SSP_OPTION} not available in this toolchain, please select another SSP level" ; \
 			exit 1 ; \
 		fi; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

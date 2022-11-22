Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED29C4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13F2E4052D;
	Tue, 22 Nov 2022 22:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13F2E4052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S5NlRtimFeFm; Tue, 22 Nov 2022 22:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44FC740A15;
	Tue, 22 Nov 2022 22:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44FC740A15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 564BF1BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E35060AD8
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E35060AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ilZGtsp2N0F for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:54:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7587D60AC3
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7587D60AC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DB1984221; Tue, 22 Nov 2022 22:54:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 23:52:44 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3f24e3abba631b29aa44db8a4447288b2ec371ae
X-Git-Newrev: 7464a54bd1c809b2f78b6da9240cd318252b49f8
X-Patchwork-Hint: ignore
Message-Id: <20221122225423.5DB1984221@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/freerdp: security
 bump to version 2.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7464a54bd1c809b2f78b6da9240cd318252b49f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Backported #8403: Fixed multiple client side input validation issues
(CVE-2022-39316, CVE-2022-39317, CVE-2022-39318, CVE-2022-39319,
CVE-2022-39320, CVE-2022-41877, CVE-2022-39347)

https://github.com/FreeRDP/FreeRDP/releases/tag/2.9.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 35c2ee69a51a343f2e5c1f88eeb8c7064922ded4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 94d0746d40..f6adc05312 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.8.1.tar.gz.sha256
-sha256  ea8903b29914134202a972c06052432678c89cb5eebcc8f5a41553030c97376b  freerdp-2.8.1.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.9.0.tar.gz.sha256
+sha256  fcf71cf5b09c5c2636341ba212f34b8fb728246ea28e08caf6cef8b4a96184b7  freerdp-2.9.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index ae844c589e..fb0e6920cf 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.8.1
+FREERDP_VERSION = 2.9.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

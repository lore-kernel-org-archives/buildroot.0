Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3945C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54F836FC05;
	Tue, 21 Feb 2023 01:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54F836FC05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K4t7vZIV1wfs; Tue, 21 Feb 2023 01:50:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70CD67001C;
	Tue, 21 Feb 2023 01:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70CD67001C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 896291BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53AB170011
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53AB170011
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TOiyG8UgmqbR for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9721C6FFF3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9721C6FFF3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8826781979; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 17:41:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c33a133704166d602090b0b0d394aa9428e6acd4
X-Git-Newrev: 6ff07d3e60d23816a958aae413d4dc7e2dd17003
X-Patchwork-Hint: ignore
Message-Id: <20230220205256.8826781979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6base: additional
 disable FEATURE_avx512vbmi2 and FEATURE_vaes
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ff07d3e60d23816a958aae413d4dc7e2dd17003
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- additional disable new FEATURE_avx512vbmi2/FEATURE_vaes (added with
  upstream commit [1])

[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=38e6b637b71fae274caedc1d326f641b904e00a4

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 212b2d689e..e6cf4f14bb 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -72,7 +72,9 @@ QT6BASE_CONF_OPTS += \
 	-DFEATURE_avx512ifma=OFF \
 	-DFEATURE_avx512pf=OFF \
 	-DFEATURE_avx512vbmi=OFF \
-	-DFEATURE_avx512vl=OFF
+	-DFEATURE_avx512vbmi2=OFF \
+	-DFEATURE_avx512vl=OFF \
+	-DFEATURE_vaes=OFF
 
 define QT6BASE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6BASE_BUILDDIR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

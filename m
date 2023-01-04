Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8106AC4708E
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 13:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22DD681EDC;
	Wed,  4 Jan 2023 13:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22DD681EDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id amKlijIAym-t; Wed,  4 Jan 2023 13:23:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 681DE81ECF;
	Wed,  4 Jan 2023 13:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 681DE81ECF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C76A21BF8C7
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 13:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3B8260B33
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 13:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B8260B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PqYtmvwtKvOx for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 13:22:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81FAC60640
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 13:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81FAC60640
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 720A8874D6; Wed,  4 Jan 2023 13:22:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 14:19:31 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: da09054cb92e773fc7fd08a7894b5b0620a32e96
X-Git-Newrev: 10b7a47d4ddd7f1561128e6b1b894aa556ea5057
X-Patchwork-Hint: ignore
Message-Id: <20230104132245.720A8874D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tiff: explicitly
 disable webp
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

commit: https://git.buildroot.net/buildroot/commit/?id=10b7a47d4ddd7f1561128e6b1b894aa556ea5057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9db9f9b4dc7d7b728bf2ea9e6456a9fcc6d7098c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 1b6bd91220..4d3c90f956 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -12,10 +12,13 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
+# webp has a (optional) dependency on tiff, so we can't have webp
+# support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
 	--disable-contrib \
 	--disable-cxx \
 	--disable-tests \
+	--disable-webp \
 	--without-x
 
 TIFF_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4EFC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 20:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A440D409A2;
	Sun, 19 Mar 2023 20:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A440D409A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4JQESFsAHbPA; Sun, 19 Mar 2023 20:17:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99F524099E;
	Sun, 19 Mar 2023 20:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99F524099E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAD3F1BF86D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 20:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8478660AEA
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 20:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8478660AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6TVqeQ5TJSdq for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 20:17:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1FED60767
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 20:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1FED60767
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A07F08751B; Sun, 19 Mar 2023 20:17:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 20:32:49 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 08ef726a3a2c926c77e850c60ad7ab26a4425107
X-Git-Newrev: 8b641331d0b1fea1c70f910df70d7f045f9de162
X-Patchwork-Hint: ignore
Message-Id: <20230319201702.A07F08751B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/s390-tools: needs
 OpenSSL-enabled libcurl
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b641331d0b1fea1c70f910df70d7f045f9de162
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following build failure raised bump to version 2.17.0 in commit
eab9110afbef9c39569c4cc988aed15c48f7ce44 and
https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e:

Error: libcurl is not built with the OpenSSL backend

Fixes:
 - http://autobuild.buildroot.org/results/32aa8f0bece5da2a16d761f175d46c7d3e0a8965
 - http://autobuild.buildroot.org/results/535253f483c927da456c0be292df6a58c1f39737

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 889fd54f809973d56b98e78677ae8a14e9e64da4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/s390-tools/s390-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 328986bcb3..76d4480bf1 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -16,7 +16,7 @@ S390_TOOLS_MAKE_OPTS = \
 	LINK="$(TARGET_CC)" \
 	LINKXX="$(TARGET_CXX)"
 
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
+ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 S390_TOOLS_DEPENDENCIES += libcurl
 S390_TOOLS_MAKE_OPTS += \
 	CURL_CONFIG=$(STAGING_DIR)/usr/bin/curl-config \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

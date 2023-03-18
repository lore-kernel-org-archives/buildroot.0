Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72271C7618E
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 21:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1823582037;
	Sat, 18 Mar 2023 21:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1823582037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NhWRx-Rq3HgI; Sat, 18 Mar 2023 21:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64F6882046;
	Sat, 18 Mar 2023 21:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64F6882046
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A66C61BF378
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8050560C09
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8050560C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FzndfFkssEe8 for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 21:21:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4F9E60BEA
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 21:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4F9E60BEA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94EE586B45; Sat, 18 Mar 2023 21:21:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 22:21:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a0301c1b95a751c331e738d6a392c1fd03d2393
X-Git-Newrev: 889fd54f809973d56b98e78677ae8a14e9e64da4
X-Patchwork-Hint: ignore
Message-Id: <20230318212138.94EE586B45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s390-tools: needs OpenSSL-enabled
 libcurl
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

commit: https://git.buildroot.net/buildroot/commit/?id=889fd54f809973d56b98e78677ae8a14e9e64da4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised bump to version 2.17.0 in commit
eab9110afbef9c39569c4cc988aed15c48f7ce44 and
https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e:

Error: libcurl is not built with the OpenSSL backend

Fixes:
 - http://autobuild.buildroot.org/results/32aa8f0bece5da2a16d761f175d46c7d3e0a8965
 - http://autobuild.buildroot.org/results/535253f483c927da456c0be292df6a58c1f39737

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s390-tools/s390-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 8cd5491405..ec01a18cb0 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -14,7 +14,7 @@ S390_TOOLS_MAKE_OPTS = \
 	ARCH=$(BR2_ARCH) \
 	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
+ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 S390_TOOLS_DEPENDENCIES += libcurl
 S390_TOOLS_MAKE_OPTS += \
 	CURL_CONFIG=$(STAGING_DIR)/usr/bin/curl-config \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

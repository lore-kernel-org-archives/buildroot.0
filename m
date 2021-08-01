Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE96DC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:03:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B4CF61029
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B4CF61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F26B8376E;
	Sun,  1 Aug 2021 21:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXjOsI6yt1Ry; Sun,  1 Aug 2021 21:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F2AD83777;
	Sun,  1 Aug 2021 21:03:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05EA81BF989
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDAE840465
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xsfXnChovQMQ for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 21:02:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 112C24045B
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 21:02:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 06CA88A501; Sun,  1 Aug 2021 21:02:32 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 22:59:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fc9841db8a643858a79906438b994890690582b
X-Git-Newrev: 15393386715a467bc58020e002ccbe26ea50fa38
X-Patchwork-Hint: ignore
Message-Id: <20210801210232.06CA88A501@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s390-tools: add libxml2 optional
 dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=15393386715a467bc58020e002ccbe26ea50fa38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libxml2 is an optional dependency which is enabled by default since
version 2.17.0 and
https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s390-tools/s390-tools.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 578d391b74..bdb3138114 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -56,6 +56,15 @@ else
 S390_TOOLS_MAKE_OPTS += HAVE_GLIB2=0
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+S390_TOOLS_DEPENDENCIES += libxml2
+S390_TOOLS_MAKE_OPTS += \
+	HAVE_LIBXML2=1 \
+	XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
+else
+S390_TOOLS_MAKE_OPTS += HAVE_LIBXML2=0
+endif
+
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 S390_TOOLS_DEPENDENCIES += ncurses
 S390_TOOLS_MAKE_OPTS += HAVE_NCURSES=1
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

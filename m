Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85A8C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 21:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C43A84C9F;
	Fri, 28 Jan 2022 21:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p55mQq5aYEHR; Fri, 28 Jan 2022 21:08:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD1C184C8E;
	Fri, 28 Jan 2022 21:08:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6A711C1162
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5FB284C93
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 21:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VcKeaw0Go1im for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 21:07:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24EDB84C8E
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 21:07:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 525B582B52; Fri, 28 Jan 2022 21:01:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 22:04:07 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 050acd180c5a256e2f8632a308ccb1ba687cda45
X-Git-Newrev: 2784581a7d62a36da07b6460b7ae6f42aa1efd11
X-Patchwork-Hint: ignore
Message-Id: <20220128210100.525B582B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libpjsip: update
 LIBPJSIP_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=2784581a7d62a36da07b6460b7ae6f42aa1efd11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

pjsip:pjsip has been deprecated by teluu:pjsip since September 2021:

 <cpe-23:cpe23-item name="cpe:2.3:a:pjsip:pjsip:2.7.1:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:teluu:pjsip:2.7.1:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>
  <cpe-item name="cpe:/a:pjsip:pjsip:2.7.2" deprecated="true" deprecation_date="2021-09-02T14:49:19.527Z">

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c99d84fb9694000a91fa04abc820f3e63a14e7e9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 0a93780e93..b05cc31a83 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -12,7 +12,7 @@ LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
 LIBPJSIP_LICENSE_FILES = COPYING
-LIBPJSIP_CPE_ID_VENDOR = pjsip
+LIBPJSIP_CPE_ID_VENDOR = teluu
 LIBPJSIP_CPE_ID_PRODUCT = pjsip
 LIBPJSIP_INSTALL_STAGING = YES
 LIBPJSIP_MAKE = $(MAKE1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

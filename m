Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC10C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 19:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D192818D7;
	Sat, 15 Jan 2022 19:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cc63n4BaXVK3; Sat, 15 Jan 2022 19:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 892A981B3E;
	Sat, 15 Jan 2022 19:34:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9074E1BF3E9
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 19:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F2A9818E6
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 19:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AOn5jEASxSbZ for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 19:33:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5B51813C7
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 19:33:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0D1CA82DBE; Sat, 15 Jan 2022 19:27:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 20:15:25 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5c7473698ed47c0cc5d385f6a9cd742991bff383
X-Git-Newrev: 56228062ddd1a3c2a0d1a70a8d9d8b6641d46b5f
X-Patchwork-Hint: ignore
Message-Id: <20220115192731.0D1CA82DBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/civetweb: fix
 BR2_STATIC_SHARED_LIBS typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=56228062ddd1a3c2a0d1a70a8d9d8b6641d46b5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix typo BR2_STATIC_SHARED_LIBS -> BR2_SHARED_STATIC_LIBS added by
commit db47bc99976c2d4ffb509620a76cfdd369b30559

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f0dbd03a0c93ae286d8b70b5455d699c58acf77e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/civetweb/civetweb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 94fbb4f9d8..b20d213a0d 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -54,12 +54,12 @@ ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
 CIVETWEB_INSTALL_STAGING = YES
 CIVETWEB_INSTALL_TARGETS += install-headers
 
-ifeq ($(BR2_STATIC_LIBS)$(BR2_STATIC_SHARED_LIBS),y)
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 CIVETWEB_BUILD_TARGETS += lib
 CIVETWEB_INSTALL_TARGETS += install-lib
 endif
 
-ifeq ($(BR2_SHARED_LIBS)$(BR2_STATIC_SHARED_LIBS),y)
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 CIVETWEB_BUILD_TARGETS += slib
 CIVETWEB_INSTALL_TARGETS += install-slib
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

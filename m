Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AFFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 12:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0185415C2;
	Sat, 22 Jan 2022 12:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_pLoQ6KpvjG; Sat, 22 Jan 2022 12:20:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00AB1405CE;
	Sat, 22 Jan 2022 12:20:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4A1E1BF2AF
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D197B606C0
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 12:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59WjF_-9O6CN for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 12:20:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29EFB605C9
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 12:20:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 712E582627; Sat, 22 Jan 2022 12:13:39 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 13:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ad77c42db2a5359770f3623e12807d65bdec386
X-Git-Newrev: 49d7c85421e87d9d762be9352805cb47a2f0bbeb
X-Patchwork-Hint: ignore
Message-Id: <20220122121339.712E582627@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxml2: add optional icu support
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

commit: https://git.buildroot.net/buildroot/commit/?id=49d7c85421e87d9d762be9352805cb47a2f0bbeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxml2/libxml2.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 5d688acae5..023a461472 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -24,6 +24,13 @@ LIBXML2_DEPENDENCIES = host-pkgconf
 
 HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma --without-python
 
+ifeq ($(BR2_PACKAGE_ICU),y)
+LIBXML2_DEPENDENCIES += icu
+LIBXML2_CONF_OPTS += --with-icu
+else
+LIBXML2_CONF_OPTS += --without-icu
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBXML2_DEPENDENCIES += zlib
 LIBXML2_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

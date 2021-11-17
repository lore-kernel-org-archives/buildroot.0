Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78928C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:09:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43AD3600CD
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43AD3600CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D7B606AA;
	Wed, 17 Nov 2021 15:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y3Ykn6DjtaYZ; Wed, 17 Nov 2021 15:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 678CB60670;
	Wed, 17 Nov 2021 15:09:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8421BF9BA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28C824092B
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fJNvhUXrm8H for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C91D40494
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EF6798D479; Wed, 17 Nov 2021 15:05:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 16:01:20 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: d815599e371d759b193de4207bec6f2701827db0
X-Git-Newrev: 4842afad1ea336fcf3a704bdc7becf3af85d7f71
X-Patchwork-Hint: ignore
Message-Id: <20211117150506.EF6798D479@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/alsa-lib: don't
 override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=4842afad1ea336fcf3a704bdc7becf3af85d7f71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Don't override ALSA_LIB_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5a3165e0977ad44ce487f8b346ebcfaf78237f9a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/alsa-lib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 99c53f9408..3bdde217ce 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -64,13 +64,13 @@ ALSA_LIB_CONF_OPTS += \
 	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
 	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-ALSA_LIB_DEPENDENCIES = python
+ALSA_LIB_DEPENDENCIES += python
 else
 ALSA_LIB_CONF_OPTS += \
 	--with-pythonlibs=-lpython$(PYTHON3_VERSION_MAJOR) \
 	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
-ALSA_LIB_DEPENDENCIES = python3
+ALSA_LIB_DEPENDENCIES += python3
 endif
 else
 ALSA_LIB_CONF_OPTS += --disable-python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

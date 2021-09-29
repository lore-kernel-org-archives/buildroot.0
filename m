Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E38CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 14:15:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A414E61211
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 14:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A414E61211
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 786FF60704;
	Wed, 29 Sep 2021 14:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4Ou9sPZ6jwu; Wed, 29 Sep 2021 14:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7F2160663;
	Wed, 29 Sep 2021 14:15:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFDDC1BF426
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 14:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD1A3415BB
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 14:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3RTgzzOmnBZ3 for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 14:15:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0940E41972
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 14:15:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2D2D78D486; Wed, 29 Sep 2021 14:12:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 11:59:16 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: db9ac29952272b84955d02b28b9bfea15e6ea243
X-Git-Newrev: e8312c412823112a733cb4900a1926f2a3f09249
X-Patchwork-Hint: ignore
Message-Id: <20210929141258.2D2D78D486@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/runc: bump to
 version 1.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8312c412823112a733cb4900a1926f2a3f09249
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

https://github.com/opencontainers/runc/releases/tag/v1.0.2
https://github.com/opencontainers/runc/releases/tag/v1.0.1
https://github.com/opencontainers/runc/releases/tag/v1.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 21704ad112e0eb2be4692e5b81cb95a53ae48d95)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 598bd3067f..365beac21d 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  02dac7f1a0dcfe55dd9820df787adedf030060870354915e7bba86f8487ce93c  runc-1.0.0-rc95.tar.gz
+sha256  6c3cca4bbeb5d9b2f5e3c0c401c9d27bc8a5d2a0db8a2f6a06efd03ad3c38a33  runc-1.0.2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 62b9f09bf2..e77ef8111e 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,15 +4,11 @@
 #
 ################################################################################
 
-RUNC_VERSION_MAJOR = 1.0.0
-RUNC_VERSION_MINOR = rc95
-RUNC_VERSION = $(RUNC_VERSION_MAJOR)-$(RUNC_VERSION_MINOR)
+RUNC_VERSION = 1.0.2
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 RUNC_CPE_ID_VENDOR = linuxfoundation
-RUNC_CPE_ID_VERSION = $(RUNC_VERSION_MAJOR)
-RUNC_CPE_ID_UPDATE = $(RUNC_VERSION_MINOR)
 
 RUNC_LDFLAGS = -X main.version=$(RUNC_VERSION)
 RUNC_TAGS = cgo static_build
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

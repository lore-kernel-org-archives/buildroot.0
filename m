Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F18C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:10:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CBFE60ED3
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CBFE60ED3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5678F80E0E;
	Wed, 17 Nov 2021 15:10:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrM38ZRnTDZe; Wed, 17 Nov 2021 15:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE09180ED7;
	Wed, 17 Nov 2021 15:10:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B92D1BF36B
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63E52404A9
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5c6Rn6dk0zbh for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 929244091F
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3C0B38D479; Wed, 17 Nov 2021 15:05:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 16:04:49 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: e030d3cb338fae4cec031152cdb1c010a65f54c8
X-Git-Newrev: 215828764519e70d52d8786a567c658eae745098
X-Patchwork-Hint: ignore
Message-Id: <20211117150507.3C0B38D479@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libdnet: don't
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

commit: https://git.buildroot.net/buildroot/commit/?id=215828764519e70d52d8786a567c658eae745098
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Don't override LIBDNET_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ea21670ee830bfd86dca47434ef01c61da2a36cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdnet/libdnet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index d1cc0bf150..3d3fcbe605 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -16,7 +16,7 @@ LIBDNET_CONF_OPTS = \
 LIBDNET_CONFIG_SCRIPTS = dnet-config
 
 ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
-LIBDNET_DEPENDENCIES = python
+LIBDNET_DEPENDENCIES += python
 LIBDNET_CONF_OPTS += --with-python
 LIBDNET_MAKE_OPTS = PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) PYLIBDIR=$(STAGING_DIR)/usr/lib
 LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

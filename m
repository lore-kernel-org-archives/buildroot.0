Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93CEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:10:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99DDC60ED3
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99DDC60ED3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B0A140483;
	Wed, 17 Nov 2021 15:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxwgV815zBTo; Wed, 17 Nov 2021 15:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B9F84026C;
	Wed, 17 Nov 2021 15:10:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3751BF36B
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C84EF4091F
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7foRroXP-k_E for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88646404B8
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:09:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 31AE98D479; Wed, 17 Nov 2021 15:05:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 16:04:27 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: dc50e2a152ddd70ea0a1a4b9ba3353a8e7f74bac
X-Git-Newrev: e030d3cb338fae4cec031152cdb1c010a65f54c8
X-Patchwork-Hint: ignore
Message-Id: <20211117150507.31AE98D479@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/glog: don't
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

commit: https://git.buildroot.net/buildroot/commit/?id=e030d3cb338fae4cec031152cdb1c010a65f54c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Don't override GLOG_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1f9e65b2f34f11d93709a090df799150e00b519e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glog/glog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glog/glog.mk b/package/glog/glog.mk
index 9d31732a88..2863e78345 100644
--- a/package/glog/glog.mk
+++ b/package/glog/glog.mk
@@ -13,7 +13,7 @@ GLOG_CONF_OPTS = \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-DWITH_THREADS=ON, -DWITH_THREADS=OFF)
 
 ifeq ($(BR2_PACKAGE_GFLAGS),y)
-GLOG_DEPENDENCIES = gflags
+GLOG_DEPENDENCIES += gflags
 GLOG_CONF_OPTS += -DWITH_GFLAGS=ON
 else
 GLOG_CONF_OPTS += -DWITH_GFLAGS=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

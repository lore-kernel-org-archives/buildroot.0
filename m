Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFF8C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:06:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EDA561B96
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 15:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EDA561B96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3B9C40250;
	Wed, 17 Nov 2021 15:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4HOqVNwf3RaS; Wed, 17 Nov 2021 15:06:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 418F940452;
	Wed, 17 Nov 2021 15:06:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 724A91BF36B
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 145576064F
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 15:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 92jvSo7hf8G6 for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 15:05:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57CDD606AA
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 15:05:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 02E198D45D; Wed, 17 Nov 2021 15:01:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 16:04:22 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 65f4cfec2c686938ca89f75ba3aaa7fab2f0bf7c
X-Git-Newrev: c4756b5d9f7fac755867f2a6f2d5855de1105a03
X-Patchwork-Hint: ignore
Message-Id: <20211117150120.02E198D45D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/glog: don't
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4756b5d9f7fac755867f2a6f2d5855de1105a03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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

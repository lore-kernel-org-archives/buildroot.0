Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DC2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:41:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F1946101C
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F1946101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F50640259;
	Wed, 10 Nov 2021 09:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbTJaqJDaf7n; Wed, 10 Nov 2021 09:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66D1440223;
	Wed, 10 Nov 2021 09:41:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 332AC1BF345
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CC5A4021B
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:40:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ikoVpj8bIET for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 09:40:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F157403B5
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:40:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D71528B882; Wed, 10 Nov 2021 09:36:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 10:39:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9de2c792e19d572645d1a2e813516fd8e541fa4f
X-Git-Newrev: 1f9e65b2f34f11d93709a090df799150e00b519e
X-Patchwork-Hint: ignore
Message-Id: <20211110093634.D71528B882@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glog: don't override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f9e65b2f34f11d93709a090df799150e00b519e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't override GLOG_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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

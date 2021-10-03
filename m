Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD80FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 07:04:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C55B761B27
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 07:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C55B761B27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9534261746;
	Sun,  3 Oct 2021 07:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NB_i9_Y1gzyl; Sun,  3 Oct 2021 07:04:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01C5561710;
	Sun,  3 Oct 2021 07:04:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA4201BF304
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 07:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7055843C8
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 07:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NNyFoCsq6ELR for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 07:04:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12C43843C6
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 07:04:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9F1C08B3B5; Sun,  3 Oct 2021 07:02:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 08:57:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 556a0a11044b3544b500d97716a7e887ada011fa
X-Git-Newrev: eda35c429b9df120dcb06a34e20619d87b6d2fc3
X-Patchwork-Hint: ignore
Message-Id: <20211003070206.9F1C08B3B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zbar: fix python build
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

commit: https://git.buildroot.net/buildroot/commit/?id=eda35c429b9df120dcb06a34e20619d87b6d2fc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with python raised since its activation
by commit cfc80eeeb4f3cb8e59b56bedd5bd49761764671f:

In file included from /home/giuliobenetti/autobuild/run/instance-2/output-1/host/include/python3.9/Python.h:63,
                 from python/zbarmodule.h:24,
                 from python/zbarmodule.c:24:
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/include/python3.9/pyport.h:741:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  741 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/43a8c8d5403c329f2d754ed09807a53772174397

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zbar/zbar.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index 5554dca6a1..fb83fa01d5 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -34,6 +34,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 ZBAR_DEPENDENCIES += host-python3 python3
 ZBAR_CONF_OPTS += --with-python=python3
+ZBAR_CONF_ENV += PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
 else
 ZBAR_CONF_OPTS += --with-python=no
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

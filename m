Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58419C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:02:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0647061179
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0647061179
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D78CC60771;
	Tue,  9 Nov 2021 10:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsaveY_352q6; Tue,  9 Nov 2021 10:02:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EAE460732;
	Tue,  9 Nov 2021 10:02:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 46E371BF34A
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BB9160764
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVKbVMJLgcwm for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:00:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8161E60771
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:00:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 25DD68B77E; Tue,  9 Nov 2021 09:56:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 10:55:08 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 78b99ec457d88e172118e3e12e1b98c84e7e0197
X-Git-Newrev: 2c78b90d8bdd9f3e048034f27d07b473d9d73dca
X-Patchwork-Hint: ignore
Message-Id: <20211109095623.25DD68B77E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/armadillo: don't
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c78b90d8bdd9f3e048034f27d07b473d9d73dca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Don't override ARMADILLO_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 05fb75e495d0b3f636de7558a14309f1e6061bfb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/armadillo/armadillo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index dcac2bf8cd..8661bfd9da 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -17,7 +17,7 @@ ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
 ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
 ifeq ($(BR2_PACKAGE_ARMADILLO_OPENBLAS),y)
 ARMADILLO_CONF_OPTS += -DBLAS_LIBRARIES=-lopenblas
-ARMADILLO_DEPENDENCIES = openblas
+ARMADILLO_DEPENDENCIES += openblas
 else
 # Since BR2_PACKAGE_LAPACK is selected in this case, the dependency on it is
 # added below.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1418C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:29:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87DB061101
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 20:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87DB061101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6033D40259;
	Sun,  7 Nov 2021 20:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8x1nncQa-rQV; Sun,  7 Nov 2021 20:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB3A440255;
	Sun,  7 Nov 2021 20:28:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17AE61BF28A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1500780CDD
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 20:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AyGbnuwmC0fb for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 20:28:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7920680CA6
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 20:28:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B005B8B50B; Sun,  7 Nov 2021 20:24:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Nov 2021 21:27:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f1fa3b615aacee8846387eb975bb35309f36015
X-Git-Newrev: 05fb75e495d0b3f636de7558a14309f1e6061bfb
X-Patchwork-Hint: ignore
Message-Id: <20211107202455.B005B8B50B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: don't override
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=05fb75e495d0b3f636de7558a14309f1e6061bfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't override ARMADILLO_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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

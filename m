Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB648C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 893988512A;
	Sun, 11 Feb 2024 21:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cnrG7j46mxBJ; Sun, 11 Feb 2024 21:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 827798511E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 827798511E;
	Sun, 11 Feb 2024 21:38:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 740C81BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C238840C5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JIZmEmTP7sNU for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95C2D84201
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95C2D84201
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:37:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E7F2877AF; Sun, 11 Feb 2024 21:37:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:36:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6444c4278d643f4f315afa3e42d8cce7faf20da4
X-Git-Newrev: 1d95ad6100036debde5670262ececac336b5f252
X-Patchwork-Hint: ignore
Message-Id: <20240211213756.3E7F2877AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: replace
 PKG_PYTHON_DISTUTILS_ENV
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d95ad6100036debde5670262ececac336b5f252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace PKG_PYTHON_DISTUTILS_ENV by PKG_PYTHON_SETUPTOOLS_ENV
to avoid an issue with naming of python modules since commit
09de823cbc7bd50a40e25f4166b4e42be94b0c7b

Fixes: 09de823cbc7bd50a40e25f4166b4e42be94b0c7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv4/opencv4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index b535761cb2..e50e0f99a9 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -410,7 +410,7 @@ OPENCV4_CONF_OPTS += \
 	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
 OPENCV4_DEPENDENCIES += python3
 OPENCV4_KEEP_PY_FILES += usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/cv2/config*.py
-OPENCV4_CONF_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
+OPENCV4_CONF_ENV += $(PKG_PYTHON_SETUPTOOLS_ENV)
 OPENCV4_DEPENDENCIES += python-numpy
 else
 OPENCV4_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

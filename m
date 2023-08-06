Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13B1EC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 688BE80B62;
	Thu,  7 Sep 2023 15:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 688BE80B62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBTfOnpShQIT; Thu,  7 Sep 2023 15:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A55FC80B33;
	Thu,  7 Sep 2023 15:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A55FC80B33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D5941BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FF7141DD7
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FF7141DD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PxQNU3tTepO4 for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEB7D41D96
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEB7D41D96
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0AB186A20; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 18:06:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78ba3e6f2d26cdd488f9f845e1169d46b70f2912
X-Git-Newrev: 8ee5eb587e9bf7e718ec00625ddf7385cad05af1
X-Patchwork-Hint: ignore
Message-Id: <20230907145126.E0AB186A20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyratemp: switch from
 distutils to setuptools
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ee5eb587e9bf7e718ec00625ddf7385cad05af1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

distutils will be dropped with python 3.12.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyratemp/python-pyratemp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyratemp/python-pyratemp.mk b/package/python-pyratemp/python-pyratemp.mk
index 055fb3049c..6429729a7b 100644
--- a/package/python-pyratemp/python-pyratemp.mk
+++ b/package/python-pyratemp/python-pyratemp.mk
@@ -9,6 +9,6 @@ PYTHON_PYRATEMP_SOURCE = pyratemp-$(PYTHON_PYRATEMP_VERSION).tgz
 PYTHON_PYRATEMP_SITE = https://pypi.python.org/packages/source/p/pyratemp
 PYTHON_PYRATEMP_LICENSE = MIT
 PYTHON_PYRATEMP_LICENSE_FILES = LICENSE
-PYTHON_PYRATEMP_SETUP_TYPE = distutils
+PYTHON_PYRATEMP_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

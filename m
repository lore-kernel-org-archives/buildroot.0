Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB77C001DF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 20:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45609831DA;
	Wed, 26 Jul 2023 20:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45609831DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5hwtAJafxt2w; Wed, 26 Jul 2023 20:15:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AABB81585;
	Wed, 26 Jul 2023 20:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AABB81585
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 630291BF40D
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C82B40144
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 20:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C82B40144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZNtXetwRi-0M for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 20:15:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7592940649
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 20:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7592940649
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6339083570; Wed, 26 Jul 2023 20:15:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 22:14:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bef2298f5a9e465b39ef93308ab028d228c2b408
X-Git-Newrev: dd194540a1b8e9f70a01c6bf9c574863168e6778
X-Patchwork-Hint: ignore
Message-Id: <20230726201518.6339083570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crudini: add host variant
 dependency from python-iniparse
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd194540a1b8e9f70a01c6bf9c574863168e6778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crudini/crudini.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index c376c5f777..48e0ebde8f 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -9,6 +9,9 @@ CRUDINI_SITE = $(call github,pixelb,crudini,$(CRUDINI_VERSION))
 CRUDINI_SETUP_TYPE = setuptools
 CRUDINI_LICENSE = GPL-2.0
 CRUDINI_LICENSE_FILES = COPYING
+# This is a runtime dependency, but we don't have the concept of
+# runtime dependencies for host packages.
+HOST_CRUDINI_DEPENDENCIES = host-python-iniparse
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

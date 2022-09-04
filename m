Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5D9ECAAD3
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 13:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C22FA40573;
	Sun,  4 Sep 2022 13:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C22FA40573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CtBB84XDjMbE; Sun,  4 Sep 2022 13:46:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A1864056A;
	Sun,  4 Sep 2022 13:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A1864056A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FCA31BF3F0
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 13:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58BDB408BB
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 13:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58BDB408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U7DHD6XDgchs for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 13:46:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CA2840363
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CA2840363
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 13:46:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [92.184.105.16])
 (Authenticated sender: thierry.guibert@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A7873780346;
 Sun,  4 Sep 2022 15:46:45 +0200 (CEST)
To: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Date: Sun,  4 Sep 2022 15:46:13 +0200
Message-Id: <20220904134613.31886-1-thierry.guibert@croix-rouge.fr>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Add documentation about docker registry
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
From: Thierry GUIBERT via buildroot <buildroot@buildroot.org>
Reply-To: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
Cc: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
---
 docs/manual/adding-board-support.txt | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
index cd90a5871f..f68e192468 100644
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -48,9 +48,22 @@ and configurations in these directories, and reference them from the main
 Buildroot configuration. Refer to xref:customize[] for more details.
 
 Before submitting patches for new boards it is recommended to test it by
-building it using latest gitlab-CI docker container. To do this use
-utils/docker-run script and inside it issue these commands:
+building it using latest gitlab-CI docker container. 
+To do this use utils/docker-run script and inside it issue these commands:
 --------------------
- $ make +<boardname>_defconfig+
+ $ make <boardname>_defconfig
  $ make
 --------------------
+
+By defaut, buildroot developpers use our gitlab.com registry and it should
+be convenient for most usages. 
+If you still want to build your own docker images :
+--------------------
+ $ DOCKER_REGISTRY=registry.gitlab.com
+ $ IMAGE_NAME=buildroot.org/buildroot/base
+ $ IMAGE_TAG=YYYYMMDD.HHMM
+ $ docker build  --pull --no-cache \
+	-t ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} support/docker
+ $ docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}
+--------------------
+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

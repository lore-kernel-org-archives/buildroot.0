Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB273C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E2376100F;
	Tue,  7 Feb 2023 17:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E2376100F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFLhbNWZPIFR; Tue,  7 Feb 2023 17:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9BB76100C;
	Tue,  7 Feb 2023 17:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9BB76100C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2CD71BF95F
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D44B40A71
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D44B40A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y-3vyBJcZYb3 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:19:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCBAA40A68
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCBAA40A68
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 920A58430C; Tue,  7 Feb 2023 17:19:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 18:15:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a7c6725f6ca5c1108e6fb76fad414132555b373
X-Git-Newrev: bde165f7ad4922e218cabdb6eb7c40e1661179f0
X-Patchwork-Hint: ignore
Message-Id: <20230207171938.920A58430C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .gitlab-ci.yml: update Docker image to use
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

commit: https://git.buildroot.net/buildroot/commit/?id=bde165f7ad4922e218cabdb6eb7c40e1661179f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have a new Docker image, updated with the new requirements from
bcd15aa08aab1e8292b93995c44dc765a9801632 ("support/docker: add
python3-magic"), but also with an updated Debian Bullseye
installation. Let's use it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index cad35c96bc..ed17bb14b9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,7 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
 
-image: $CI_REGISTRY/buildroot.org/buildroot/base:20220206.1756
+image: $CI_REGISTRY/buildroot.org/buildroot/base:20230207.1123
 
 stages:
   - generate-gitlab-ci
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

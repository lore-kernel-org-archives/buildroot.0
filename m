Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34897C77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D079540AA1;
	Sun, 23 Apr 2023 10:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D079540AA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqYgWJNwlDVB; Sun, 23 Apr 2023 10:33:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 077E540B53;
	Sun, 23 Apr 2023 10:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 077E540B53
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0153E1C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF43260777
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF43260777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bf1ch5DEfX5R for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:33:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A13F60067
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A13F60067
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC1A782578; Sun, 23 Apr 2023 10:33:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 12:28:06 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 8e4bf44aad24a56f68cafec59446f7c0565c5524
X-Git-Newrev: 7e86856d69666ae506bde293942ae335dd35fb4e
X-Patchwork-Hint: ignore
Message-Id: <20230423103321.CC1A782578@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] doc/manual: add
 documentation about docker registry on gitlab.com
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e86856d69666ae506bde293942ae335dd35fb4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Add a paragraph and an example about using the Buildroot image registry
hosted on gtilab.com, for people who want to build their own image based
on the offical one.

Signed-off-by: Thierry GUIBERT <thierry.guibert@croix-rouge.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d9228faa4dbda084168e3c83273e651c05b6b08b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-board-support.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
index cd90a5871f..b3a8802452 100644
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -54,3 +54,19 @@ utils/docker-run script and inside it issue these commands:
  $ make +<boardname>_defconfig+
  $ make
 --------------------
+
+By default, Buildroot developers use the official image hosted on the
+https://gitlab.com/buildroot.org/buildroot/container_registry/2395076[gitlab.com
+registry] and it should be convenient for most usage. If you still want
+to build your own docker image, you can base it off the official image
+as the +FROM+ directive of your own _Dockerfile_:
+
+----
+FROM registry.gitlab.com/buildroot.org/buildroot/base:YYYYMMDD.HHMM
+RUN ...
+COPY ...
+----
+
+The current version _YYYYMMDD.HHMM_ can be found in the +.gitlab-ci.yml+
+file at the top of the Buildroot source tree; all past versions are
+listed in the aforementioned registry as well.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

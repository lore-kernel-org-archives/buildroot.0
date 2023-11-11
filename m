Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA7FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 13:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32DBF610FE;
	Sat, 11 Nov 2023 13:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32DBF610FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v2zSkEQERfuP; Sat, 11 Nov 2023 13:32:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69520610F2;
	Sat, 11 Nov 2023 13:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69520610F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E13C31BF3BD
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 13:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAED6822F0
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 13:30:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAED6822F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eko-ypL3axEc for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 13:30:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A40E0822EA
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 13:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A40E0822EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 942ED86C56; Sat, 11 Nov 2023 13:30:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 14:18:20 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 51ba58a112736b915cacc96d7e9f8597c08f9275
X-Git-Newrev: 8b09097f4f2082afca7760a7d5172d29bd0eacbf
X-Patchwork-Hint: ignore
Message-Id: <20231111133057.942ED86C56@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/go: security bump
 to version 1.20.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b09097f4f2082afca7760a7d5172d29bd0eacbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fixes the following (Windows only) security issues:

CVE-2023-45283: path/filepath: recognize \??\ as a Root Local Device path prefix.
CVE-2023-45284: path/filepath: recognize device names with trailing spaces and superscripts

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index a4aafbe6e4..12a9dfd5da 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  72d2f51805c47150066c103754c75fddb2c19d48c9219fa33d1e46696c841dbb  go1.20.10.src.tar.gz
+sha256  d355c5ae3a8f7763c9ec9dc25153aae373958cbcb60dd09e91a8b56c7621b2fc  go1.20.11.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index c3f88b8682..e6fd46d15c 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.20.10
+GO_VERSION = 1.20.11
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

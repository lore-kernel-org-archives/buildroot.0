Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70C7C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 09:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26F4880B23;
	Thu,  8 Aug 2024 09:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6gmlNNY-rgSj; Thu,  8 Aug 2024 09:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2852080D1D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2852080D1D;
	Thu,  8 Aug 2024 09:59:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAC8A1BF21A
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 09:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D84C840DBB
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 09:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsS4r7Vq9MGu for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 09:59:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C0A740CA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C0A740CA5
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 09:59:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88D8C81025; Thu,  8 Aug 2024 09:59:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 23:10:21 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: abf5e2571d1b1e5d787b9e9ac2215347916c9aa2
X-Git-Newrev: 886cdf6c91652bb533ec714b0b29dd23ea8ed829
X-Patchwork-Hint: ignore
Message-Id: <20240808095948.88D8C81025@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/go: security bump
 version to go1.22.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=886cdf6c91652bb533ec714b0b29dd23ea8ed829
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fixes CVE:

CVE-2024-24791: net/http: denial of service due to improper 100-continue handling

https://go.dev/doc/devel/release#go1.22.5

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5d02277884e406625c0142e7c3e68dfe30bdf6c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 7952461f2d..d300f6e2c9 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  fed720678e728a7ca30ba8d1ded1caafe27d16028fab0232b8ba8e22008fb784  go1.22.4.src.tar.gz
+sha256  ac9c723f224969aee624bc34fd34c9e13f2a212d75c71c807de644bb46e112f6  go1.22.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 461a472dd4..e6f61d643b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.22.4
+GO_VERSION = 1.22.5
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

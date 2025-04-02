Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57D9C28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 07:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DF8883A54;
	Wed,  2 Apr 2025 07:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ku-ySDkUTrLx; Wed,  2 Apr 2025 07:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A81DE83A45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A81DE83A45;
	Wed,  2 Apr 2025 07:28:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 792BA11F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 07:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FD03411EB
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 07:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OEipAdzJkdI for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 07:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6807D4126B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6807D4126B
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 07:28:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 557B083A80; Wed,  2 Apr 2025 07:28:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Apr 2025 09:28:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e6bd098c31cf981c1498f105cf35405e1518c4c
X-Git-Newrev: 57647739576ca542bee6e05c5c839f48e86ce98b
X-Patchwork-Hint: ignore
Message-Id: <20250402072839.557B083A80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version 1.23.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=57647739576ca542bee6e05c5c839f48e86ce98b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.23.8 (released 2025-04-01) includes security fixes to the net/http package,
as well as bug fixes to the runtime and the go command.

https://go.dev/doc/devel/release#go1.23.8
https://github.com/golang/go/issues?q=milestone%3AGo1.23.8+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 8b9541642d..48ba6b7fd9 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  7cfabd46b73eb4c26b19d69515dd043d7183a6559acccd5cfdb25eb6b266a458  go1.23.7.src.tar.gz
-sha256  9115f7d751efe5b17b63a7630d24cd0a2479976465eecb277b5deec8aa0f4143  go1.23.7.linux-386.tar.gz
-sha256  4741525e69841f2e22f9992af25df0c1112b07501f61f741c12c6389fcb119f3  go1.23.7.linux-amd64.tar.gz
-sha256  597acbd0505250d4d98c4c83adf201562a8c812cbcd7b341689a07087a87a541  go1.23.7.linux-arm64.tar.gz
-sha256  c9e9ecd6a8cf1429f1c65d81115c450258258ac65833d95a82d5f4e5ad7d2d7a  go1.23.7.linux-armv6l.tar.gz
-sha256  3ffc310bfd11fd0bcc713a764a0f7252c4d52d03f12abebfaebaaae77e027028  go1.23.7.linux-ppc64le.tar.gz
-sha256  af1d4c5d01e32c2cf6e3cc00e44cb240e1a6cef539b28a64389b2b9ca284ac6c  go1.23.7.linux-s390x.tar.gz
+sha256  0ca1f1e37ea255e3ce283af3f4e628502fb444587da987a5bb96d6c6f15930d4  go1.23.8.src.tar.gz
+sha256  714b9d004063bfa27686f9ff0e5648bb190b3a5bc1e86b0aa16c134d8d8c315f  go1.23.8.linux-386.tar.gz
+sha256  45b87381172a58d62c977f27c4683c8681ef36580abecd14fd124d24ca306d3f  go1.23.8.linux-amd64.tar.gz
+sha256  9d6d938422724a954832d6f806d397cf85ccfde8c581c201673e50e634fdc992  go1.23.8.linux-arm64.tar.gz
+sha256  d14e0bea9fb25344a0460f395880d5589bbcd413ffd5555be48e46c0de084437  go1.23.8.linux-armv6l.tar.gz
+sha256  0cadab469e612b159f5f68b1a30d75aa7b7e1ed5292746005a6a3c8ff04e6f35  go1.23.8.linux-ppc64le.tar.gz
+sha256  cbe954ee534eb02aa782639716d8c25706dd171445f7c8336bd2fc0b8f6fe38e  go1.23.8.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index da380483ef..d618a7a262 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.7
+GO_VERSION = 1.23.8
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

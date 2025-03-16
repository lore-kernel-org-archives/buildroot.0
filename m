Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AFBC282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 20:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 046866070C;
	Sun, 16 Mar 2025 20:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0a1N2lW6cir; Sun, 16 Mar 2025 20:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06AC560756
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06AC560756;
	Sun, 16 Mar 2025 20:26:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1710C61
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF9CC802E7
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRxPGrIwsHRH for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 20:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2368F803E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2368F803E6
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:26:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D66088054; Sun, 16 Mar 2025 20:26:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Mar 2025 20:54:16 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 673a38db1c0654df6c9912716428c46177cb48e1
X-Git-Newrev: ac7632af83d2bb58d9875166e053ae3213d0447b
X-Patchwork-Hint: ignore
Message-Id: <20250316202646.0D66088054@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/go: security bump
 to version 1.23.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac7632af83d2bb58d9875166e053ae3213d0447b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

go1.23.7 (released 2025-03-04) includes security fixes to the net/http
package, as well as bug fixes to cgo, the compiler, and the reflect,
runtime, and syscall package.

https://github.com/golang/go/issues?q=milestone%3AGo1.23.7+label%3ACherryPickApproved

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-22870

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: add candidate CVE link]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 77674c6cfbd40e174048897255658d31e3ead15a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index fd2cd71c59..8b9541642d 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  039c5b04e65279daceee8a6f71e70bd05cf5b801782b6f77c6e19e2ed0511222  go1.23.6.src.tar.gz
-sha256  e61f87693169c0bbcc43363128f1e929b9dff0b7f448573f1bdd4e4a0b9687ba  go1.23.6.linux-386.tar.gz
-sha256  9379441ea310de000f33a4dc767bd966e72ab2826270e038e78b2c53c2e7802d  go1.23.6.linux-amd64.tar.gz
-sha256  561c780e8f4a8955d32bf72e46af0b5ee5e0debe1e4633df9a03781878219202  go1.23.6.linux-arm64.tar.gz
-sha256  27a4611010c16b8c4f37ade3aada55bd5781998f02f348b164302fd5eea4eb74  go1.23.6.linux-armv6l.tar.gz
-sha256  0f817201e83d78ddbfa27f5f78d9b72450b92cc21d5e045145efacd0d3244a99  go1.23.6.linux-ppc64le.tar.gz
-sha256  321e7ed0d5416f731479c52fa7610b52b8079a8061967bd48cec6d66f671a60e  go1.23.6.linux-s390x.tar.gz
+sha256  7cfabd46b73eb4c26b19d69515dd043d7183a6559acccd5cfdb25eb6b266a458  go1.23.7.src.tar.gz
+sha256  9115f7d751efe5b17b63a7630d24cd0a2479976465eecb277b5deec8aa0f4143  go1.23.7.linux-386.tar.gz
+sha256  4741525e69841f2e22f9992af25df0c1112b07501f61f741c12c6389fcb119f3  go1.23.7.linux-amd64.tar.gz
+sha256  597acbd0505250d4d98c4c83adf201562a8c812cbcd7b341689a07087a87a541  go1.23.7.linux-arm64.tar.gz
+sha256  c9e9ecd6a8cf1429f1c65d81115c450258258ac65833d95a82d5f4e5ad7d2d7a  go1.23.7.linux-armv6l.tar.gz
+sha256  3ffc310bfd11fd0bcc713a764a0f7252c4d52d03f12abebfaebaaae77e027028  go1.23.7.linux-ppc64le.tar.gz
+sha256  af1d4c5d01e32c2cf6e3cc00e44cb240e1a6cef539b28a64389b2b9ca284ac6c  go1.23.7.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index fd47ed7c3b..da380483ef 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.6
+GO_VERSION = 1.23.7
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

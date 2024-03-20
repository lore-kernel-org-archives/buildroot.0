Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF684C54E58
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 20:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC9CA82079;
	Wed, 20 Mar 2024 20:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3PCMQFWZFKL; Wed, 20 Mar 2024 20:35:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 536E78211F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 536E78211F;
	Wed, 20 Mar 2024 20:35:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C3CE1BF5AE
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36A17819D2
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lS_8hbloFcIh for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 20:35:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66A7C81499
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66A7C81499
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 20:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5431F8371F; Wed, 20 Mar 2024 20:35:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Mar 2024 21:17:31 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: aedb8c4b32455f07a5cd1e735d01246c1c1243c0
X-Git-Newrev: 78944b8b93df6c6841cf6a1b91848e581ba09bac
X-Patchwork-Hint: ignore
Message-Id: <20240320203532.5431F8371F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/go: security bump
 to go1.21.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=78944b8b93df6c6841cf6a1b91848e581ba09bac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fixes the following CVEs:

CVE-2024-24783: crypto/x509: Verify panics on certificates with an unknown public key algorithm
CVE-2023-45290: net/http: memory exhaustion in Request.ParseMultipartForm
CVE-2023-45289: net/http, net/http/cookiejar: incorrect forwarding of sensitive headers and cookies on HTTP redirect
CVE-2024-24785: html/template: errors returned from MarshalJSON methods may break template escaping
CVE-2024-24784: net/mail: comments in display names are incorrectly handled

https://go.dev/doc/devel/release#go1.21.8

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a94f816e4595e651e78eebfa49fa695cfe44cd77)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index d008019e94..b1aed10c7c 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  00197ab20f33813832bff62fd93cca1c42a08cc689a32a6672ca49591959bff6  go1.21.7.src.tar.gz
+sha256  dc806cf75a87e1414b5b4c3dcb9dd3e9cc98f4cfccec42b7af617d5a658a3c43  go1.21.8.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 9efd4a3123..3ca055b25d 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.7
+GO_VERSION = 1.21.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

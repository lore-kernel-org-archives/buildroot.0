Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48B0C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 07:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52B5A40642;
	Wed,  8 Nov 2023 07:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52B5A40642
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d2QIKiMUJPTw; Wed,  8 Nov 2023 07:09:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FDCA40900;
	Wed,  8 Nov 2023 07:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FDCA40900
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A99F1BF47F
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 07:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6924408B0
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 07:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6924408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YF0IZbGESbF5 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 07:09:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1BB940930
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 07:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BB940930
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B18086C79; Wed,  8 Nov 2023 07:09:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 08:07:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b660402b5722c8b4c0ead8739dc2ec2f6a8dfa11
X-Git-Newrev: bf1d1a9b7a7e3441810a9caa557e38724856899e
X-Patchwork-Hint: ignore
Message-Id: <20231108070929.9B18086C79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to go1.21.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf1d1a9b7a7e3441810a9caa557e38724856899e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Go version 1.21.4 includes the following security fixes:

CVE-2023-45283: path/filepath: recognize \??\ as a Root Local Device path prefix.
CVE-2023-45284: path/filepath: recognize device names with trailing spaces and superscripts

https://go.dev/doc/devel/release#go1.21.4

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 9499f50964..74b18a9b38 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  186f2b6f8c8b704e696821b09ab2041a5c1ee13dcbc3156a13adcf75931ee488  go1.21.3.src.tar.gz
+sha256  47b26a83d2b65a3c1c1bcace273b69bee49a7a7b5168a7604ded3d26a37bd787  go1.21.4.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index ef27f32835..7bd7866a05 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.3
+GO_VERSION = 1.21.4
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

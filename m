Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3218E95A8E
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 21:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE96B820F8;
	Sun,  8 Oct 2023 21:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE96B820F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVYPQbeqMuBw; Sun,  8 Oct 2023 21:29:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A11C2821D6;
	Sun,  8 Oct 2023 21:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A11C2821D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7D6A1BF2C8
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 21:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 068376101A
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 21:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 068376101A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rj6PlI6955rz for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 21:27:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7212F60EE2
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 21:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7212F60EE2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FA83843FA; Sun,  8 Oct 2023 21:27:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Oct 2023 23:17:41 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: dadc84b7c9952f1c0b1c9b1b680db6ccf0c6c6b3
X-Git-Newrev: e57c04d9204736f331cb522d441f9981065b79c3
X-Patchwork-Hint: ignore
Message-Id: <20231008212753.4FA83843FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/go: security bump
 to version 1.20.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=e57c04d9204736f331cb522d441f9981065b79c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes CVE-2023-39323: Line directives ("//line") can be used to bypass the
restrictions on "//go:cgo_" directives, allowing blocked linker and compiler
flags to be passed during compilation.  This can result in unexpected
execution of arbitrary code when running "go build".

go1.20.9 (released 2023-10-05) includes one security fixes to the cmd/go
package, as well as bug fixes to the go command and the linker.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1da113559fc7a6f7f420c9026c1f4102bd7ac81d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 19405982ba..ac603e6e3b 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  38d71714fa5279f97240451956d8e47e3c1b6a5de7cb84137949d62b5dd3182e  go1.20.8.src.tar.gz
+sha256  4923920381cd71d68b527761afefa523ea18c5831b4795034c827e18b685cdcf  go1.20.9.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index c1e9f2f8f6..d75c1afa9e 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.20.8
+GO_VERSION = 1.20.9
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

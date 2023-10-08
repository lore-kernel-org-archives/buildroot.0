Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7508EE95A8E
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 21:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D0F881FA2;
	Sun,  8 Oct 2023 21:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D0F881FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFZ6LCgkJebq; Sun,  8 Oct 2023 21:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6179981FA8;
	Sun,  8 Oct 2023 21:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6179981FA8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0256A1BF2C8
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 21:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFFAA81F97
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 21:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFFAA81F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mfFMmW5rDacv for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 21:27:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56A8481F67
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 21:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56A8481F67
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47067843FF; Sun,  8 Oct 2023 21:27:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Oct 2023 23:17:40 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: b6a17127cbe62873b0b63029ffcf1781b51a8ab3
X-Git-Newrev: dadc84b7c9952f1c0b1c9b1b680db6ccf0c6c6b3
X-Patchwork-Hint: ignore
Message-Id: <20231008212753.47067843FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/go: security bump
 to version 1.20.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=dadc84b7c9952f1c0b1c9b1b680db6ccf0c6c6b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

go1.20.8 (released 2023-09-06) includes two security fixes to the html/template
package, as well as bug fixes to the compiler, the go command, the runtime, and
the crypto/tls, go/types, net/http, and path/filepath packages.

CVE-2023-39318: html/template: improper handling of HTML-like comments within script contexts
CVE-2023-39319: html/template: improper handling of special tags within script contexts
CVE-2023-39321: crypto/tls: panic when processing post-handshake message on QUIC connections

https://go.dev/doc/devel/release#go1.20.0

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2b72f1d1676afc330b4f94431b7914817c796bb3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 2298534d91..19405982ba 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  2c5ee9c9ec1e733b0dbbc2bdfed3f62306e51d8172bf38f4f4e542b27520f597  go1.20.7.src.tar.gz
+sha256  38d71714fa5279f97240451956d8e47e3c1b6a5de7cb84137949d62b5dd3182e  go1.20.8.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index fc1d9ed681..c1e9f2f8f6 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.20.7
+GO_VERSION = 1.20.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

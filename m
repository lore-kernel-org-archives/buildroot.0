Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A079FC7EE21
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 19:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57C3361685;
	Thu,  4 May 2023 19:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C3361685
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q1HQEm-IJ9SZ; Thu,  4 May 2023 19:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F71F61698;
	Thu,  4 May 2023 19:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F71F61698
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF2071BF3BA
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 19:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2100442782
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 19:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2100442782
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GUzIAW9lLVKI for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 19:20:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00FDB42784
 for <buildroot@buildroot.org>; Thu,  4 May 2023 19:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00FDB42784
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E300785D5B; Thu,  4 May 2023 19:20:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 21:16:44 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3232298f1ebc8402b36256a15e37458ec85bff82
X-Git-Newrev: 0189f41ecc41818feb932818771249c2684ea34d
X-Patchwork-Hint: ignore
Message-Id: <20230504192056.E300785D5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/go: security bump
 to version 1.19.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=0189f41ecc41818feb932818771249c2684ea34d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

go1.19.9 (released 2023-05-02) includes three security fixes to the
html/template package, as well as bug fixes to the compiler, the runtime, and
the crypto/subtle, crypto/tls, net/http, and syscall packages.

CVE-2023-24539: html/template: improper sanitization of CSS values
CVE-2023-24540: html/template: improper handling of JavaScript whitespace
CVE-2023-29400: html/template: improper handling of empty HTML attributes

https://go.dev/doc/devel/release#go1.19.9
https://github.com/golang/go/issues?q=milestone%3AGo1.19.9+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 509a5d66c4672ce2e8418c3fe1aa5834ab4acb53)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 5488ed9710..ffe42bf395 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  1d7a67929dccafeaf8a29e55985bc2b789e0499cb1a17100039f084e3238da2f  go1.19.8.src.tar.gz
+sha256  131190a4697a70c5b1d232df5d3f55a3f9ec0e78e40516196ffb3f09ae6a5744  go1.19.9.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 37554ddf86..89c3577982 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.8
+GO_VERSION = 1.19.9
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

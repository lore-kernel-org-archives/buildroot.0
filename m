Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A32EE57F0
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 10:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CA1D61085;
	Fri,  8 Sep 2023 10:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CA1D61085
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99Y-4UNmZFM8; Fri,  8 Sep 2023 10:20:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A22E61073;
	Fri,  8 Sep 2023 10:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A22E61073
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10A291BF31E
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 10:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE4B3820C8
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 10:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE4B3820C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQ3SxvqZifk4 for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 10:20:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09AAA82032
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 10:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09AAA82032
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5DD986ABC; Fri,  8 Sep 2023 10:20:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Sep 2023 12:20:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9abda63520b0b2c14353af90b9b6160d4fadea9
X-Git-Newrev: 5d95b4d90dcbf412894de5439f2db55dda8e8630
X-Patchwork-Hint: ignore
Message-Id: <20230908102040.E5DD986ABC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version 1.21.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d95b4d90dcbf412894de5439f2db55dda8e8630
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.21.1 (released 2023-09-06) includes four security fixes to the cmd/go,
crypto/tls, and html/template packages, as well as bug fixes to the compiler,
the go command, the linker, the runtime, and the context, crypto/tls,
encoding/gob, encoding/xml, go/types, net/http, os, and path/filepath packages.

Security fixes:

CVE-2023-39320: cmd/go: go.mod toolchain directive allows arbitrary execution
CVE-2023-39318: html/template: improper handling of HTML-like comments within script contexts
CVE-2023-39319: html/template: improper handling of special tags within script contexts
CVE-2023-39321: crypto/tls: panic when processing post-handshake message on QUIC connections

https://go.dev/doc/devel/release#go1.21.0

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 2289442a72..be8af438b3 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  818d46ede85682dd551ad378ef37a4d247006f12ec59b5b755601d2ce114369a  go1.21.0.src.tar.gz
+sha256  bfa36bf75e9a1e9cbbdb9abcf9d1707e479bd3a07880a8ae3564caee5711cb99  go1.21.1.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 04aa612256..aa5d7f97b5 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.0
+GO_VERSION = 1.21.1
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

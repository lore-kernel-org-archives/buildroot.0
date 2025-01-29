Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37909C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0465584CE0;
	Fri, 28 Feb 2025 17:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fK_tF7Pqbxzm; Fri, 28 Feb 2025 17:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA86A8588B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA86A8588B;
	Fri, 28 Feb 2025 17:06:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 106EA1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3A8C41A27
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1goSy_jmZZz for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C70D42EE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C70D42EE9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 114AA87A09; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jan 2025 21:54:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 15891236dbfb20ea971877918e9579b246f7c43c
X-Git-Newrev: 6299f479d124ebe01f12f4044e2b978463cbc3b6
X-Patchwork-Hint: ignore
Message-Id: <20250228163023.114AA87A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/go: security bump to
 version 1.23.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=6299f479d124ebe01f12f4044e2b978463cbc3b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

go1.23.5 (released 2025-01-16) includes security fixes to the crypto/x509 and
net/http packages, as well as bug fixes to the compiler, the runtime, and the
net package.

https://go.dev/doc/devel/release#go1.23.5
https://github.com/golang/go/issues?q=milestone%3AGo1.23.5+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go-bin/go-bin.hash | 14 +++++++-------
 package/go/go-src/go-src.hash |  2 +-
 package/go/go.mk              |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
index 37e1db20a9..39e6491376 100644
--- a/package/go/go-bin/go-bin.hash
+++ b/package/go/go-bin/go-bin.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263531  go1.23.4.src.tar.gz
-sha256  4a4a0e7587ef8c8a326439b957027f2791795e2d29d4ae3885b4091a48f843bc  go1.23.4.linux-386.tar.gz
-sha256  6924efde5de86fe277676e929dc9917d466efa02fb934197bc2eba35d5680971  go1.23.4.linux-amd64.tar.gz
-sha256  16e5017863a7f6071363782b1b8042eb12c6ca4f4cd71528b2123f0a1275b13e  go1.23.4.linux-arm64.tar.gz
-sha256  1f1dda0dc7ce0b2295f57258ec5ef0803fd31b9ed0aa20e2e9222334e5755de1  go1.23.4.linux-armv6l.tar.gz
-sha256  65a303ef51e48ff77e004a6a5b4db6ce59495cd59c6af51b54bf4f786c01a1b9  go1.23.4.linux-ppc64le.tar.gz
-sha256  74aab82bf4eca7c26c830a5b0e2a31d193a4d5ba47045526b92473cc7188d7d7  go1.23.4.linux-s390x.tar.gz
+sha256  a6f3f4bbd3e6bdd626f79b668f212fbb5649daf75084fb79b678a0ae4d97423b  go1.23.5.src.tar.gz
+sha256  6ecf6a41d0925358905fa2641db0e1c9037aa5b5bcd26ca6734caf50d9196417  go1.23.5.linux-386.tar.gz
+sha256  cbcad4a6482107c7c7926df1608106c189417163428200ce357695cc7e01d091  go1.23.5.linux-amd64.tar.gz
+sha256  47c84d332123883653b70da2db7dd57d2a865921ba4724efcdf56b5da7021db0  go1.23.5.linux-arm64.tar.gz
+sha256  04e0b5cf5c216f0aa1bf8204d49312ad0845800ab0702dfe4357c0b1241027a3  go1.23.5.linux-armv6l.tar.gz
+sha256  db268bf5710b5b1b82ab38722ba6e4427d9e4942aed78c7d09195a9dff329613  go1.23.5.linux-ppc64le.tar.gz
+sha256  14924b917d35311eb130e263f34931043d4f9dc65f20684301bf8f60a72edcdf  go1.23.5.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index 0b11d8d392..4c8ae3ca5e 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263531  go1.23.4.src.tar.gz
+sha256  a6f3f4bbd3e6bdd626f79b668f212fbb5649daf75084fb79b678a0ae4d97423b  go1.23.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 91d9f8d1c1..3d1b42ee0e 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.4
+GO_VERSION = 1.23.5
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

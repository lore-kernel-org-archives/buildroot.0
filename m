Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BB2C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31B1F41553;
	Wed,  5 Feb 2025 11:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id carnPRit80aw; Wed,  5 Feb 2025 11:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CC51413BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CC51413BF;
	Wed,  5 Feb 2025 11:42:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84F4F185
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66D9F405A5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aCfnlHw_HwZR for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 436D140181
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 436D140181
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:42:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EE6E8702F; Wed,  5 Feb 2025 11:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 12:36:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e5241e1cfc05b3521e663c30365cc7afe9bb9e5
X-Git-Newrev: b4006287f86ad52b0f5bf929f4a7f34c1a5720b4
X-Patchwork-Hint: ignore
Message-Id: <20250205114235.2EE6E8702F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump to version 1.23.6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b4006287f86ad52b0f5bf929f4a7f34c1a5720b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.23.6 (released 2025-02-04) includes security fixes to the
crypto/elliptic package, as well as bug fixes to the compiler and the go
command.

https://go.dev/doc/devel/release#go1.23.6
https://github.com/golang/go/issues?q=milestone%3AGo1.23.6+label%3ACherryPickApproved

While we are at it, drop the unused source tarball hash from the go-bin
package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go-bin/go-bin.hash | 13 ++++++-------
 package/go/go-src/go-src.hash |  2 +-
 package/go/go.mk              |  2 +-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
index 39e6491376..50d2be239f 100644
--- a/package/go/go-bin/go-bin.hash
+++ b/package/go/go-bin/go-bin.hash
@@ -1,9 +1,8 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  a6f3f4bbd3e6bdd626f79b668f212fbb5649daf75084fb79b678a0ae4d97423b  go1.23.5.src.tar.gz
-sha256  6ecf6a41d0925358905fa2641db0e1c9037aa5b5bcd26ca6734caf50d9196417  go1.23.5.linux-386.tar.gz
-sha256  cbcad4a6482107c7c7926df1608106c189417163428200ce357695cc7e01d091  go1.23.5.linux-amd64.tar.gz
-sha256  47c84d332123883653b70da2db7dd57d2a865921ba4724efcdf56b5da7021db0  go1.23.5.linux-arm64.tar.gz
-sha256  04e0b5cf5c216f0aa1bf8204d49312ad0845800ab0702dfe4357c0b1241027a3  go1.23.5.linux-armv6l.tar.gz
-sha256  db268bf5710b5b1b82ab38722ba6e4427d9e4942aed78c7d09195a9dff329613  go1.23.5.linux-ppc64le.tar.gz
-sha256  14924b917d35311eb130e263f34931043d4f9dc65f20684301bf8f60a72edcdf  go1.23.5.linux-s390x.tar.gz
+sha256  e61f87693169c0bbcc43363128f1e929b9dff0b7f448573f1bdd4e4a0b9687ba  go1.23.6.linux-386.tar.gz
+sha256  9379441ea310de000f33a4dc767bd966e72ab2826270e038e78b2c53c2e7802d  go1.23.6.linux-amd64.tar.gz
+sha256  561c780e8f4a8955d32bf72e46af0b5ee5e0debe1e4633df9a03781878219202  go1.23.6.linux-arm64.tar.gz
+sha256  27a4611010c16b8c4f37ade3aada55bd5781998f02f348b164302fd5eea4eb74  go1.23.6.linux-armv6l.tar.gz
+sha256  0f817201e83d78ddbfa27f5f78d9b72450b92cc21d5e045145efacd0d3244a99  go1.23.6.linux-ppc64le.tar.gz
+sha256  321e7ed0d5416f731479c52fa7610b52b8079a8061967bd48cec6d66f671a60e  go1.23.6.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index 4c8ae3ca5e..b60995fedc 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  a6f3f4bbd3e6bdd626f79b668f212fbb5649daf75084fb79b678a0ae4d97423b  go1.23.5.src.tar.gz
+sha256  039c5b04e65279daceee8a6f71e70bd05cf5b801782b6f77c6e19e2ed0511222  go1.23.6.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 3d1b42ee0e..fd47ed7c3b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.5
+GO_VERSION = 1.23.6
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB49ECA0FE4
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B60E61B9D;
	Thu, 21 Aug 2025 19:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2ehExZwgT1j; Thu, 21 Aug 2025 19:21:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C17E61BA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C17E61BA4;
	Thu, 21 Aug 2025 19:21:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E5F51C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C988B84274
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CIV7ZdM5Vpyk for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A540E844B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A540E844B0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 967468141F; Thu, 21 Aug 2025 19:20:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 16:33:58 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 1ac1c4c535ab0e55d3b15059c4b037dceef62606
X-Git-Newrev: d024040c83846fcccde93218545d97458e8665f1
X-Patchwork-Hint: ignore
Message-Id: <20250821192018.967468141F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/go: security bump
 to version 1.23.12
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d024040c83846fcccde93218545d97458e8665f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

go1.23.11 (released 2025-07-08) includes security fixes to the go command,
as well as bug fixes to the compiler, the linker, and the runtime.
See:
- https://go.dev/doc/devel/release#go1.23.11
- https://github.com/golang/go/issues?q=milestone%3AGo1.23.11+label%3ACherryPickApproved
The 1.23.11 version fixes:
- https://www.cve.org/CVERecord?id=CVE-2025-4674

go1.23.12 (released 2025-08-06) includes security fixes to the database/sql
and os/exec packages, as well as bug fixes to the runtime.
See:
- https://go.dev/doc/devel/release#go1.23.12
- https://github.com/golang/go/issues?q=milestone%3AGo1.23.12+label%3ACherryPickApproved
The 1.23.12 version fixes:
- https://www.cve.org/CVERecord?id=CVE-2025-47907

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: add links to release notes, fixed issues and CVEs]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 84276c0449b3c902ec73247bf74a1104e4c4b1fa)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 62e0772e2e..dc88e9beab 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  800a7ae1bff179a227b653a2f644517c800443b8b4abf3273af5e1cb7113de59  go1.23.10.src.tar.gz
-sha256  ded3c0a8d6d2a0ea5e7599c49678efa05cda139d31baaaf7d8d536a9e4cc19b2  go1.23.10.linux-386.tar.gz
-sha256  535f9f81802499f2a7dbfa70abb8fda3793725fcc29460f719815f6e10b5fd60  go1.23.10.linux-amd64.tar.gz
-sha256  bfb1f1df7173f44648ee070a39ab0481068632f595305a699d89cd56a33b8081  go1.23.10.linux-arm64.tar.gz
-sha256  b6e00c9a72406d394b9f167e74670e28b72ed559cca8115b21be1cb9d5316cb4  go1.23.10.linux-armv6l.tar.gz
-sha256  8fb94455cfa5e9a5e8af2bfbc7323a6fed2dabaffda1a69dae5dd41b669bbb57  go1.23.10.linux-ppc64le.tar.gz
-sha256  7d0e8651eb54fce5cfe2d4b412ddfa50144ce21907f72192a6549ffe03db4e1f  go1.23.10.linux-s390x.tar.gz
+sha256  e1cce9379a24e895714a412c7ddd157d2614d9edbe83a84449b6e1840b4f1226  go1.23.12.src.tar.gz
+sha256  3b2fd446e26642555d1446a38ccbefb2a30bba3179d3ef132ed64d3c63b0c42a  go1.23.12.linux-386.tar.gz
+sha256  d3847fef834e9db11bf64e3fb34db9c04db14e068eeb064f49af747010454f90  go1.23.12.linux-amd64.tar.gz
+sha256  52ce172f96e21da53b1ae9079808560d49b02ac86cecfa457217597f9bc28ab3  go1.23.12.linux-arm64.tar.gz
+sha256  9704eba01401a3793f54fac162164b9c5d8cc6f3cab5cee72684bb72294d9f41  go1.23.12.linux-armv6l.tar.gz
+sha256  1a7cc5f7baeaf39125dce5d660a39438e7f0e04d13d3498590d240aae976b565  go1.23.12.linux-ppc64le.tar.gz
+sha256  2f43708aa0922d692da0a1fc775475c343907610bec77002de1bbe37601ea338  go1.23.12.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 744bb0d3ba..69ca746783 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.10
+GO_VERSION = 1.23.12
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

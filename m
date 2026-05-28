Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B4BCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 443174096E;
	Fri, 29 May 2026 08:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNUt9YZyKPBB; Fri, 29 May 2026 08:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A941A40A0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043165;
	bh=qFQCRsEEVnsAfGw2NDO/TGVNN/tbLqcxod+Ta+LOK0k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mWVyqZNiNWy2HmmMjPhPmI+s21+oPdhnXSgAHoTPIK6Nk/LLbAwlsFwTo3pOrYrKZ
	 6nQvMjFYZ5f8empJyvpJjh9XGbUZRIFhPtLZOFy0oUodQxbIUVf/oMh9sA1/w8hskU
	 e6i2GgV6nf4r5LSIlb5lkUJam/A24V46b72uRII1rj3GKR5actj5XJFNBxO49aXAcq
	 fkkbcedEMB7lwglBQgzfRQ+t2hJWWA970uLk4zlvWBH0tclZMFduCvJZNBOBgpEOEx
	 A9ODcccL6gsY0wlbpECylYb+Z1YVwbFi8vRtekOJJztmWccc778su6G6yoJe6PhLTQ
	 Mb+LVQNM1ZPHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A941A40A0A;
	Fri, 29 May 2026 08:26:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 033C528E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AE5141F5E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKiPD6yZ06Ij for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B36841F8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B36841F8D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E6A387334; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 14:35:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8859ce5ab89408c17d4821c93d3a616807484858
X-Git-Newrev: 0e2507d71095baa921902d17404a4361972eced3
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.9E6A387334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/go: security bump
 to version 1.25.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e2507d71095baa921902d17404a4361972eced3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For relase notes, see:
https://go.dev/doc/devel/release#go1.25.0

go1.25.2 (released 2025-10-07) includes security fixes to the archive/tar,
crypto/tls, crypto/x509, encoding/asn1, encoding/pem, net/http, net/mail,
net/textproto, and net/url packages, as well as bug fixes to the compiler,
the runtime, and the context, debug/pe, net/http, os, and sync/atomic
packages. See release announce:
https://groups.google.com/g/golang-announce/c/4Emdl2iQ_bI

go1.25.3 (released 2025-10-13) includes fixes to the crypto/x509 package.
See release announce:
https://groups.google.com/g/golang-announce/c/YEyj6FUNbik

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: add links to release notes and announces]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c55714aeb9e9bb32b0674b93c4a4cd4b6fa4eb52)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 60d61433fc..1dc1b99756 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  d010c109cee94d80efe681eab46bdea491ac906bf46583c32e9f0dbb0bd1a594  go1.25.1.src.tar.gz
-sha256  d03cdcbc9bd8baf5cf028de390478e9e2b3e4d0afe5a6582dedc19bfe6a263b2  go1.25.1.linux-386.tar.gz
-sha256  7716a0d940a0f6ae8e1f3b3f4f36299dc53e31b16840dbd171254312c41ca12e  go1.25.1.linux-amd64.tar.gz
-sha256  65a3e34fb2126f55b34e1edfc709121660e1be2dee6bdf405fc399a63a95a87d  go1.25.1.linux-arm64.tar.gz
-sha256  eb949be683e82a99e9861dafd7057e31ea40b161eae6c4cd18fdc0e8c4ae6225  go1.25.1.linux-armv6l.tar.gz
-sha256  8b0c8d3ee5b1b5c28b6bd63dc4438792012e01d03b4bf7a61d985c87edab7d1f  go1.25.1.linux-ppc64le.tar.gz
-sha256  9cfe517ba423f59f3738ca5c3d907c103253cffbbcc2987142f79c5de8c1bf93  go1.25.1.linux-s390x.tar.gz
+sha256  a81a4ba593d0015e10c51e267de3ff07c7ac914dfca037d9517d029517097795  go1.25.3.src.tar.gz
+sha256  acb585c13e7acb10e3b53743c39a7996640c745dffd7d828758786bde92f44ca  go1.25.3.linux-386.tar.gz
+sha256  0335f314b6e7bfe08c3d0cfaa7c19db961b7b99fb20be62b0a826c992ad14e0f  go1.25.3.linux-amd64.tar.gz
+sha256  1d42ebc84999b5e2069f5e31b67d6fc5d67308adad3e178d5a2ee2c9ff2001f5  go1.25.3.linux-arm64.tar.gz
+sha256  3992bd28316484be0af36494124588581aa27e0659a436d607b11d534045bc1f  go1.25.3.linux-armv6l.tar.gz
+sha256  68d1a08bf3567f330717d821b266a0be1c5080bd05dc238b5a43a24ca0c47d7c  go1.25.3.linux-ppc64le.tar.gz
+sha256  a0b5ccd631743f01230030412fdc9252b18d96b4e63d44ba1c4e9469e79cfcb1  go1.25.3.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 535787c92a..85a40d4d36 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.25.1
+GO_VERSION = 1.25.3
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

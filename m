Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCA6CA0EC0
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2318A6062C;
	Thu,  7 Aug 2025 17:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdrHO9LgrxTY; Thu,  7 Aug 2025 17:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4195F60674
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4195F60674;
	Thu,  7 Aug 2025 17:20:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62DED4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D18340070
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M53f2yPsrCRt for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C17524009D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C17524009D
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFD2886FE1; Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:09:05 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 915ee9cd4f84ca14d2f0c1071d4699d9b0430e7d
X-Git-Newrev: e9b8986841db39cd3aa4a65d21d0db6d109e8d7c
X-Patchwork-Hint: ignore
Message-Id: <20250807171915.BFD2886FE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/rust-bindgen:
 security bump version to 0.72.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e9b8986841db39cd3aa4a65d21d0db6d109e8d7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Changelog, since version 0.65.1:
https://github.com/rust-lang/rust-bindgen/blob/v0.72.0/CHANGELOG.md#0720-2025-06-08

The package updated some of its dependencies to fix
security issues:

Version 0.70.0 updates "tempfile" and "rustix" to fix:
https://github.com/advisories/GHSA-c827-hfw6-qwvm
https://www.cve.org/CVERecord?id=CVE-2024-43806

Version 0.69.3 updates shlex to fix:
https://rustsec.org/advisories/RUSTSEC-2024-0006.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien:
 - use version tag for change log url
 - mark the update as security related
 - add link to fixed rustix CVE
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1a229c54b87697b5b56aeb1395d57bdcba6de58d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rust-bindgen/rust-bindgen.hash | 2 +-
 package/rust-bindgen/rust-bindgen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index 0718bdc696..dc79a62ddd 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  20d32e8e182ef49694a65a4a18d624cac7caa30b03422212d503a7edc0d04f6a  rust-bindgen-0.65.1-cargo4.tar.gz
+sha256  f131b9cf87ea0a5db33ff3ad711aec4dbc4d383536f5f2e37493d63cbe95428e  rust-bindgen-0.72.0-cargo4.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
index aa0d7d44a4..349d4c3670 100644
--- a/package/rust-bindgen/rust-bindgen.mk
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BINDGEN_VERSION = 0.65.1
+RUST_BINDGEN_VERSION = 0.72.0
 RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION))
 RUST_BINDGEN_LICENSE = BSD-3-clause
 RUST_BINDGEN_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

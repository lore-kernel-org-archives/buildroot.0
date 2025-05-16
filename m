Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34367C54756
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C31061062;
	Mon, 19 May 2025 10:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwbnPhkX2c39; Mon, 19 May 2025 10:48:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 454C460FEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 454C460FEE;
	Mon, 19 May 2025 10:48:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19E0F193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E3B341923
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f09GasHnXVkX for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D24341910
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D24341910
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B419873D4; Mon, 19 May 2025 10:40:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 18:46:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e9498b4faa28c494c064728d564b43c07b1b0689
X-Git-Newrev: 432aef053e6471ec8570b31aecbd8377bb666053
X-Patchwork-Hint: ignore
Message-Id: <20250519104005.8B419873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{rust,
 rust-bin}: fix license
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

commit: https://git.buildroot.net/buildroot/commit/?id=432aef053e6471ec8570b31aecbd8377bb666053
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The bump of rust and rust-bin from 1.82 to 1.86 in commit
072f3bc8c61bd68ed75eb4419f938f718c79ac3f forgot to update the hash of
the license files. The LICENSE-MIT file has changed with the following
diff:

+Copyright (c) The Rust Project Contributors
+

So no change to the license terms.

Fixes:

  https://autobuild.buildroot.net/results/382489b3f5c931451bead7e232af07b70c3e29bb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.hash | 2 +-
 package/rust/rust.hash         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index d5a3c02071..ca7a4fe894 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -67,4 +67,4 @@ sha256  67be7184ea388d8ce0feaf7fdea46f1775cfc2970930264343b3089898501d37  rust-s
 sha256  8313c108da105181d27a5a0190ab46d1ac5b3e32bb5b2e7e0a41b7b5d353cba6  rust-std-1.86.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
-sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
+sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index bfccc2502a..314d1aff5e 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -5,4 +5,4 @@
 sha256  d939eada065dc827a9d4dbb55bd48533ad14c16e7f0a42e70147029c82a7707b  rustc-1.86.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
-sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
+sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

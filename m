Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94464EEF319
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68B7660B33;
	Thu,  5 Mar 2026 08:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muWyInIqhCmr; Thu,  5 Mar 2026 08:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E7A560B48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697754;
	bh=C2w2mkp5CmKTp0iWl5o7GZUXjPGBMqNO0NgGqFT4kQ4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GukngiUb4bOOc2W/791QwQ/K36wydh6HDYQX0AP7FF72Kyb2KNTMF5c5RGunsI204
	 SWAhVBJ4plOsf3AnAEmO46wq0ToY5VgKJBoic8IFakuo+9HwvYmY/EAu+OZRcfr1oG
	 6/kFBM49gk2JkQ04sQsAXHk05Gs4DDohnqDFpLY/6ow4rv8G/ZVotifVJTuCr6HM4n
	 SfU8M4V65zflZq+iuiEuqQla2DPcodVCGVTPcJVxhmkO+E4I1tQrYzczFsQKT9z7im
	 hFHEcsfMEr5DvR882rj726G0QgKCakS64qY0EPA/bSEH2QErDnILIB+ZcIe0nYbbbX
	 /yllDpzYY9qBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E7A560B48;
	Thu,  5 Mar 2026 08:02:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 033D325B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6590605F0
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24SMuZhCmHlu for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03A9E6075E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03A9E6075E
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10CCE828F8; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Mar 2026 18:16:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7928fef42fc190d51864c4b14df618751325167
X-Git-Newrev: 20db09684bb848582d690b3c7ddb2c20d8284245
X-Patchwork-Hint: ignore
Message-Id: <20260305080209.10CCE828F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust-bindgen: bump version to
 0.72.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20db09684bb848582d690b3c7ddb2c20d8284245
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/rust-lang/rust-bindgen/releases/tag/v0.72.1

We need to add "refs/tags/" to RUST_BINDGEN_SITE because the github
repo contains a tag and a branch with the same name:

$ wget -q https://github.com/rust-lang/rust-bindgen/archive/v0.72.1/rust-bindgen-0.72.1-cargo4.tar.gz -O -
the given path has multiple possibilities: #<Git::Ref:0x00007d64db1eed90>, #<Git::Ref:0x00007d64db1e7c70>

Fixes a build error with mesa3d 26.x and the upcoming llvm 22 bump:
https://github.com/rust-lang/rust-bindgen/issues/3264#issuecomment-3218111176

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Co-authored-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rust-bindgen/rust-bindgen.hash | 2 +-
 package/rust-bindgen/rust-bindgen.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index dc79a62ddd..72ff0401ce 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f131b9cf87ea0a5db33ff3ad711aec4dbc4d383536f5f2e37493d63cbe95428e  rust-bindgen-0.72.0-cargo4.tar.gz
+sha256  9dd2f0f7bae7c84b1d79fb848d17335b8ebc37c27cd5ecb6e0da3ec0dba87d71  rust-bindgen-0.72.1-cargo4.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
index 8c02db557f..55f3b4d5b7 100644
--- a/package/rust-bindgen/rust-bindgen.mk
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RUST_BINDGEN_VERSION = 0.72.0
-RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION))
+RUST_BINDGEN_VERSION = 0.72.1
+RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,refs/tags/v$(RUST_BINDGEN_VERSION))
 RUST_BINDGEN_LICENSE = BSD-3-clause
 RUST_BINDGEN_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

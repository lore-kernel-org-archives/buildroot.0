Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD16EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15C9661508;
	Fri, 13 Feb 2026 19:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yFrfBD3BcKEV; Fri, 13 Feb 2026 19:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CFDE61487
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011378;
	bh=dw6IQM+JHQHz887gKoVk3HbFN4T6rqES/tnfYImOezY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dE8r9PIt7/I3IFpU+sTpjZsfLVYFWiVhEbzAU3mFtI+dT9sIMjOWgqmATzsNnDsl3
	 uOwzQxjpJ95CjHRHRmFhaR/4gowjr518ZT6NCwV8SOYjS0YaCBlbtJnCl+CmBLC8y3
	 cZMhkV+r/BH7FIseKY6FU0VDdzMLLgg2DV8ZjWBewQ4Rt+m3YFwamBKFsZ9N33Vnde
	 7BOP5ZeVMXFvagV7svogxpWDM4S9AUE6zYuVRjS17mh502x76Mq7qeDWGMAKhl9Ma9
	 nsaWVxYmd6KFZoIVa6FsSZKVkZjdyB0JlGub7tUTI2Zdfo0CrL9QjM4m8YevDbMtpj
	 7vhCXreFEYrDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CFDE61487;
	Fri, 13 Feb 2026 19:36:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01B0DEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C34741E41
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emsSXtGH-OJL for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B48741E3F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B48741E3F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F6A58268D; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:57:04 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d1f8f8c16dcb086ef665e340bd43444df1c3a5df
X-Git-Newrev: d550a8ec49c5a0f77d28b614de6e8ca599b8d747
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.1F6A58268D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/rust-bindgen: add
 runtime host-clang dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d550a8ec49c5a0f77d28b614de6e8ca599b8d747
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

According to the official requirements, bindgen needs libclang to
parse C/C++ headers. libclang is loaded at runtime by bindgen, which
is why we didn't notice any build issue. However, using bindgen on a
simple header file blows up:

thread 'main' panicked at bindgen/lib.rs:616:27:
Unable to find libclang: "couldn't find any valid shared libraries matching: ['libclang.so', 'libclang-*.so', 'libclang.so.*', 'libclang-*.so.*'], s
et the `LIBCLANG_PATH` environment variable to a path where one of these files can be found (invalid: [])"
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace

So far, bindgen was only used by mesa3d, and it turns out that mesa3d
also depends on clang, which pulls in host-clang, so the problem was
not visible. However, as we're about to use bindgen for other
things (namely Rust support in Linux), this issue needs to be fixed.

See:

  https://rust-lang.github.io/rust-bindgen/requirements.html

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 34ed3bbf0a5f2576043ff627c76df584ea936a71)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/rust-bindgen/rust-bindgen.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
index aa0d7d44a4..b22ad2cf72 100644
--- a/package/rust-bindgen/rust-bindgen.mk
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -9,6 +9,11 @@ RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION
 RUST_BINDGEN_LICENSE = BSD-3-clause
 RUST_BINDGEN_LICENSE_FILES = LICENSE
 
+# This is actually a runtime dependency (bindgen loads libclang at
+# runtime), but as it's a host package, we have no other option but to
+# handle it as a build dependency.
+HOST_RUST_BINDGEN_DEPENDENCIES = host-clang
+
 # The Cargo.toml at the root directory is a "virtual manifest".
 # Since we only want to build and install bindgen use the Cargo.toml
 # from the bindgen-cli subdirectory.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

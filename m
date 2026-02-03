Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE69E6E80F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 11:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EC7F82060;
	Tue,  3 Feb 2026 11:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbLY3pqFf2pn; Tue,  3 Feb 2026 11:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A65D81B8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770117362;
	bh=ag5JjV1EO/3PjOWejB7hf1raOV5TJMdu8uuWsMgso8E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kkTref+n1Ia6yj8/q/7z3XvsPaxodoYrwRj3BiXDAp5GO1/13uH4F+E9eF62hdMM5
	 tt2CD/UF0HLyNg/b1j8bwLwNPl9czu/A4KVWuXsyAbU7ui9FCYZcjzPGeOm5FsLLpH
	 TrBvOO7p0w15I6VTvXJU8w5oazJ9cFXHho4rVAaPLjQiHjCTHeuip+OGogepALKYYV
	 f7mBUFS9kLasHnIw1iF4Zp1C0Fg//Qrmm8R6NCDMsYfCx/4jlY0Gve3uRb9OVsRuUM
	 OwRmg+SIxzpg7VH1QUBIoyYJKpsoskQ9bfplO1Vkvwp8jxU7C9bdUmgaVomknMqjzE
	 hpZeo3kJmYSMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A65D81B8A;
	Tue,  3 Feb 2026 11:16:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBE5FF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE58160DEE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ppUsV8v3rFGa for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 11:15:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB82C60C26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB82C60C26
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 11:15:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D429A84E62; Tue,  3 Feb 2026 11:15:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 12:10:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f218b1c291e07e30f9a43991cc57c4137606660
X-Git-Newrev: 34ed3bbf0a5f2576043ff627c76df584ea936a71
X-Patchwork-Hint: ignore
Message-Id: <20260203111558.D429A84E62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust-bindgen: add runtime
 host-clang dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=34ed3bbf0a5f2576043ff627c76df584ea936a71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/rust-bindgen/rust-bindgen.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
index 349d4c3670..8c02db557f 100644
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCD4EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70EC742252;
	Fri, 13 Feb 2026 19:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FATdsFPsHBu1; Fri, 13 Feb 2026 19:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E4AE4225A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011603;
	bh=0WB7e3VUOwqu0IQdZwqrpXtyj/dDX/TwLojKyuf/p2U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fjm8OVGc4s4QurZBO4XvkEd57h/Dn8FU1WLDHm4dwz2JcsIp11Rd22P7dk/i0Z5i+
	 z5Ly4gB3qtt22gYr71GdcJ3aUVtearJjTkS1dx9pyuAV0G1d9r0HdFj4n5nbDBYRfd
	 QLfUjTsnMPcoFQiqyg5/hzhXCfhcu9HZnXyuoDmr3zqEwZkA2kqRvEHj0NIGMopfi1
	 eYIdljl6aHrDsNFVVxFTXOvBo8z7OnwY5yE4jA6GXcrCSukXGQGQM86Ye+uWzheaEf
	 1LwaPPq4QntlCLPIcaVI3wvhJvWSuEMZtCJFljECVcicwSgU2FO6CpFTiswkaN1YK6
	 fCixDsUCpxp0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E4AE4225A;
	Fri, 13 Feb 2026 19:40:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3118F69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49179412E7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dw-caPcTV532 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54803403B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54803403B1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 499D485DA7; Fri, 13 Feb 2026 19:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:57:07 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 12976351870b20379930510c81128d2760b9e8e4
X-Git-Newrev: 48c6ff60b2bd8286caeb5125ceb47937e936c03c
X-Patchwork-Hint: ignore
Message-Id: <20260213193703.499D485DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/rust-bindgen: add
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48c6ff60b2bd8286caeb5125ceb47937e936c03c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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

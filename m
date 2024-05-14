Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D850C25B75
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 15:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1A6680E50;
	Tue, 14 May 2024 15:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMQMV25LnERj; Tue, 14 May 2024 15:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85FCA80E67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85FCA80E67;
	Tue, 14 May 2024 15:33:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E5AB1BF4DB
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 15:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87B9A4052F
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 15:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AV7X6hTmCE4I for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 15:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64027404B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64027404B1
 for <buildroot@buildroot.org>; Tue, 14 May 2024 15:33:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C493873AE; Tue, 14 May 2024 15:33:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 17:33:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 052deababf60838a19f6334bae1746c841eba877
X-Git-Newrev: 1dace793ba11fc45c6ae7842a84daa4612ad4279
X-Patchwork-Hint: ignore
Message-Id: <20240514153349.4C493873AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: fix filename/hashes of
 Cargo-fetched packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=1dace793ba11fc45c6ae7842a84daa4612ad4279
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit de5ed8021269e18070b92def5df10f9157bc2085 ("{boot, package}:
update hashes for generated archives") forgot to update the filename
and hashes of Cargo-fetched packages.

This commit therefore updates the incorrect filenames and hashes. It
allows to run:

make bat-legal-info \
     dust-legal-info \
     eza-legal-info \
     hyperfine-legal-info \
     nushell-legal-info \
     procs-legal-info \
     ripgrep-legal-info \
     host-rust-bindgen-legal-info \
     host-sentry-cli-legal-info \
     tealdeer-legal-info

successfully.

Also fixes:

  http://autobuild.buildroot.net/results/1ff5ccf5ee6029669af1413c95827f670ae212b3/ (dust)
  http://autobuild.buildroot.net/results/f887adebe611f0021d5ee85acb95cced7c8b71c0/ (sentry-cli)
  http://autobuild.buildroot.net/results/b95093c618eafeb3726513a3ef6199488406093d/ (bat)
  (and probably some other similar issues)

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bat/bat.hash                   | 2 +-
 package/dust/dust.hash                 | 2 +-
 package/eza/eza.hash                   | 2 +-
 package/hyperfine/hyperfine.hash       | 2 +-
 package/nushell/nushell.hash           | 2 +-
 package/procs/procs.hash               | 2 +-
 package/ripgrep/ripgrep.hash           | 2 +-
 package/rust-bindgen/rust-bindgen.hash | 2 +-
 package/sentry-cli/sentry-cli.hash     | 2 +-
 package/tealdeer/tealdeer.hash         | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index 775838d921..e80301ff49 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  6a32062aeb76b8d7d4cffbb5b267818ee1f35149af0c35fdb8999cea63e65854  bat-0.24.0-cargo1.tar.gz
+sha256  45fcdd6076dc1b45698a7b6c0f4d1f5d9ae676f3ca3b155402ad24680d5b4df6  bat-0.24.0-cargo2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/dust/dust.hash b/package/dust/dust.hash
index 0b2f123080..975ec9664d 100644
--- a/package/dust/dust.hash
+++ b/package/dust/dust.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fffe56f60bb596213edcd054f45e3b611c4b9b7861ff4a1bb9e0721012474032  dust-0.9.0-cargo1.tar.gz
+sha256  ace29e85647e7079f9eaa066da9b1368c7200233eb0814442499948b5adeb028  dust-0.9.0-cargo2.tar.gz
 sha256  aee6e2d13d3a55c7881630c09b41ca7b3b44bb1437b5d36695d22decc3655160  LICENSE
diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index ddc23f50e2..8765261e7e 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  925347e190028308e8105d5c6aef395fd73cd3ceec2df2bf35b285101e75bf3b  eza-0.18.8-cargo1.tar.gz
+sha256  709507bd46c1e1c4c14d6e34266355d78ae21fe2525f8bf42089cab36ebf0134  eza-0.18.8-cargo2.tar.gz
 sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 6806bda9c8..88b8710125 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  e4a945fcd08e93fed47e542383942874960a893a94a60758b7bd208821c623f5  hyperfine-1.18.0-cargo1.tar.gz
+sha256  6cbe5673729ba7fd7a1b0b19a54630f93f4fcc29ea7878845f17931d31cd16fb  hyperfine-1.18.0-cargo2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/nushell/nushell.hash b/package/nushell/nushell.hash
index 2fe48557da..c125a6c652 100644
--- a/package/nushell/nushell.hash
+++ b/package/nushell/nushell.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  9518d79a04b374c23d4523252080b176e835050b3c6ef8243ee54411a8f8cba4  nushell-0.85.0-cargo1.tar.gz
+sha256  9175b7e25a93a35c4f2690a63e7c36ac2dc31a9d762f59de01aac8ac1075b02f  nushell-0.85.0-cargo2.tar.gz
 sha256  2dc1f03f729c21902d869b4d8f8dc528fc730f4c6ad83fc128672bda0ad69196  LICENSE
diff --git a/package/procs/procs.hash b/package/procs/procs.hash
index e4e3764976..da6b4377e2 100644
--- a/package/procs/procs.hash
+++ b/package/procs/procs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fe93b0ace885e1342870b49b2ee64f0862fd799395740e5c549f2fd67d14d944  procs-0.14.5-cargo1.tar.gz
+sha256  86715967bd378a4c0330708e11714bda2c8ce9f757fb3006073238d77e83e6e1  procs-0.14.5-cargo2.tar.gz
 sha256  feb87a2e0c305de3464cc44077da5393c52d8ca6362d37427157d04ec6f4510d  LICENSE
diff --git a/package/ripgrep/ripgrep.hash b/package/ripgrep/ripgrep.hash
index c1241106b7..39165770dc 100644
--- a/package/ripgrep/ripgrep.hash
+++ b/package/ripgrep/ripgrep.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3165367d5d613294f4c47dbb28ac59cda5465529e85bbc7243355e04be376de  ripgrep-14.1.0-cargo1.tar.gz
+sha256  7e1e66e2e9a7290a0a9445a82886a678ee8b2583b296fb851e1472c7403a681a  ripgrep-14.1.0-cargo2.tar.gz
 sha256  0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f  LICENSE-MIT
diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index 17e6d82337..7b222e577f 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  23951b867ea4e24d49e3f74855300e1050ccacb86bca86005ce3307bfc761342  rust-bindgen-0.65.1-cargo1.tar.gz
+sha256  618a92ac5e0e855a4e5cb16fb71258c4859679f3f7d7d95c7150e8b09cbbfbde  rust-bindgen-0.65.1-cargo2.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index ff2684d110..0335c57cb3 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  b31e66d4d0e65d9903c50c69565638f16db06420248d65d3d7bd955dc68d829c  sentry-cli-2.20.3-cargo1.tar.gz
+sha256  997581bca5bdb6f7540ea9d6e1d25f0e9df06fcc338d26ed75fc81f9401d65d4  sentry-cli-2.20.3-cargo2.tar.gz
 sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
index 94049567be..f5493ec8eb 100644
--- a/package/tealdeer/tealdeer.hash
+++ b/package/tealdeer/tealdeer.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  cf4999339cda32314ca42f4553440baa07fdf698e0a6ec254cbc25297f1e603a  tealdeer-1.6.1-cargo1.tar.gz
+sha256  f0be09eed89d25e44f954e9c25476176d9e4acc15171ae93b5977d7f244851ba  tealdeer-1.6.1-cargo2.tar.gz
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

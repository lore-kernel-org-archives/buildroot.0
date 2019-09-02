From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:17:34 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/dehydrated:
 critical bump to 0.6.5
Message-ID: <20190902161338.783948A2E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=313bf4b05a395b08b059d9f4198a628feafe82ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

On July 3, 2019, Let's Encrypt deployed new ACME server software that no
longer returns the 'id' field in the account information JSON.
Dehydrated relied on this field, even though it is not specified by RFC
8555. Because of this, dehydrated can no longer create a new account on
Let's Encrypt.

This was fixed by upstream commits be13dcd and 4f358e2. But the latter
broke ACMEv1 support so was fixed again in commit f60f2f8.

Cherry-picking this correctly is tricky, so instead just bump the
version. There are quite a few non-bugfix changes that are included this
way, but it's more risky to try to cherry-pick.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 539f86571f01b3bc197bd49bbf3184497ae5e31a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dehydrated/dehydrated.hash | 4 ++--
 package/dehydrated/dehydrated.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dehydrated/dehydrated.hash b/package/dehydrated/dehydrated.hash
index 1d194e5a7d..388dd24749 100644
--- a/package/dehydrated/dehydrated.hash
+++ b/package/dehydrated/dehydrated.hash
@@ -1,6 +1,6 @@
 # Locally computed after verifying
-# https://github.com/lukas2511/dehydrated/releases/download/v0.6.2/dehydrated-0.6.2.tar.gz.asc
+# https://github.com/lukas2511/dehydrated/releases/download/v0.6.5/dehydrated-0.6.5.tar.gz.asc
 # with key 3C2F2605E078A1E18F4793909C4DBE6CF438F333 from https://keybase.io/lukas2511
-sha256  163384479199f06f59382ceb6291a299567a2f4f0b963b9b61f2db65a407e80e  dehydrated-0.6.2.tar.gz
+sha256  10aabd0027450bc70a18e49acaca7a9697e0cfb92368d3e508b7a4d6d69bfa35 dehydrated-0.6.5.tar.gz
 # License, locally computed
 sha256  b4583b7dd07e3e2a08906de38e7e329d41f921ed9dcb6310b3886e013a6b8723  LICENSE
diff --git a/package/dehydrated/dehydrated.mk b/package/dehydrated/dehydrated.mk
index b7de27a407..17c67b8478 100644
--- a/package/dehydrated/dehydrated.mk
+++ b/package/dehydrated/dehydrated.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DEHYDRATED_VERSION = 0.6.2
+DEHYDRATED_VERSION = 0.6.5
 DEHYDRATED_SITE = https://github.com/lukas2511/dehydrated/releases/download/v$(DEHYDRATED_VERSION)
 
 DEHYDRATED_LICENSE = MIT

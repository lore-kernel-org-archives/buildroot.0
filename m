From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 13:28:14 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/tor: security
 bump to version 0.4.3.7
Message-ID: <20201116121419.03A9E7F893@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c57a3463cdbde554cd109036667a5756b7684eaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes the following security issue:

- TROVE-2020-005: When completing a channel, relays now check more
  thoroughly to make sure that it matches any pending circuits before
  attaching those circuits.  Previously, address correctness and Ed25519
  identities were not checked in this case, but only when extending circuits
  on an existing channel

For more details, see the release notes:
https://blog.torproject.org/node/1952

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 47c2dd49b4..1f564c113a 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6a2d0637d4e514be2ec574723a05065245cce51da78a21cec1dc831be5ccac62  tor-0.4.3.6.tar.gz
+sha256  b20f0b55a7058a952b167fcd2ed75b1a380ade95efce9a509f570c4636c2117a  tor-0.4.3.7.tar.gz
 sha256  ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 050114ccac..23320b895e 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.3.6
+TOR_VERSION = 0.4.3.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE

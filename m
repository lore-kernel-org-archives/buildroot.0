From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 08:11:21 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/tor: security
 bump to version 4.1.9
Message-ID: <20200328070930.256B288650@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72d579b115bb713c01c6d428431cdc602d9b20a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes the following security issues:

    - Fix a denial-of-service bug that could be used by anyone to
      consume a bunch of CPU on any Tor relay or authority, or by
      directories to consume a bunch of CPU on clients or hidden
      services. Because of the potential for CPU consumption to
      introduce observable timing patterns, we are treating this as a
      high-severity security issue. Fixes bug 33119; bugfix on
      0.2.1.5-alpha. Found by OSS-Fuzz. We are also tracking this issue
      as TROVE-2020-002 and CVE-2020-10592.

    - Avoid a remotely triggered memory leak in the case that a circuit
      padding machine is somehow negotiated twice on the same circuit.
      Fixes bug 33619; bugfix on 0.4.0.1-alpha. Found by Tobias Pulls.
      This is also tracked as TROVE-2020-004 and CVE-2020-10593.

For more details, see the changelog:
https://gitweb.torproject.org/tor.git/tree/ChangeLog?h=tor-0.4.1.9

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 13448de7c6..8594e3fe13 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 2a88524ce426079fb9b828bc1b789f2c8ade3ed53c130851102debc3518bed71  tor-0.4.1.6.tar.gz
+sha256 a763c24362c6220ead345fa232d5b343fce5e1ac0a49549d0a3a2253d60fd28a  tor-0.4.1.9.tar.gz
 sha256 b4248f32f009d4f5cccb704b351e31a16590e0dd5fda2856382cc854d81f6234  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 264d8d06da..c84037e9cb 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.1.6
+TOR_VERSION = 0.4.1.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE

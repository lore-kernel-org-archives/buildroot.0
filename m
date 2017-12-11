From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 10:17:22 +0100
Subject: [Buildroot] [PATCH-2017.02.x] tor: security bump to version 0.2.9.14
Message-ID: <20171211091722.13814-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following securoty issues:

- CVE-2017-8819: In Tor before 0.2.5.16, 0.2.6 through 0.2.8 before
  0.2.8.17, 0.2.9 before 0.2.9.14, 0.3.0 before 0.3.0.13, and 0.3.1 before
  0.3.1.9, the replay-cache protection mechanism is ineffective for v2 onion
  services, aka TROVE-2017-009.  An attacker can send many INTRODUCE2 cells
  to trigger this issue.

- CVE-2017-8820: In Tor before 0.2.5.16, 0.2.6 through 0.2.8 before
  0.2.8.17, 0.2.9 before 0.2.9.14, 0.3.0 before 0.3.0.13, and 0.3.1 before
  0.3.1.9, remote attackers can cause a denial of service (NULL pointer
  dereference and application crash) against directory authorities via a
  malformed descriptor, aka TROVE-2017-010.

- CVE-2017-8821: In Tor before 0.2.5.16, 0.2.6 through 0.2.8 before
  0.2.8.17, 0.2.9 before 0.2.9.14, 0.3.0 before 0.3.0.13, and 0.3.1 before
  0.3.1.9, an attacker can cause a denial of service (application hang) via
  crafted PEM input that signifies a public key requiring a password, which
  triggers an attempt by the OpenSSL library to ask the user for the
  password, aka TROVE-2017-011.

- CVE-2017-8822: In Tor before 0.2.5.16, 0.2.6 through 0.2.8 before
  0.2.8.17, 0.2.9 before 0.2.9.14, 0.3.0 before 0.3.0.13, and 0.3.1 before
  0.3.1.9, relays (that have incompletely downloaded descriptors) can pick
  themselves in a circuit path, leading to a degradation of anonymity, aka
  TROVE-2017-012.

- CVE-2017-8823: In Tor before 0.2.5.16, 0.2.6 through 0.2.8 before
  0.2.8.17, 0.2.9 before 0.2.9.14, 0.3.0 before 0.3.0.13, and 0.3.1 before
  0.3.1.9, there is a use-after-free in onion service v2 during intro-point
  expiration because the expiring list is mismanaged in certain error cases,
  aka TROVE-2017-013.

For more details, see the release notes:
https://lists.torproject.org/pipermail/tor-announce/2017-December/000147.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index ba0b47af15..8b5a3958a2 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 6e7466625d53812f23c2ad60a873c5855f63f756fde0fc5cbeda8d32cee1086b  tor-0.2.9.12.tar.gz
+sha256 44d9ddca1479f517b74067fe55e919d8d3643645618d5a1f6a5e033765781979  tor-0.2.9.14.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 4cc5c48351..f87b10f314 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.2.9.12
+TOR_VERSION = 0.2.9.14
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3c
 TOR_LICENSE_FILES = LICENSE
-- 
2.11.0

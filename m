From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 08:20:49 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/tor: security
 bump to version 3.5.10
Message-ID: <20200328070925.651B688597@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=346c4e6580b7e6dd603a3f84f7e84e737e78a0c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

    - Fix a denial-of-service bug that could be used by anyone to
      consume a bunch of CPU on any Tor relay or authority, or by
      directories to consume a bunch of CPU on clients or hidden
      services. Because of the potential for CPU consumption to
      introduce observable timing patterns, we are treating this as a
      high-severity security issue. Fixes bug 33119; bugfix on
      0.2.1.5-alpha. Found by OSS-Fuzz. We are also tracking this issue
      as TROVE-2020-002 and CVE-2020-10592.

    - Correct how we use libseccomp. Particularly, stop assuming that
      rules are applied in a particular order or that more rules are
      processed after the first match. Neither is the case! In
      libseccomp <2.4.0 this lead to some rules having no effect.
      libseccomp 2.4.0 changed how rules are generated, leading to a
      different ordering, which in turn led to a fatal crash during
      startup. Fixes bug 29819; bugfix on 0.2.5.1-alpha. Patch by
      Peter Gerber.

For more details, see the changelog:
https://gitweb.torproject.org/tor.git/tree/ChangeLog?h=tor-0.3.5.10

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 5b07981d95..51aaf38e18 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d5c56603942a8927670f50a4a469fb909e29d3571fdd013389d567e57abc0b47  tor-0.3.5.8.tar.gz
+sha256 0196be233826e19d1809f05ed01955ad5e8245d3267b9754410230222859f9c4  tor-0.3.5.10.tar.gz
 sha256 b4248f32f009d4f5cccb704b351e31a16590e0dd5fda2856382cc854d81f6234  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index fe951fb266..0462d1106f 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.5.8
+TOR_VERSION = 0.3.5.10
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE

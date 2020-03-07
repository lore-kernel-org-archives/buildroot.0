From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 08:14:44 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/samba4: security
 bump to version 4.9.18
Message-ID: <20200307070335.263808F3A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69c0db6f3a405c9db7a67be085bccdf26ddbf8ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues (4.10.12):

CVE-2019-14902: Replication of ACLs set to inherit down a subtree on AD
                Directory not automatic.
CVE-2019-14907: Crash after failed character conversion at log level 3
                or above.
CVE-2019-19344: Use after free during DNS zone scavenging in Samba AD
                DC.

For more details, see the release notes:
https://www.samba.org/samba/history/samba-4.9.18.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 27b5551ada..b27256696d 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.17.tar.asc
-sha256 42467af2efab4793c7988561644a84de4000e96a87ce8239362c6d10abace295  samba-4.9.17.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.18.tar.asc
+sha256 c6d23982b7233ce8bc0c87b8b03585d782ddf3bd7c634c1ffa853d7d397d87f7  samba-4.9.18.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index e15d0742e7..26e34af573 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.17
+SAMBA4_VERSION = 4.9.18
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES

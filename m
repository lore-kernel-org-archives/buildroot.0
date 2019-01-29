From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 22:46:37 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/samba4: security
 bump to version 4.8.8
Message-ID: <20190129214628.0A15382641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45a1b24ebd37869c8ee5e57b5b8e4f947141c4bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes the following security issues:

- CVE-2018-14629 dns: Fix CNAME loop prevention using counter regression
- CVE-2018-16853: Fix S4U2Self crash with MIT KDC build
- CVE-2018-16853: Do not segfault if client is not set

For more info, see the release notes:
https://www.samba.org/samba/history/samba-4.8.8.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 2ecea7fa5a..1671440569 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.8.7.tar.asc
-sha256 0f6f67932e8bb23ab83b43070037ac452f9fc5f20763857d2b67e209ee7cd362  samba-4.8.7.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.8.8.tar.asc
+sha256 3bc97ba7b827526b299e09a1c410f22d3a3c57bb46f1e67e8f93258945f8cf60  samba-4.8.8.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index ed860fbda2..a8585f4ffb 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.8.7
+SAMBA4_VERSION = 4.8.8
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES

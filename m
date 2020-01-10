From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 16:01:30 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/samba4: security
 bump to version 4.9.17
Message-ID: <20200110150921.BA5A488595@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49719ba18236e73722611e91b93826f2e2a5f56c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- CVE-2019-14861: Samba AD DC zone-named record Denial of Service in DNS
                  management server (dnsserver).
- CVE-2019-14870: DelegationNotAllowed not being enforced in protocol transition
                  on Samba AD DC.

https://www.samba.org/samba/history/samba-4.9.17.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index e0ea49a6f1..27b5551ada 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.15.tar.asc
-sha256 377102b80b97941bf0d131b828cae8415190e5bdd2928c2e2c954e29f1904496  samba-4.9.15.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.17.tar.asc
+sha256 42467af2efab4793c7988561644a84de4000e96a87ce8239362c6d10abace295  samba-4.9.17.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 3f30efac60..e15d0742e7 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.15
+SAMBA4_VERSION = 4.9.17
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES

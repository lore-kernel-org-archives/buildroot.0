From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 22:15:08 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/samba4: security
 bump to version 4.9.4
Message-ID: <20190129214632.7000E82641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e311bdffe158e9901e781b92fd387db3a8d46eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes the following security issues:

- CVE-2018-14629 dns: Fix CNAME loop prevention using counter regression
- CVE-2018-16853: Fix S4U2Self crash with MIT KDC build
- CVE-2018-16853: Do not segfault if client is not set

For more info, see the release notes:
https://www.samba.org/samba/history/samba-4.9.4.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: mention security impact, add CVE info]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 3cf46525b943b3844020f41d4271aee8b0083ec1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 41c670059f..de349c3049 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.9.3.tar.asc
-sha256 cf8fd8707e9ad7bce7832006aac5644155165745ba371170661b3004fa2135cf  samba-4.9.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.9.4.tar.asc
+sha256 6d98a8d8bcccbe788e4bbb406362e6676311aca711a3f3cc9b3a404bb9ff0b4f  samba-4.9.4.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 89e39dab55..9f771cf82f 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.9.3
+SAMBA4_VERSION = 4.9.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES

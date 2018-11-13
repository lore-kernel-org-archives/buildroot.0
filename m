From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:58:50 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] liburiparser: security
 bump to version 0.9.0
Message-ID: <20181113225614.F3F7F82BD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e0984cd5844fa991b79d124f080d50afc0bc901
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes an out-of-bounds write, detect an integer overflow and protect
against acting on NULL input. For additional datails, see

   https://github.com/uriparser/uriparser/blob/uriparser-0.9.0/ChangeLog

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2f3042a79b5091cd93ef383d9283c00c91de177e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburiparser/liburiparser.hash | 2 +-
 package/liburiparser/liburiparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
index 1fd65d2f19..f71dd5cc7b 100644
--- a/package/liburiparser/liburiparser.hash
+++ b/package/liburiparser/liburiparser.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0709a7e572417db763f0356250d91686c19a64ab48e9da9f5a1e8055dc2a4a54  uriparser-0.8.6.tar.bz2
+sha256  ec67eb34feda8eac166f281799f03ed48387694fca44f6f5852f61f8fb535e2c  uriparser-0.9.0.tar.bz2
 sha256  ee90029e62d11f48faa59360d15c3ad8e7c094c74cc25b055716d92340da561f  COPYING
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
index baed4506a4..62bc8d30d1 100644
--- a/package/liburiparser/liburiparser.mk
+++ b/package/liburiparser/liburiparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURIPARSER_VERSION = 0.8.6
+LIBURIPARSER_VERSION = 0.9.0
 LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.bz2
 LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
 LIBURIPARSER_LICENSE = BSD-3-Clause

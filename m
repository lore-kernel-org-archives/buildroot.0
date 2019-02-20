From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 20 Feb 2019 23:55:18 +0100
Subject: [Buildroot] [git commit] package/swupdate: update license files
Message-ID: <20190220225339.364448B869@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5f4b3621d46b4e8a9e1f6ab6e639dd98da560db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COPYING contains only the license for GPL-2.0 so use the new license
files that have been added in the Licenses directory since version
2018.03 and
https://github.com/sbabic/swupdate/commit/32c1f98eaca69e362be074197f84a59d994c0876

Also update GPL-2.0+ to "GPL-2.0+ with OpenSSL exception" and add
Exceptions file, see:
https://github.com/sbabic/swupdate/commit/66d0dbe80f49eb49f8999c9d738579651fc38134

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/swupdate/swupdate.hash | 5 ++++-
 package/swupdate/swupdate.mk   | 5 +++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 339f40e1bb..138bd6d305 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,3 +1,6 @@
 # Locally calculated
 sha256  a65884ca18523cde1b0744d952d6f91462dbd4ad07941305f5684c6d4ec833dc  swupdate-2018.11.tar.gz
-sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
+sha256  43492b377cf2fb67942d1dd231146bd4e6578646ad13ef289297c9dd75cbc478  Licenses/Exceptions
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  Licenses/mit.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index b7ef09c924..78f23ec239 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -6,8 +6,9 @@
 
 SWUPDATE_VERSION = 2018.11
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
-SWUPDATE_LICENSE = GPL-2.0+, LGPL-2.1+, MIT
-SWUPDATE_LICENSE_FILES = COPYING
+SWUPDATE_LICENSE = GPL-2.0+ with OpenSSL exception, LGPL-2.1+, MIT
+SWUPDATE_LICENSE_FILES = Licenses/Exceptions Licenses/gpl-2.0.txt \
+	Licenses/lgpl-2.1.txt Licenses/mit.txt
 
 # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
 # available in all external toolchains, and use CC for linking. Ensure

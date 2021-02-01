From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2021 19:21:00 +0100
Subject: [Buildroot] [git commit] package/pugixml: bump to version 1.11.4
Message-ID: <20210201180138.AEA6681078@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=451fed96f973655004f43a6ca5412b79a4471b0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use LICENSE.md which has been added in the release tarball since
  version 1.11 and
  https://github.com/zeux/pugixml/commit/ccb63a91865b59d3a4c1dde61fecf12ec085c089
- Fix a build failure with gerbera >= 1.5.0 when building pugixml in
  header-only mode

Fixes:
 - http://autobuild.buildroot.org/results/9c1919bacd23da0505a4eb828a806997a23b640f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pugixml/pugixml.hash | 4 ++--
 package/pugixml/pugixml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pugixml/pugixml.hash b/package/pugixml/pugixml.hash
index 79ae75e83b..5c629ac66f 100644
--- a/package/pugixml/pugixml.hash
+++ b/package/pugixml/pugixml.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  55f399fbb470942410d348584dc953bcaec926415d3462f471ef350f29b5870a  pugixml-1.10.tar.gz
-sha256  16582559c91ecf831d6289d472a903032e7d7994a86521c5c39513568d6ad208  readme.txt
+sha256  8ddf57b65fb860416979a3f0640c2ad45ddddbbafa82508ef0a0af3ce7061716  pugixml-1.11.4.tar.gz
+sha256  ee495f34aeff0c578a99f3350a2050d4e5860d27b2004c03c384a594fa2b0a7a  LICENSE.md
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 800a3836ce..5d7fc63017 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PUGIXML_VERSION = 1.10
+PUGIXML_VERSION = 1.11.4
 PUGIXML_SITE = http://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
-PUGIXML_LICENSE_FILES = readme.txt
+PUGIXML_LICENSE_FILES = LICENSE.md
 PUGIXML_INSTALL_STAGING = YES
 
 # Pugixml will automatically enable 'long long' support on C++11 compilers,

From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Mar 2021 13:44:16 +0100
Subject: [Buildroot] [git commit] package/libebml: security bump to version
 1.4.2
Message-ID: <20210303122741.11E1E844EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff18652b425c001ae06ce717790ebe2068735bc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-3405: A flaw was found in libebml before 1.4.2. A heap
overflow bug exists in the implementation of EbmlString::ReadData and
EbmlUnicodeString::ReadData in libebml.

https://github.com/Matroska-Org/libebml/blob/release-1.4.2/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libebml/libebml.hash | 2 +-
 package/libebml/libebml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libebml/libebml.hash b/package/libebml/libebml.hash
index f06924076e..32ca1e3dd3 100644
--- a/package/libebml/libebml.hash
+++ b/package/libebml/libebml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  80abc9a82549615018798ee704997270a39b43de9a6e7e0d23b62f8ce682c4b3  libebml-1.4.0.tar.xz
+sha256  41c7237ce05828fb220f62086018b080af4db4bb142f31bec0022c925889b9f2  libebml-1.4.2.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 7ae31d3e22..056cf888e1 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEBML_VERSION = 1.4.0
+LIBEBML_VERSION = 1.4.2
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.xz
 LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES

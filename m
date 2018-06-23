From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Jun 2018 23:04:43 +0200
Subject: [Buildroot] [git commit] mosh: fix build with protobuf 3.6.0
Message-ID: <20180623210259.C5F2181F67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4e4110d22332fd35d629259ccdfe9b934c9c633
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

protobuf now requires C++11

Fixes:
 - http://autobuild.buildroot.net/results/6e4550e080a9d558b441dcc735b6be14f39fb03f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosh/mosh.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index fa6ab17010..f9e335799d 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -10,6 +10,9 @@ MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
 MOSH_LICENSE_FILES = COPYING COPYING.iOS
 
+# protobuf needs c++11 (since 3.6.0)
+MOSH_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MOSH_CONF_OPTS += --with-crypto-library=openssl
 MOSH_DEPENDENCIES += openssl

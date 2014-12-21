From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 20:01:51 +0100
Subject: [Buildroot] [git commit] libtool: fix help2man related failure
Message-ID: <20141221190157.70E50805F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d39d6601d346f7f521247548b84463a30434649
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libtool sometimes requires help2man to build manpages, but since we
don't use/need them and want to avoid pulling in and/or building
dependencies for that we just disable it. Fixes:
http://autobuild.buildroot.net/results/bfb/bfb9e298196d877b623580f882b6fe74b30bec9b/

Also add host-m4 as dependency, it's not strictly required but silences
many build warnings.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtool/libtool.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index c392e25..92c6dce 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -8,6 +8,8 @@ LIBTOOL_VERSION = 2.4.4
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
+LIBTOOL_CONF_ENV = HELP2MAN=true
+LIBTOOL_DEPENDENCIES = host-m4
 LIBTOOL_LICENSE = GPLv2+
 LIBTOOL_LICENSE_FILES = COPYING
 

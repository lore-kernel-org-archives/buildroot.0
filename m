From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 12:43:41 +0200
Subject: [Buildroot] [git commit] package/libtool: disable makeinfo
Message-ID: <20150704120235.E1EA4803F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a42ba3eeba08e450762141be03156208f2b4de0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-libtool can fail to build if the host is missing makeinfo, so
disable it.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtool/libtool.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 28786d2..8688f8b 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -13,6 +13,7 @@ LIBTOOL_DEPENDENCIES = host-m4
 LIBTOOL_LICENSE = GPLv2+
 LIBTOOL_LICENSE_FILES = COPYING
 
+HOST_LIBTOOL_CONF_ENV = MAKEINFO=true
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
 # We have a patch that affects libtool.m4, which triggers an autoreconf

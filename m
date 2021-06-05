From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 14:57:38 +0200
Subject: [Buildroot] [git commit] package/odb: fix build with gcc 11
Message-ID: <20210605122737.9E28A872F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac9855e761443dee4f9d461b83e12443d37e8678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add -std=c++11 to fix the following build failure with gcc 11:

/data/buildroot-autobuilder/instance-0/output-1/host/include/cutl/shared-ptr/base.hxx:34:41: error: ISO C++17 does not allow dynamic exception specifications
   34 | operator new (std::size_t, cutl::share) throw (std::bad_alloc);
      |                                         ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/9cbb8be7a1d8ac5913fbc5e2a78c4c45b5daf8e2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/odb/odb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/odb/odb.mk b/package/odb/odb.mk
index 11086471e6..85c7ccb8bb 100644
--- a/package/odb/odb.mk
+++ b/package/odb/odb.mk
@@ -11,6 +11,7 @@ ODB_SITE = https://www.codesynthesis.com/download/odb/$(ODB_VERSION_MAJOR)
 ODB_LICENSE = GPL-3.0
 ODB_LICENSE_FILES = LICENSE
 HOST_ODB_DEPENDENCIES = host-libcutl
+HOST_ODB_CONF_ENV = CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
 
 # Prevent odb from trying to install the gcc plugin into the hosts
 # gcc plugin directory. Instead, this will install the gcc plugin

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 11:28:06 +0200
Subject: [Buildroot] [git commit] package/tar: ignore CVE-2007-4476
Message-ID: <20210424090313.05AAE8039D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9486774bbf583b2d04f0c714f852921a18cd9b13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://security-tracker.debian.org/tracker/CVE-2007-4476

Currently NVD has this incorrectly tagged for all versions.
The bug trackers on different distros show it was generally
fixed in versions >= 1.16 but because the impacted source
code is in the GNU paxutils, it is hard to follow in what
cases tar has been fixed around that 1.16 version.

https://bugs.gentoo.org/196978

https://www.itsecdb.com/oval/definition/oval/org.mitre.oval/def/9336/Buffer-overflow-in-the-safer-name-suffix-function-in-GNU-tar.html

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tar/tar.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 690a5952ba..80d7495b00 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -13,6 +13,8 @@ TAR_CONF_OPTS = --exec-prefix=/
 TAR_LICENSE = GPL-3.0+
 TAR_LICENSE_FILES = COPYING
 TAR_CPE_ID_VENDOR = gnu
+# only tar <= 1.16
+TAR_IGNORE_CVES += CVE-2007-4476
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 TAR_DEPENDENCIES += acl

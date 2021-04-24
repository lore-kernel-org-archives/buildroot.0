From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 11:28:04 +0200
Subject: [Buildroot] [git commit] package/ncurses: ignore CVE-2018-10754,
 CVE-2018-19211, CVE-2018-19217, CVE-2019-17594, CVE-2019-17595
Message-ID: <20210424090312.E143D8393E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=675769791bd43de18b6bbeec2b4b48772a541a7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4b21273d71d09 added upstream (security) patches up to 20200118
and in the commit description it outlines these CVEs were patched.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ncurses/ncurses.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 97e3e2c321..5d9c6bb0dd 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -11,6 +11,12 @@ NCURSES_DEPENDENCIES = host-ncurses
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = COPYING
 NCURSES_CPE_ID_VENDOR = gnu
+# Commit 4b21273d71d09 added upstream (security) patches up to 20200118
+NCURSES_IGNORE_CVES += CVE-2018-10754
+NCURSES_IGNORE_CVES += CVE-2018-19211
+NCURSES_IGNORE_CVES += CVE-2018-19217
+NCURSES_IGNORE_CVES += CVE-2019-17594
+NCURSES_IGNORE_CVES += CVE-2019-17595
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)6-config
 NCURSES_PATCH = \
 	$(addprefix https://invisible-mirror.net/archives/ncurses/$(NCURSES_VERSION)/, \

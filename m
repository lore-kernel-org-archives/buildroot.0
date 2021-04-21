From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 21 Apr 2021 15:42:33 -0500
Subject: [Buildroot] [PATCH 08/10] package/ncurses: ignore CVE-2018-10754,
 CVE-2018-19211, CVE-2018-19217, CVE-2019-17594, CVE-2019-17595
In-Reply-To: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
References: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210421204235.5956-9-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 4b21273d71d09 added upstream (security) patches up to 20200118
and in the commit description it outlines these CVEs were patched.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
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
-- 
2.17.1

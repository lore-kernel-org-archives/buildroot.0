From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 09:40:14 +0100
Subject: [Buildroot] [git commit] snmppp: bump to version 3.3.2
Message-ID: <20131227084417.609DF9C204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=530a919d116415e54cde5fe696970b4d5fab420d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes snmp++v3.3.2

====================

- Fixed: Regression through [APP-19] which lead to too long timeouts
  on systems with clock_gettime.
- Fixed: Restored missing files (CHANGES, READMEs) to distribution.
- Fixed: Fixed compilation error when using poll syscall.
- Fixed: Do not use _vscprintf as it is not portable, instead just
  truncate the log message.
- Fixed: Fixed test that produced an error during configure:
  checking which _XOPEN_SOURCE macro must be defined...
  ./configure: line 6229: test: : integer expression expected
- Fixed: msec.cpp: timezone is a struct and not a class.

Changes snmp++v3.3.1
====================

- Fixed: Replaced strcasecmp usage in consoleExamples by _stricmp
  for WIN32 platform.
- Improved: Debug output buffer length is now computed exactly on
  WIN32.
- Fixed: Compilation of IPv6Utility.h with Visual Studio 2013.
- Fixed: Removed #define of Uint32 in eventlistholder.h.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/snmppp/snmppp.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 8e8fceb..d5e7adf 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.3.0
-SNMPPP_SOURCE = snmp++v$(SNMPPP_VERSION).tar.gz
+SNMPPP_VERSION = 3.3.2
+SNMPPP_SOURCE = snmp++$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com
 SNMPPP_DEPENDENCIES = openssl host-pkgconf
 SNMPPP_INSTALL_STAGING = YES

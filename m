From: Adam Duskett <aduskett@gmail.com>
Date: Wed,  8 Nov 2017 07:00:33 -0500
Subject: [Buildroot] [PATCH 1/1] snmp++: security bump to v3.3.10
Message-ID: <20171108120033.26045-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the changelong:
Set the FD_CLOEXEC flag on sockets, so they are not "leaked" to
spawned processes

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/snmppp/snmppp.hash | 3 ++-
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index 75ecddade2..5c8feee152 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 2ef0cb20658c1eb9e053f8a7a9d5c8f5ebf2f734d37b692fdbf7163ea17dde6f  snmp++-3.3.9.tar.gz
+sha256 6827adb6a6a68a7f32c41fa12bdfd0aa48f4825b8773f63fc4d5c8482d4ed481	snmp++-3.3.10.tar.gz
+sha256 d00d5deb9ce44fa01ddf6f882de3ea8b9e8402f776b546dd982d55367ebbd392	src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 67410d9e4d..4ceb61c9fc 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.3.9
+SNMPPP_VERSION = 3.3.10
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
-- 
2.13.6

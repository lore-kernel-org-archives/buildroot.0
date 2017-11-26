From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:27:01 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] snmp++: security bump to
 v3.3.10
Message-ID: <20171126213856.A16D4802C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf6abc6dcf172f1edc30d363aaab836d2bd27852
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

From the changelong:
Set the FD_CLOEXEC flag on sockets, so they are not "leaked" to
spawned processes

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6be1631bf27cb0d2aa6ddcbad835d614f33698e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snmppp/snmppp.hash | 3 ++-
 package/snmppp/snmppp.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index 75ecdda..5c8feee 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 2ef0cb20658c1eb9e053f8a7a9d5c8f5ebf2f734d37b692fdbf7163ea17dde6f  snmp++-3.3.9.tar.gz
+sha256 6827adb6a6a68a7f32c41fa12bdfd0aa48f4825b8773f63fc4d5c8482d4ed481	snmp++-3.3.10.tar.gz
+sha256 d00d5deb9ce44fa01ddf6f882de3ea8b9e8402f776b546dd982d55367ebbd392	src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 67410d9..4ceb61c 100644
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

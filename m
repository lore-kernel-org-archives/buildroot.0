From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:16:46 +0100
Subject: [Buildroot] [git commit] netsnmp: Set ac_cv_NETSNMP_CAN_USE_SYSCTL
	to no
Message-ID: <20150219212341.53F6E8178B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6b614c9c6e3e1cf9d8a2ee04c471aff9fb7b2ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NETSNMP_CAN_USE_SYSCTL is for BSD systems, setting it to yes on
Linux systems breaks compilation when the mibII mib is enabled.

Prior to commit 30bb1bdca49a1dcb71d477e546a40840af865ce2 ("netsnmp:
bump version") from November 2008, this variable was already set to
no, and was changed to yes by the commit, with no explanation. And the
previous code indeed had a comment saying:

   # We set CAN_USE_SYSCTL to no and use /proc since the sysctl code
   # in this thing is apparently intended for freebsd or some such
   # thing...

[Thomas: improved commit log.]

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsnmp/netsnmp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index bfc2a74..f1b103e 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -10,7 +10,7 @@ NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_INSTALL_STAGING = YES
-NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
+NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=no
 NETSNMP_CONF_OPTS = \
 	--with-persistent-directory=/var/lib/snmp \
 	--with-defaults \

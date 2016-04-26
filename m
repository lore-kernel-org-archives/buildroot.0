From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 22:00:38 +0200
Subject: [Buildroot] [git commit] c-icap: bump to version 0.4.2
Message-ID: <20160426200119.B62B981E40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=716e7d5ef82fc19db286dceeeb3e686f24a48461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/c-icap.hash | 2 +-
 package/c-icap/c-icap.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/c-icap/c-icap.hash b/package/c-icap/c-icap.hash
index 89c70f4..2b083ef 100644
--- a/package/c-icap/c-icap.hash
+++ b/package/c-icap/c-icap.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 46b97fab73dbb9e8def8e34c3f94048c92f50a5341bb85bec4f6f6349aec529a c_icap-0.3.5.tar.gz
+sha256 b138c7d7d9828d54c3307bcfe7b4917911266593832ffc26a60df9a0dfd2511e c_icap-0.4.2.tar.gz
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index b4defb8..cff642c 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_VERSION = 0.3.5
+C_ICAP_VERSION = 0.4.2
 C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
 C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_LICENSE = LGPLv2.1+
@@ -17,6 +17,9 @@ C_ICAP_CONF_OPTS = \
 	--without-perl \
 	--enable-large-files \
 	--enable-ipv6
+# Pre-seed cache variables for tests done with AC_TRY_RUN that are not
+# cross-compile friendly
+C_ICAP_CONF_ENV = ac_cv_10031b_ipc_sem=yes ac_cv_fcntl=yes
 
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 C_ICAP_CONF_OPTS += --with-berkeleydb

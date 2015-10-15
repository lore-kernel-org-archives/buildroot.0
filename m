From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Oct 2015 09:39:54 +0200
Subject: [Buildroot] [git commit] sane-backends: specify explicit path to
	net-snmp-config
Message-ID: <20151015074025.EC114819ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=389827f9d4c3f5f0abb337f7ba1129c11b6facbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise if the host distro has net-snmp devel files sane-backends will
find /usr/bin/net-snmp-config first and the build will break. Fixes:
http://autobuild.buildroot.net/results/c38/c381c316907964787ebe1a0807399022f15d8158/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sane-backends/sane-backends.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 0c0b5a9..e980929 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -39,6 +39,7 @@ SANE_BACKENDS_CONF_OPTS += --enable-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
+SANE_BACKENDS_CONF_ENV += ac_cv_path_SNMP_CONFIG_PATH=$(STAGING_DIR)/usr/bin/net-snmp-config
 SANE_BACKENDS_DEPENDENCIES += netsnmp
 else
 SANE_BACKENDS_CONF_OPTS += --without-snmp

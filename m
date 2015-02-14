From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:03:23 +0100
Subject: [Buildroot] [git commit] package/openvmtools: don't use host
	library path
Message-ID: <20150214210355.D796B8045D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a45838ab004843511b42006423a84c057f5d5a75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set CUSTOM_PROCPS_LIBS to " " otherwise -L/lib is used by default.

Fixes:
http://autobuild.buildroot.net/results/bff/bff7d8f3ec19ce790f0c88a336d1007e1ff29836/

[Thomas: fix typo in commit log.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvmtools/openvmtools.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 7aa04af..e0ec6d6 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -22,7 +22,9 @@ OPENVMTOOLS_DEPENDENCIES += libfuse
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
-OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps
+# Set CUSTOM_PROCPS_LIBS to " " otherwise -L/lib is used by default.
+OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps \
+	CUSTOM_PROCPS_LIBS=" "
 OPENVMTOOLS_CONF_OPTS += --with-procps
 OPENVMTOOLS_DEPENDENCIES += procps-ng
 else

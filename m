From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 21:19:50 +0200
Subject: [Buildroot] [git commit] lm-sensors: sensors-detect requires perl
Message-ID: <20140715192013.B75949D1C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fbcfbf66b5c8c2753df69d6f7de2cc857cf69ce1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sensors-detect program is in fact a Perl script, so it won't run
on the target unless Perl is enabled in the configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/lm-sensors/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/lm-sensors/Config.in b/package/lm-sensors/Config.in
index 33c59fd..7065c4c 100644
--- a/package/lm-sensors/Config.in
+++ b/package/lm-sensors/Config.in
@@ -44,8 +44,12 @@ config BR2_PACKAGE_LM_SENSORS_PWMCONFIG
 
 config BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT
 	bool "sensors-detect"
+	depends on BR2_PACKAGE_PERL
 	help
 	  Sensors-detect is an interactive program for detecting
 	  available hardware monitoring chips.
 
+comment "sensors-detect needs perl"
+	depends on !BR2_PACKAGE_PERL
+
 endif

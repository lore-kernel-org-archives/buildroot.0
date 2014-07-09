From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  9 Jul 2014 22:50:33 +0200
Subject: [Buildroot] [PATCH 3/3] lm-sensors: sensors-detect requires perl
In-Reply-To: <1404939033-32578-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404939033-32578-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1404939033-32578-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sensors-detect program is in fact a Perl script, so it won't run
on the target unless Perl is enabled in the configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lm-sensors/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

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
-- 
2.0.0

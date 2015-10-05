From: James Knight <james.knight@rockwellcollins.com>
Date: Mon,  5 Oct 2015 16:29:26 -0400
Subject: [Buildroot] [PATCH 1/1] ntp: add ntptime option
Message-ID: <1444076966-9308-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow the `ntptime` utility to be included on a target.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/ntp/Config.in | 6 ++++++
 package/ntp/ntp.mk    | 1 +
 2 files changed, 7 insertions(+)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index d4caddf..1763225 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -67,6 +67,12 @@ config BR2_PACKAGE_NTP_NTPSNMPD
 	help
 	  Install ntpsnmpd NTP SNMP MIB agent.
 
+config BR2_PACKAGE_NTP_NTPTIME
+	bool "ntptime"
+	help
+	  The ntptime utility program is used to read and set kernel time
+	  variables.
+
 config BR2_PACKAGE_NTP_NTPTRACE
 	bool "ntptrace"
 	depends on BR2_PACKAGE_PERL
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 5997247..a3818ea 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -46,6 +46,7 @@ NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDATE) += ntpdate/ntpdate
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDC) += ntpdc/ntpdc
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPQ) += ntpq/ntpq
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPSNMPD) += ntpsnmpd/ntpsnmpd
+NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPTIME) += util/ntptime
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPTRACE) += scripts/ntptrace/ntptrace
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_SNTP) += sntp/sntp
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_TICKADJ) += util/tickadj
-- 
1.9.5.msysgit.1

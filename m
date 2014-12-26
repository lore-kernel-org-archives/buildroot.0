From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 15:14:06 +0100
Subject: [Buildroot] [git commit] package/ntp: fix installation
Message-ID: <20141226141410.426BB80766@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=903b210402a9431a0062d92b5511a8c539a3fd91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 5d5c9a8 (ntp: security bump to version 4.2.8), scripts/ntp-wait
and scripts/ntptrace are no longer scripts themselves, but directories
containing those scripts.

Fixes:
    http://autobuild.buildroot.org/results/518/5189e84004bf28b891da3ee07fecc8717b4e8e8c/ (ntp-wait)
    http://autobuild.buildroot.org/results/005/0056192a06d44814a0279637c4bcbf602936e7ff/ (ntptrace)
    http://autobuild.buildroot.org/results/8f3/8f372acf73743edf8027cda6865ba1aa7b6413a3/ (both)
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/ntp.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index a30adc2..3a1a917 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -52,12 +52,12 @@ define NTP_PATCH_FIXUPS
 endef
 
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_KEYGEN) += util/ntp-keygen
-NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_WAIT) += scripts/ntp-wait
+NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_WAIT) += scripts/ntp-wait/ntp-wait
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDATE) += ntpdate/ntpdate
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDC) += ntpdc/ntpdc
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPQ) += ntpq/ntpq
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPSNMPD) += ntpsnmpd/ntpsnmpd
-NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPTRACE) += scripts/ntptrace
+NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPTRACE) += scripts/ntptrace/ntptrace
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_SNTP) += sntp/sntp
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_TICKADJ) += util/tickadj
 

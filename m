From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 09:42:39 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] ntp: enable/disable sntp
	support depending on BR2_PACKAGE_NTP_SNTP
Message-ID: <20170626081139.33DED7FB5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce392505cf5ae7229eec5ab0f3c4d3c2579458ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

We already have an option for selecting sntp support in ntp that can be
chosen from the menuconfig, and ntp's configure script has a --with-sntp
option (with its --without counterpart) which can be used for disabling
sntp support in ntp. However, we are not using it. This patch will make
use of it.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 79ee9b7e692824886bc19b21f55ac25e36e238f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 26f5862..c70d6e6 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -65,6 +65,12 @@ else
 NTP_CONF_OPTS += --disable-SHM
 endif
 
+ifeq ($(BR2_PACKAGE_NTP_SNTP),y)
+NTP_CONF_OPTS += --with-sntp
+else
+NTP_CONF_OPTS += --without-sntp
+endif
+
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_KEYGEN) += util/ntp-keygen
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTP_WAIT) += scripts/ntp-wait/ntp-wait
 NTP_INSTALL_FILES_$(BR2_PACKAGE_NTP_NTPDATE) += ntpdate/ntpdate

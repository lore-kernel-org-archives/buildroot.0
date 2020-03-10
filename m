From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 22:44:12 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/clamav: security
 bump version to 0.102.2
Message-ID: <20200310213455.243729087F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d28b2d4f0de4ecfdb0dc554fa9d53b113f9db64a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes CVE-2020-3123: A vulnerability in the Data-Loss-Prevention (DLP)
module in Clam AntiVirus (ClamAV) Software versions 0.102.1 and 0.102.0
could allow an unauthenticated, remote attacker to cause a denial of service
condition on an affected device.  The vulnerability is due to an
out-of-bounds read affecting users that have enabled the optional DLP
feature.  An attacker could exploit this vulnerability by sending a crafted
email file to an affected device.  An exploit could allow the attacker to
cause the ClamAV scanning process crash, resulting in a denial of service
condition.

Release notes:
https://lists.clamav.net/pipermail/clamav-announce/2020/000045.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 19748514b8907ff1dbc2d7cb6c02362927a238e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 72ce1b1c44..613d9b4122 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 0dbda8d0d990d068732966f13049d112a26dce62145d234383467c1d877dedd6  clamav-0.102.1.tar.gz
+sha256 89fcdcc0eba329ca84d270df09d2bb89ae55f5024b0c3bddb817512fb2c907d3  clamav-0.102.2.tar.gz
 sha256 0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256 d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256 dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index a4059ae200..b8d7de52fa 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.102.1
+CLAMAV_VERSION = 0.102.2
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \

From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 01:02:21 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] package/ntp: security
 bump to version 4.2.8p12
Message-ID: <20181023230145.E4F2688722@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e846a6e47b21c66702f96ac3775945d01d3a0fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Release notes:
https://www.nwtime.org/network-time-foundation-publishes-ntp-4-2-8p12

Fixed security issues:

  CVE-2016-1549 / CVE-2018-7170: Sybil vulnerability: ephemeral association
  attack

  CVE-2018-12327: The openhost() function used during command-line hostname
  processing by ntpq and ntpdc can write beyond its buffer limit

Signed-off-by: Artem Panfilov <apanfilov@spectracom.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cf9344c45e85ed274cf783271344f4c03138971d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.hash | 2 +-
 package/ntp/ntp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index ea86c1586f..02dbaffcba 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,5 +1,5 @@
 # From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p11.tar.gz.md5
 md5 00950ca2855579541896513e78295361  ntp-4.2.8p11.tar.gz
 # Calculated based on the hash above
-sha256 f14a39f753688252d683ff907035ffff106ba8d3db21309b742e09b5c3cd278e  ntp-4.2.8p11.tar.gz
+sha256 709b222b5013d77d26bfff532b5ea470a8039497ef29d09363931c036cb30454  ntp-4.2.8p12.tar.gz
 sha256 62c87b269365b38b55359b16dfde7ec28c683c722ef489db90afd0f2e478e4a1  COPYRIGHT
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 674c368395..af3c1aad9f 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p11
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p12
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent
 NTP_LICENSE = NTP

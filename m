From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 14:52:03 +0200
Subject: [Buildroot] [git commit branch/2019.11.x] package/ntp: security
 bump to version 4.2.8p14
Message-ID: <20200408123908.C928A8DF02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e6bbed3097a30c012c9d942cf44bde5f3496ea6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

"This release fixes three security issues in ntpd and provides 46
bugfixes and addresses 4 other issues." [1]

NONE: Sec 3610: process_control() should bail earlier on short packets.

MEDIUM: Sec 3596: Unauthenticated ntpd may be susceptible to IPv4 spoof
attack from highly predictable transmit timestamps.

MEDIUM: Sec 3592: DoS Attack on unauthenticated client.
The fix for https://bugs.ntp.org/3445 introduced a bug whereby a system that
is running ntp-4.2.8p12 (possibly earlier) or p13 that only has one
unauthenticated time source can be attacked in a way that causes the
victim's next poll to its source to be delayed, for as long as the attack is
maintained.

[1] http://support.ntp.org/bin/view/Main/SecurityNotice#March_2020_ntp_4_2_8p14_NTP_Rele

The copyright year has changed in the COPYRIGHT file, so adjust the hash to
match and adjust the spacing to match recent agreements:

@@ -3,7 +3,7 @@

    jpg "Clone me," says Dolly sheepishly.

-   Last update: 2-Jan-2017 11:58 UTC
+   Last update: 4-Feb-2020 23:47 UTC
      __________________________________________________________________

    The following copyright notice applies to all files collectively called
@@ -32,7 +32,7 @@
    Burnicki is:
 ***********************************************************************
 *                                                                     *
-* Copyright (c) Network Time Foundation 2011-2017                     *
+* Copyright (c) Network Time Foundation 2011-2020                     *
 *                                                                     *
 * All Rights Reserved                                                 *
 *                                                                     *

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
[Peter: clarify security impact, document COPYRIGHT change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9daf7483e9cf86d86797e799c73be80dbbbb9acf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.hash | 8 ++++----
 package/ntp/ntp.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 4014936e61..fdb5bacade 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,5 +1,5 @@
-# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p13.tar.gz.md5
-md5 ea040ab9b4ca656b5229b89d6b822f13  ntp-4.2.8p13.tar.gz
+# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p14.tar.gz.md5
+md5  783edaf1d68ddf651bde64eda54a579d  ntp-4.2.8p14.tar.gz
 # Calculated based on the hash above
-sha256 288772cecfcd9a53694ffab108d1825a31ba77f3a8466b0401baeca3bc232a38  ntp-4.2.8p13.tar.gz
-sha256 3828da5fc8126889d6a64432288ace08526c490bf5427d799931689069968d91  COPYRIGHT
+sha256  1960e4f081f6aafd108d721bc3ab15f9e8dfd08dc08339aa95bca9d2545e4eb7  ntp-4.2.8p14.tar.gz
+sha256  957e6a13445cc61ab1ca3dc80d8c269cf9b0a6d9eaec20f9f39639b0b3e66ee8  COPYRIGHT
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 56050f4fe1..a60dc79c01 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p13
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p14
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent
 NTP_LICENSE = NTP

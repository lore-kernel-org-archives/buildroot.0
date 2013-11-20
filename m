Message-Id: <cover.1384984956.git.chris@zankel.net>
From: Chris Zankel <chris@zankel.net>
Date: Wed, 20 Nov 2013 14:02:36 -0800
Subject: [PATCH 0/2] *** SUBJECT HERE ***
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot

Hi,

These two patches fix two of the broken builds for Xtensa:
- coreutils
- cdrkit

The first patch enables valloc for recent versions of uClibc (snapshot), which
is still used by cdrkit. The second patch disables libnsrp for Xtensa
(!BR_xtensa), which is used by libnss, and consequently libnss and ecryptfs.

Thanks,
-Chris

Chris Zankel (2):
  uclibc-snapshot: enable option UCLIBC_SUSV2_LEGACY
  libnspr: Add dependency on !BR2_xtensa

 package/ecryptfs-utils/Config.in      | 1 +
 package/libnspr/Config.in             | 3 ++-
 package/libnss/Config.in              | 1 +
 package/uclibc/uClibc-snapshot.config | 1 +
 4 files changed, 5 insertions(+), 1 deletion(-)

-- 
1.8.1.2

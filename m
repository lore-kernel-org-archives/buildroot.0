From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 22:22:18 +0200
Subject: [Buildroot] [git commit] ptpd2: fix patch 0002 so that it applies
 properly
Message-ID: <20181011202228.F01F483476@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d60973af00c5ad7dc15049597cf03bd1ad538041
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch
0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch added in
commit 5b7bc560a5859d4b9f0c2a14c10e83c18fbd6bca ("ptpd2: fix build
failures due to EVP_MD_CTX conflict and U64 missing") was broken and
did not apply correctly.

This commit fixes the patch so that it applies properly.

Fixes:

  http://autobuild.buildroot.net/results/ffa28ee2cecc77d66d934fdb03e1f2014189e45b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch b/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch
index 9a9beacf90..e655ff3354 100644
--- a/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch
+++ b/package/ptpd2/0002-ntp_isc_md5-rename-EVP_MD_CTX-into-PTPD_EVP_MD_CTX.patch
@@ -1,4 +1,4 @@
-From 838b985510c360e651d18134e64f258f2f4c6e7c Mon Sep 17 00:00:00 2001
+From af1d16d90ff273413a57cd02689f4fb005403609 Mon Sep 17 00:00:00 2001
 From: Giulio Benetti <giulio.benetti@micronovasrl.com>
 Date: Fri, 31 Aug 2018 18:46:56 +0200
 Subject: [PATCH] ntp_isc_md5: rename EVP_MD_CTX into PTPD_EVP_MD_CTX
@@ -16,7 +16,7 @@ Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/dep/ntpengine/ntp_isc_md5.c b/src/dep/ntpengine/ntp_isc_md5.c
-index 7d04467..e4e34ac 100644
+index 850d004..3216de8 100644
 --- a/src/dep/ntpengine/ntp_isc_md5.c
 +++ b/src/dep/ntpengine/ntp_isc_md5.c
 @@ -262,7 +262,7 @@ MD5authencrypt(
@@ -25,7 +25,7 @@ index 7d04467..e4e34ac 100644
  	u_int	len;
 -	EVP_MD_CTX ctx;
 +	PTPD_EVP_MD_CTX ctx;
-         pkt[length / 4] = htonl(keyid);
+         pkt[length / 4] = htonl(keyid); 
  	EVP_DigestInit(&ctx);
  	EVP_DigestUpdate(&ctx, (u_char *)key, (u_int)strlen(key));
 diff --git a/src/dep/ntpengine/ntp_isc_md5.h b/src/dep/ntpengine/ntp_isc_md5.h
@@ -42,5 +42,5 @@ index fa6e2ee..236c0e4 100644
  # define EVP_DigestUpdate(c, p, s)      MD5Update(c, p, s)
  # define EVP_DigestFinal(c, d, pdl)     \
 -- 
-2.17.1
+2.14.4
 

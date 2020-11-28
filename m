From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Nov 2020 09:24:09 +0100
Subject: [Buildroot] [git commit] package/proftpd: security bump to version
 1.3.6e
Message-ID: <20201128081355.EA98C81407@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ba4aa92981107462e23c4a7d2b1ef291743fe81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

1.3.6e
---------
  + Fixed null pointer deference in mod_sftp when using SCP incorrectly
    (Issue #1043).

1.3.6d
---------
  + Fixed issue with FTPS uploads of large files using TLSv1.3 (Issue #959).

1.3.6c
---------
  + Fixed regression in directory listing latency (Issue #863).
  + Detect OpenSSH-specific formatted SFTPHostKeys, and log hint for
    converting them to supported format.
  + Fixed use-after-free vulnerability during data transfers (Issue #903)
    [CVE-2020-9273]
  + Fixed out-of-bounds read in mod_cap by updating the bundled libcap
    (Issue #902) [CVE-2020-9272]

http://proftpd.org/docs/RELEASE_NOTES-1.3.6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: mark as security bump, add CVEs]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.hash | 2 +-
 package/proftpd/proftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 1ac54de4ca..983500bb8e 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fa3541c4b34136a7b80cb12a2f6f9a0cab5118a5b0a1653d40af49c6479c35ad  proftpd-1.3.6c.tar.gz
+sha256  2dbe684034ab592742ebdb778a8a234b70f959efeb30feedee3ea77f26f74fbb  proftpd-1.3.6e.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index e126d0e0a4..e35e78607d 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.6c
+PROFTPD_VERSION = 1.3.6e
 PROFTPD_SITE = $(call github,proftpd,proftpd,v$(PROFTPD_VERSION))
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING

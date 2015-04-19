From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Sun, 19 Apr 2015 12:49:26 -0400 (EDT)
Subject: [Buildroot] [PATCH] u-boot: Add sha256 hash value for earlier
	2013.10 version.
Message-ID: <alpine.LFD.2.11.1504191245070.8977@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Add a hash value for u-boot-2013.10.tar.bz2.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  if i understand this correctly, if a package has no hash file, then
downloading generates a warning. but with the newly-added uboot.hash
file, the missing sha256sum for the earlier 2013.10 version generates
an "ERROR" when running "make source", even though the tarball is in
fact downloaded correctly. so just add a hash value to quiet the
download.

diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 9cc96f6..b98c2ff 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256	0a1a70df586655f527befa6f12e184e96ed61b126e5a567382321b17200f5d60  u-boot-2015.04.tar.bz2
+sha256	0d71e62beb952b41ebafb20a7ee4df2f960db64c31b054721ceb79ff14014c55  u-boot-2013.10.tar.bz2

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

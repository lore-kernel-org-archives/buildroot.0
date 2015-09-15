From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Mon, 14 Sep 2015 22:59:49 -0500
Subject: [Buildroot] [PATCH 0/2] openssl parallel build
Message-ID: <1442289591-30376-1-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I have adopted Thomas P's patches that we submitted but in May in order
enable parallel build of openssl. I have updated the patches to use the 
latest patches available from gentoo and have tested builds only on i386,
ARM, and MIPS.

Original Patches:

http://patchwork.ozlabs.org/patch/473086/
http://patchwork.ozlabs.org/patch/473087/

Thanks,
-Ryan

Thomas Petazzoni (2):
  openssl: use git formatted patches
  openssl: enable parallel build and installation

 ...time-building-manpages-if-we-re-not-going.patch | 28 +++++++++
 ...odev-Fix-issue-with-signature-generation.patch} | 71 +++++++++++++---------
 package/openssl/001-do-not-build-docs.patch        | 13 ----
 package/openssl/openssl.hash                       |  2 +
 package/openssl/openssl.mk                         | 12 ++--
 5 files changed, 79 insertions(+), 47 deletions(-)
 create mode 100644 package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
 rename package/openssl/{003-cryptodev-Fix-issue-with-signature-generation.patch => 0002-cryptodev-Fix-issue-with-signature-generation.patch} (82%)
 delete mode 100644 package/openssl/001-do-not-build-docs.patch

-- 
1.9.1

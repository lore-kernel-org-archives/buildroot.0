From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Wed, 16 Sep 2015 07:06:23 -0500
Subject: [Buildroot] [v3 0/2] openssl: parallel build
Message-ID: <1442405185-4103-1-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have adopted Thomas P's patches that we submitted but in May in order
enable parallel build of openssl. I have updated the patches to use the
latest patches available from gentoo and have tested builds only on i386,
ARM, and MIPS.

Original Patches:

http://patchwork.ozlabs.org/patch/473086/
http://patchwork.ozlabs.org/patch/473087/

Ryan Barnett (2):
  openssl: use git formatted patches
  openssl: enable parallel build and installation

 ...time-building-manpages-if-we-re-not-going.patch | 27 ++++++++
 ...odev-Fix-issue-with-signature-generation.patch} | 71 +++++++++++++---------
 package/openssl/001-do-not-build-docs.patch        | 13 ----
 package/openssl/openssl.hash                       |  2 +
 package/openssl/openssl.mk                         | 12 ++--
 5 files changed, 78 insertions(+), 47 deletions(-)
 create mode 100644 package/openssl/0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
 rename package/openssl/{003-cryptodev-Fix-issue-with-signature-generation.patch => 0002-cryptodev-Fix-issue-with-signature-generation.patch} (82%)
 delete mode 100644 package/openssl/001-do-not-build-docs.patch

-- 
1.9.1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 21:57:58 +0200
Subject: [Buildroot] [git commit branch/next] package/vdr: bump version to
	2.3.4
Message-ID: <20170517195804.11FC58265C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=661a7f83a8ad5843b0f7b7ad6ad55caa6396de2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also fixes compile error with gcc7:

dvbdevice.c: In member function 'bool cDvbTuner::SetFrontend()':
dvbdevice.c:848:31: error: call of overloaded 'abs(unsigned int&)' is ambiguous
      frequency = abs(frequency); // Allow for C-band, where the frequency is less than the LOF
                               ^

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vdr/vdr.hash | 6 +++---
 package/vdr/vdr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index edbcd3f..b4800d5 100644
--- a/package/vdr/vdr.hash
+++ b/package/vdr/vdr.hash
@@ -1,4 +1,4 @@
-# From https://www.linuxtv.org/pipermail/vdr/2016-December/029178.html
-md5 6dbb208ea3d59658a18912b49af175b3  vdr-2.3.2.tar.bz2
+# From https://www.linuxtv.org/pipermail/vdr/2017-April/029243.html
+md5 7b1c985d5e7703f7ec46e3818f546702  vdr-2.3.4.tar.bz2
 # Locally computed
-sha256 6c6ab08cf4dadd296e5e4a1c13f793c2e9222ec23103ae7aa9d616619f1496c0  vdr-2.3.2.tar.bz2
+sha256 97600301e8bb16ac6a6ed58c0b7c18a48e3ab1cc7130311d405178109777c03a  vdr-2.3.4.tar.bz2
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index 24467f7..6940813 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VDR_VERSION = 2.3.2
+VDR_VERSION = 2.3.4
 VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
 VDR_SITE = ftp://ftp.tvdr.de/vdr/Developer
 VDR_LICENSE = GPL-2.0+

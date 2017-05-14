From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 14:39:06 +0200
Subject: [Buildroot] [git commit] package/binutils: finalize the bump ARC
	tools to arc-2017.03-rc2
Message-ID: <20170514123917.6FA2A8285B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f937bbb71673c66836577a3751e49cd964e6d9d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit bumping ARC tools to arc-2017.03-rc2 [1] forgot to
update the ARC tools version in binutils.mk

[1] 043737282010f83e8ec20618a034131bc7e8cae1

Fixes:
http://autobuild.buildroot.net/results/f9c/f9c40610209fc22ac8c0db6bd57bd3b11bbe6d9c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 72e2d0b..bc0268e 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2017.03-rc1
+BINUTILS_VERSION = arc-2017.03-rc2
 else
 BINUTILS_VERSION = 2.27
 endif

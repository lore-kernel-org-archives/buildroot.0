From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:34 +0100
Subject: [Buildroot] [PATCH 10/22] gmp: requires host-m4
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On a system where m4 is not installed, gmp does not build due to the
lack of m4. Add the missing host-m4 dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gmp/gmp.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 093d60c..24fbb3d 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -11,6 +11,8 @@ GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPLv3+
 GMP_LICENSE_FILES = COPYING.LIB
 
+GMP_DEPENDENCIES = host-m4
+
 # Bad ARM assembly breaks on pure thumb
 ifeq ($(ARCH),arm)
 GMP_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -marm"
-- 
1.7.9.5

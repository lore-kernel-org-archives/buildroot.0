From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Nov 2011 13:06:49 -0300
Subject: [Buildroot] [PATCHv2] oprofile: fix mipsel build, solves bug #3709
Message-ID: <1321027609-19181-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/oprofile/oprofile.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 734839f..5da794b 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -12,6 +12,9 @@ OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
 ifeq ($(BR2_i386),y)
 OPROFILE_ARCH = i386
 endif
+ifeq ($(BR2_mipsel),y)
+OPROFILE_ARCH = mips
+endif
 ifeq ($(BR2_powerpc),y)
 OPROFILE_ARCH = ppc
 endif
-- 
1.7.3.4

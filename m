From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu,  6 Nov 2014 14:47:22 +0300
Subject: [Buildroot] [PATCH] uclibc: respect top-level TARGET_CFLAGS
Message-ID: <1415274442-24547-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_TARGET_OPTIMIZATION is used (with some specific compiler flags)
it's expected that ALL target binaries will be built with specified options.

Currently uClibc is built with its own set of options.
This change allows passing additional flags to uclibc build system.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/uclibc/uclibc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index ce416dd..419a4d1 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -24,6 +24,8 @@ endif
 
 UCLIBC_INSTALL_STAGING = YES
 
+UCLIBC_EXTRA_CFLAGS = $(TARGET_CFLAGS)
+
 # uclibc is part of the toolchain so disable the toolchain dependency
 UCLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-- 
1.9.3

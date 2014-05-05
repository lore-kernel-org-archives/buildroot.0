From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 May 2014 23:17:06 +0200
Subject: [Buildroot] [PATCHv2 06/10] package: add support for musl in tuple
In-Reply-To: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1399324630-3830-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index c34a3bf..2fc3aa7 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -47,6 +47,8 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 LIBC=uclibc
+else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+LIBC=musl
 else
 LIBC=gnu
 endif
-- 
1.9.2

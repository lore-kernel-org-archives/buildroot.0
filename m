From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 00:14:29 +0200
Subject: [Buildroot] [RFCv1 5/8] package: add support for musl in tuple
In-Reply-To: <1398291272-17591-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1398291272-17591-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1398291272-17591-6-git-send-email-thomas.petazzoni@free-electrons.com>
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

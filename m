From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  5 Feb 2019 12:03:42 +0100
Subject: [Buildroot] [PATCH] Makefile: unexport 'PLATFORM' and 'OS'
 environment variables
Message-ID: <20190205110342.29725-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Some package builds may fail when environment variables are present with the
same names as make variables in a package. This is a bigger problem for
environment variables with generic names, like 'PLATFORM' and 'OS'.

'PLATFORM' is for example a problem for host-acl.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 355a404e04..50a9f623b2 100644
--- a/Makefile
+++ b/Makefile
@@ -419,6 +419,8 @@ unexport TERMINFO
 unexport MACHINE
 unexport O
 unexport GCC_COLORS
+unexport PLATFORM
+unexport OS
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
-- 
2.19.2

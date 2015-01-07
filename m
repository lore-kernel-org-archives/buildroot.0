From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:59:12 +0100
Subject: [Buildroot] [git commit] glibc: add debug symbols when
	BR2_ENABLE_DEBUG
Message-ID: <20150107215918.64251807B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1221df7bc63d755ddd4a88f6ad4e3fa69f27ae20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/glibc.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 65f4ed3..0a37bb3 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -47,6 +47,10 @@ else ifeq ($(BR2_MIPS_OABI32),y)
 GLIBC_EXTRA_CFLAGS += -mabi=32
 endif
 
+ifeq ($(BR2_ENABLE_DEBUG),y)
+GLIBC_EXTRA_CFLAGS += -g
+endif
+
 # The stubs.h header is not installed by install-headers, but is
 # needed for the gcc build. An empty stubs.h will work, as explained
 # in http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html. The same trick

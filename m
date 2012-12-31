From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Dec 2012 14:04:37 +0100
Subject: [Buildroot] [PATCH] tooclhain/internal: enable wordexp in uClibc
Message-ID: <1356959077-29498-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wordexp is used by tvheadend.

Although alegedly rarely used, we want all our packages to build
with the internal toolchain backend, so we just enable it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/uClibc/uClibc-0.9.33.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.33.config b/toolchain/uClibc/uClibc-0.9.33.config
index eb39df6..3f62d52 100644
--- a/toolchain/uClibc/uClibc-0.9.33.config
+++ b/toolchain/uClibc/uClibc-0.9.33.config
@@ -227,7 +227,7 @@ UCLIBC_HAS_REGEX=y
 # UCLIBC_HAS_REGEX_OLD is not set
 UCLIBC_HAS_FNMATCH=y
 # UCLIBC_HAS_FNMATCH_OLD is not set
-# UCLIBC_HAS_WORDEXP is not set
+UCLIBC_HAS_WORDEXP=y
 UCLIBC_HAS_NFTW=y
 UCLIBC_HAS_FTW=y
 # UCLIBC_HAS_FTS is not set
-- 
1.7.2.5

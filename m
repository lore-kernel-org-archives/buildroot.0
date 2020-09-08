From: Damien Le Moal <damien.lemoal@wdc.com>
Date: Tue,  8 Sep 2020 14:16:23 +0900
Subject: [Buildroot] [PATCH 4/5] package make: build nommu builds as linux
In-Reply-To: <20200908051624.425573-1-damien.lemoal@wdc.com>
References: <20200908051624.425573-1-damien.lemoal@wdc.com>
Message-ID: <20200908051624.425573-5-damien.lemoal@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Christoph Hellwig <hch@lst.de>

Using *-uclinux-* seems like an only partially followed convention.
And at least for RISC-V gcc doesn't know about uclinux tuples, so
switch back to the normal Linux one for now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 51f5cbce4f..dd04124b1b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -41,7 +41,7 @@ GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
 # FLAT binary format needs uclinux
 ifeq ($(BR2_BINFMT_FLAT),y)
-TARGET_OS = uclinux
+TARGET_OS = linux
 else
 TARGET_OS = linux
 endif
-- 
2.26.2

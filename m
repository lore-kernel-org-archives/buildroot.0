From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 15 Mar 2019 22:47:40 +0100
Subject: [Buildroot] [PATCH 2/2] pkg-generic: Cleanup some redundant checks
In-Reply-To: <20190315214740.4212-1-nolange79@gmail.com>
References: <20190315214740.4212-1-nolange79@gmail.com>
Message-ID: <20190315214740.4212-2-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/pkg-generic.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 89da43d5e5..11f16cab18 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -604,18 +604,15 @@ endif
 
 ifeq ($$(filter host-tar host-skeleton host-fakedate,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
-endif
 
-ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
 ifneq ($$(filter .xz .lzma,$$(suffix $$($(2)_SOURCE))),)
 $(2)_EXTRACT_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)
 endif
-endif
 
-ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
 ifeq ($$(suffix $$($(2)_SOURCE)),.lz)
 $(2)_EXTRACT_DEPENDENCIES += $$(BR2_LZIP_HOST_DEPENDENCY)
 endif
+
 endif
 
 ifeq ($$(BR2_CCACHE),y)
-- 
2.20.1

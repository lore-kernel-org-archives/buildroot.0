From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2010 18:46:41 +0100
Subject: [Buildroot] [PATCH 03/38] libxml2: do not apply libtool patch when
	compiling for host
In-Reply-To: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266774432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e81149c54301f88ae64bd85caa6d0f29e879d064.1266774432.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libtool patch is not applied when building for the target because
it does not apply, so do not attempt to apply it when building for the
host. This fixes libxml2 build for the host.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxml2/libxml2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index e598d36..31fdabf 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -28,6 +28,8 @@ HOST_LIBXML2_CONF_OPT = \
 		--enable-shared --without-debugging --without-python \
 		--without-threads
 
+HOST_LIBXML2_LIBTOOL_PATCH = NO
+
 $(eval $(call AUTOTARGETS,package,libxml2))
 $(eval $(call AUTOTARGETS,package,libxml2,host))
 
-- 
1.6.3.3

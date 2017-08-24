From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 24 Aug 2017 09:30:08 +0200
Subject: [Buildroot] [PATCH] bcusdk: enable tpuarts support in eibd
Message-ID: <20170824073008.GB22055@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

Please find my patch below.
It enables an extra interface type for eibd.
I don't understand why it wasn't there.

Kind regards,
Kurt

--
commit e62160001f09bff9be8e74b6d47da11c349bb2a6
Author: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date:   Thu Aug 24 09:16:36 2017

    bcusdk: enable tpuarts support in eibd
    
    This commit will enable tpuarts in eibd as well.
    tpuarts is equally important to FT1.2.
    It makes no sense to enable only some interfaces.
    
    Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index 6c7641d..b54b94c 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -14,6 +14,7 @@ BCUSDK_CONF_OPTS = \
 	--enable-onlyeibd \
 	--enable-ft12 \
 	--enable-pei16 \
+	--enable-tpuarts \
 	--enable-eibnetip \
 	--enable-eibnetipserver \
 	--enable-eibnetiptunnel \

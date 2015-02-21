From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Feb 2015 23:36:18 +0100
Subject: [Buildroot] [PATCH 05/11 v5] package/freerdp: avoid development
	warning
In-Reply-To: <cover.1424558036.git.yann.morin.1998@free.fr>
References: <cover.1424558036.git.yann.morin.1998@free.fr>
Message-ID: <12b9715f9e308904f473a73a4d909465914a62a5.1424558036.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FreeRDP still uses old-style variables (about linking interfaces), and
that causes a warning, which explicitly states it is targeted at
developers:

    Policy CMP0022 is not set: INTERFACE_LINK_LIBRARIES defines the link
    interface.  Run "cmake --help-policy CMP0022" for policy details.  Use the
    cmake_policy command to set the policy and suppress this warning.

    Target "freerdp-client" has an INTERFACE_LINK_LIBRARIES property which
    differs from its LINK_INTERFACE_LIBRARIES properties.

    INTERFACE_LINK_LIBRARIES:

      [elided list of stuff]

    LINK_INTERFACE_LIBRARIES:

    This warning is for project developers.  Use -Wno-dev to suppress it.

So, just get rid of it as instructed in that warning message itself.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index e873d33..5bfdeec 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -12,7 +12,7 @@ FREERDP_DEPENDENCIES = openssl zlib \
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
-FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF
+FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF -Wno-dev
 
 ifeq ($(BR2_PACKAGE_GSTREAMER),y)
 FREERDP_CONF_OPTS += -DWITH_GSTREAMER=ON
-- 
1.9.1

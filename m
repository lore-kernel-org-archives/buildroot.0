From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 10:48:30 +0100
Subject: [Buildroot] [git commit branch/next] package/freerdp: avoid
	development warning
Message-ID: <20150222103030.B13CF807A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93c6c95198aad0fb50fee6cb2b9d2155355c2a7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/freerdp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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

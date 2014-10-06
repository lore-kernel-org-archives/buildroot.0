From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Oct 2014 00:35:07 +0200
Subject: [Buildroot] [PATCH 1/7 v2] pacakge/freerdp: disable building the
	manpages
In-Reply-To: <cover.1412634775.git.yann.morin.1998@free.fr>
References: <cover.1412634775.git.yann.morin.1998@free.fr>
Message-ID: <254a7536ac9a2da6b3b7d2ce7242bbcdcbcd5420.1412634775.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building the manpages requires xsltproc, which might not be available.
Also, who needs the manpages on the target anyway? ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 84c2d81..e272165 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -12,6 +12,8 @@ FREERDP_DEPENDENCIES = openssl zlib \
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
+FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF
+
 ifeq ($(BR2_PACKAGE_CUPS),y)
 FREERDP_CONF_OPTS += -DWITH_CUPS=ON
 FREERDP_DEPENDENCIES += cups
-- 
1.9.1

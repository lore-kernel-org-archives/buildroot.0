From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Jan 2020 19:30:59 +0100
Subject: [Buildroot] [PATCH 2/2] package/gnuradio: fix gr-pager option
In-Reply-To: <20200104183059.2366937-1-fontaine.fabrice@gmail.com>
References: <20200104183059.2366937-1-fontaine.fabrice@gmail.com>
Message-ID: <20200104183059.2366937-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since a very long time (at least version 3.5.1 in 2011 and
https://github.com/gnuradio/gnuradio/commit/accb9f2fe8fd8f6a1e114adac5b15304b0e0012d),
gr-pager option is named ENABLE_GR_PAGER, not ENABLE_PAGER

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuradio/gnuradio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 5b5da56b87..7ee44f26ae 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -133,9 +133,9 @@ GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PAGER),y)
-GNURADIO_CONF_OPTS += -DENABLE_PAGER=ON
+GNURADIO_CONF_OPTS += -DENABLE_GR_PAGER=ON
 else
-GNURADIO_CONF_OPTS += -DENABLE_PAGER=OFF
+GNURADIO_CONF_OPTS += -DENABLE_GR_PAGER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_TRELLIS),y)
-- 
2.24.0

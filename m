From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jan 2020 18:21:46 +0100
Subject: [Buildroot] [git commit] package/gnuradio: fix gr-pager option
Message-ID: <20200109171259.C0B1C88315@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e67a32350c86d81eaf1851df38d7c28219de4f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since a very long time (at least version 3.5.1 in 2011 and
https://github.com/gnuradio/gnuradio/commit/accb9f2fe8fd8f6a1e114adac5b15304b0e0012d),
gr-pager option is named ENABLE_GR_PAGER, not ENABLE_PAGER

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gnuradio/gnuradio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 9a989ad117..f6c3def1e4 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -130,9 +130,9 @@ GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PAGER),y)
-GNURADIO_CONF_OPTS += -DENABLE_PAGER=ON
+GNURADIO_CONF_OPTS += -DENABLE_GR_PAGER=ON
 else
-GNURADIO_CONF_OPTS += -DENABLE_PAGER=OFF
+GNURADIO_CONF_OPTS += -DENABLE_GR_PAGER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_TRELLIS),y)

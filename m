From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Jun 2018 23:10:46 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: remove host-python-cheetah
 dependency
Message-ID: <20180626211046.9026-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python-cheetah has been replaced by host-python-mako:
https://github.com/gnuradio/volk/commit/1b2bedc8685c4dc2b3587068339d69b5ab1c874d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuradio/gnuradio.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 8d8b1f0d4f..0adbb55d34 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -11,10 +11,8 @@ GNURADIO_LICENSE_FILES = COPYING
 
 GNURADIO_SUPPORTS_IN_SOURCE_BUILD = NO
 
-# host-python-cheetah, host-python-mako and host-python-six are needed for volk
-# to compile
+# host-python-mako and host-python-six are needed for volk to compile
 GNURADIO_DEPENDENCIES = \
-	host-python-cheetah \
 	host-python-mako \
 	host-python-six \
 	host-swig \
-- 
2.14.1

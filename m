From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Tue, 22 Oct 2019 13:44:07 +0000
Subject: [Buildroot] [PATCH v2 1/2] package/ofono: remove forced autoreconf
Message-ID: <20191022134341.34426-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch that required an autoreconf is no longer there.

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/ofono/ofono.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index ce05dfcadf..756998687b 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -49,7 +49,5 @@ else
 OFONO_CONF_OPTS += --disable-bluetooth
 endif
 
-# required by 0003-build-Add-check-for-explicit_bzero-support.patch
-OFONO_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.23.0

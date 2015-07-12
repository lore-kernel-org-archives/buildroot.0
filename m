From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 Jul 2015 16:35:29 +0200
Subject: [Buildroot] [PATCH 4/5] mpg123: replace $(shell ...) call with
	$(subst ...)
In-Reply-To: <1436711730-20599-1-git-send-email-arnout@mind.be>
References: <1436711730-20599-1-git-send-email-arnout@mind.be>
Message-ID: <1436711730-20599-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's no reason to use a shell here.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mpg123/mpg123.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index 4c534e2..171cbde 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -69,7 +69,7 @@ MPG123_CONF_OPTS += --with-default-audio=alsa
 MPG123_DEPENDENCIES += alsa-lib
 endif
 
-MPG123_CONF_OPTS += --with-audio=$(shell echo $(MPG123_AUDIO) | tr ' ' ,)
+MPG123_CONF_OPTS += --with-audio=$(subst $(space),$(comma),$(MPG123_AUDIO))
 
 ifeq ($(BR2_PACKAGE_LIBTOOL),y)
 MPG123_DEPENDENCIES += libtool
-- 
2.1.4

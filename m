From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Dec 2017 12:13:44 +0100
Subject: [Buildroot] [PATCH] package/avahi: fix build failures
Message-ID: <20171203111344.8661-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since [1], avahi uses/checks for pygobject instead of pygtk, so update
the configure options accordingly.

Fixes:
  http://autobuild.buildroot.net/results/ffea97dc13d379d32f9e33ae6f9e986b2c435ea9
  and many others

[1] https://github.com/lathiat/avahi/commit/142124dae6f043085aba59fca4657c56b2b23b65

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/avahi/avahi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index b89887b4c7..c8f1af9a9d 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -77,7 +77,7 @@ AVAHI_CONF_OPTS = \
 	--disable-gtk \
 	--disable-gtk3 \
 	--disable-gdbm \
-	--disable-pygtk \
+	--disable-pygobject \
 	--disable-mono \
 	--disable-monodoc \
 	--disable-stack-protector \
-- 
2.15.1

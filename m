From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:06:15 +0200
Subject: [Buildroot] [git commit] package/poppler: fix libcurl support
Message-ID: <20170919195901.AC5407FB28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec574bb3e99d3d6eb82c8224402b8ad72c0d4fe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_POPPLER_LIBCURL is not defined in poppler/Config.in.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Bernd Kuhls &lt;<a href="mailto:bernd.kuhls@t-online.de">bernd.kuhls at t-online.de</a>&gt;<br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/poppler/poppler.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 6796437..1beb75a 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -66,7 +66,7 @@ else
 POPPLER_CONF_OPTS += --disable-zlib
 endif
 
-ifeq ($(BR2_PACKAGE_POPPLER_LIBCURL),y)
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
 POPPLER_CONF_OPTS += --enable-libcurl
 POPPLER_DEPENDENCIES += libcurl
 else

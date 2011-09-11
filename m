From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] mpg123: remove --program-prefix
Message-ID: <20110912052632.2081D8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9268aff0e6cfa74b3946b947d258c33d2751242a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpg123/mpg123.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 8eeb56d..43f631c 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -32,7 +32,7 @@ ifeq ($(BR2_x86_64),y)
 MPG123_CPU = x86-64
 endif
 
-MPG123_CONF_OPT += --program-prefix='' --with-cpu=$(MPG123_CPU)
+MPG123_CONF_OPT += --with-cpu=$(MPG123_CPU)
 
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
-- 
1.7.3.4

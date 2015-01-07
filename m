From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 22:36:44 +0100
Subject: [Buildroot] [git commit] package/git: fix dependency against curl
Message-ID: <20150107213703.9942E807EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53f5e83c8710d8223028f36df417c73b94aac8b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our curl package is really named libcurl.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/git/git.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 57737f2..face062 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -26,7 +26,7 @@ else
 endif
 
 ifeq ($(BR2_PACKAGE_CURL),y)
-	GIT_DEPENDENCIES += curl
+	GIT_DEPENDENCIES += libcurl
 	GIT_CONF_OPTS += --with-curl
 else
 	GIT_CONF_OPTS += --without-curl

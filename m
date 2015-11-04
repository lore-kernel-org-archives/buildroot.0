From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 14:44:43 +0100
Subject: [Buildroot] [git commit] git: fix config option used to detect
	libcurl availability
Message-ID: <20151104134620.25B2C81EC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=986bbee1ff9d5c95c68caa19a0f7459391f81fbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_CURL is currently used by the git package to find out if
libcurl is available. While indeed BR2_PACKAGE_CURL indicates that
libcurl is available, it is not the most appropriate option for this:
BR2_PACKAGE_LIBCURL is better. BR2_PACKAGE_LIBCURL indicates that
libcurl is available, while BR2_PACKAGE_CURL indicates that both
libcurl and the curl program are available. Only the former is needed
by Git.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/git/git.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 2bd6a01..54f7fbf 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -26,7 +26,7 @@ else
 GIT_CONF_OPTS += --without-libpcre
 endif
 
-ifeq ($(BR2_PACKAGE_CURL),y)
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
 GIT_DEPENDENCIES += libcurl
 GIT_CONF_OPTS += --with-curl
 else

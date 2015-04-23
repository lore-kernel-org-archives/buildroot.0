From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 22:59:05 +0200
Subject: [Buildroot] [git commit] libcurl: disable curldebug
Message-ID: <20150423205915.DD462800E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63b1fa81ec0bee74d459cfec487045db48408e4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

curldebug is a more advanced form of debugging for curl which audits
source code with the checksource.pl tool, and treats warnings as errors.
Normally users won't want/need this so disable it since it leads to
failed builds when debug info is enabled (which is what people normally
want).
When buildroot does --enable-debug curl inherently enables curldebug too.

Solves bug #8041.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcurl/libcurl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index acb2b42..3390399 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -20,7 +20,7 @@ LIBCURL_INSTALL_STAGING = YES
 # probably almost never used. See
 # http://curl.haxx.se/docs/manpage.html#--ntlm.
 LIBCURL_CONF_OPTS = --disable-verbose --disable-manual --disable-ntlm-wb \
-	--enable-hidden-symbols --with-random=/dev/urandom
+	--enable-hidden-symbols --with-random=/dev/urandom --disable-curldebug
 LIBCURL_CONFIG_SCRIPTS = curl-config
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)

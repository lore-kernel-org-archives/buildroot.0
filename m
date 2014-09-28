From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 21:53:39 +0200
Subject: [Buildroot] [git commit] package/libcurl: Remove autoreconf
Message-ID: <20140928195515.411929D535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48849055b9ca8075bc7093cb08a88e472e1dd14c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch
was removed the corresponding autoreconf was left behind:
http://git.buildroot.net/buildroot/commit/?id=9185b64ed5599622cb89ca4ee6ee29440b02ec8a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 610efc1..74584a6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -14,8 +14,6 @@ LIBCURL_DEPENDENCIES = host-pkgconf \
 LIBCURL_LICENSE = ICS
 LIBCURL_LICENSE_FILES = COPYING
 LIBCURL_INSTALL_STAGING = YES
-# For libcurl-0001-build-link-curl-to-NSS-libraries-when-NSS-support.patch
-LIBCURL_AUTORECONF = YES
 
 # We disable NTLM support because it uses fork(), which doesn't work
 # on non-MMU platforms. Moreover, this authentication method is

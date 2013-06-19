From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Jun 2013 23:56:41 +0200
Subject: [Buildroot] [git commit] wvstreams: needs host-pkgconf
Message-ID: <20130619220719.DD7D69AF78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b03e04f3df86e1f2e6e136c5a536c516e2374807
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The wvstreams configure script uses pkg-config, so we need to build
host-pkgconf before.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wvstreams/wvstreams.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
index 13982c4..d363f4c 100644
--- a/package/wvstreams/wvstreams.mk
+++ b/package/wvstreams/wvstreams.mk
@@ -6,7 +6,7 @@
 
 WVSTREAMS_VERSION = 4.6.1
 WVSTREAMS_SITE = http://wvstreams.googlecode.com/files
-WVSTREAMS_DEPENDENCIES = openssl zlib
+WVSTREAMS_DEPENDENCIES = openssl zlib host-pkgconf
 WVSTREAMS_INSTALL_STAGING = YES
 
 WVSTREAMS_LICENSE = LGPLv2+

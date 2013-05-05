From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 23:00:53 +0200
Subject: [Buildroot] [git commit] openswan: fix OCF support detection
Message-ID: <20130505210148.5B6CE99B60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad099ccf67a094d057cb38be8132167fd50e15ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the openssl OCFs option is gone we need to switch to the package
option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openswan/openswan.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 153d659..6b7dc05 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -22,7 +22,7 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	OPENSWAN_DEPENDENCIES += openssl
 	OPENSWAN_MAKE_OPT += HAVE_OPENSSL=true
-ifeq ($(BR2_PACKAGE_OPENSSL_OCF),y)
+ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
 	OPENSWAN_MAKE_OPT += HAVE_OCF=true
 endif
 endif

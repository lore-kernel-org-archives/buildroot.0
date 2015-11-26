From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:30:22 +0100
Subject: [Buildroot] [git commit] jimtcl: fix broken symlinks
Message-ID: <20151126213423.2B2CD81F6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba60acfc58f644f4d77c70b8913acf59bff20ba7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The created symlinks are wrong.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jimtcl/jimtcl.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index e79e0f6..4afb217 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -33,8 +33,8 @@ else
 JIMTCL_SHARED = --shared
 define JIMTCL_INSTALL_LIB
 	$(INSTALL) -m 0755 -D $(@D)/libjim.so.$(JIMTCL_VERSION) \
-		$(1)/usr/lib/libjim.$(JIMTCL_VERSION)
-	ln -s libjim.$(JIMTCL_VERSION) $(1)/usr/lib/libjim.so
+		$(1)/usr/lib/libjim.so.$(JIMTCL_VERSION)
+	ln -sf libjim.so.$(JIMTCL_VERSION) $(1)/usr/lib/libjim.so
 endef
 endif
 

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:52:36 +0200
Subject: [Buildroot] [git commit] lzip: use $(TARGET_MAKE_ENV) for configure
	as well
Message-ID: <20161029135923.5C35F817EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3f9a860c09728edbc7a6cb5f03841092535ff59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzip/lzip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index ecf70a3..8180fd0 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -10,7 +10,7 @@ LZIP_LICENSE = GPLv3+
 LZIP_LICENSE_FILES = COPYING
 
 define LZIP_CONFIGURE_CMDS
-	(cd $(@D); ./configure --prefix=/usr \
+	(cd $(@D); $(TARGET_MAKE_ENV) ./configure --prefix=/usr \
 		$(TARGET_CONFIGURE_OPTS) )
 endef
 

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Jan 2012 17:58:22 +0100
Subject: [Buildroot] [git commit] boost: fix build with ccache
Message-ID: <20120130170026.1C4989094D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4aadcac1684e4af54baa7e42b5e0fb73aa4b33b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop quotes around TARGET_CXX as the boost buildsystem does handle
spaces in the compiler command name, but treats it as a single command
(and errors out) if quotes are used and ccache enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boost/boost.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 4bbc869..4577f2d 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -52,7 +52,7 @@ BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPERATED), --without-libraries=$
 
 define BOOST_CONFIGURE_CMDS
 	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
-	echo "using gcc : $(TARGET_CC_VERSION) : \"$(TARGET_CXX)\" : <cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
+	echo "using gcc : $(TARGET_CC_VERSION) : $(TARGET_CXX) : <cxxflags>\"$(TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
 	echo "" >> $(@D)/user-config.jam
 endef
 

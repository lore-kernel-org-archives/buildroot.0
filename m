From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 10:43:52 +0200
Subject: [Buildroot] [git commit] openssh: fix static compilation
Message-ID: <20150829084942.5928380DBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7bc51f85ae35cf6d60e1622a0df5bf03ae494e39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PIE and static doesn't work on Linux.

Fixes:
http://autobuild.buildroot.net/results/dce/dce0202e039f4636d68532c4aab8738938b76650/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssh/openssh.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index b95914b..fb5779e 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -26,6 +26,10 @@ endef
 ifeq ($(BR2_arc),y)
 OPENSSH_CONF_OPTS += --without-pie
 endif
+# PIE and static does not work on Linux
+ifeq ($(BR2_STATIC_LIBS),y)
+OPENSSH_CONF_OPTS += --without-pie
+endif
 
 OPENSSH_DEPENDENCIES = zlib openssl
 

From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Dec 2014 23:12:51 +0100
Subject: [Buildroot] [git commit] erlang: fix typo in dependencies
Message-ID: <20141218221431.095B0804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3254d06c53e907bbd0cf08a19b1d510e8595ea5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If libatomic_ops was enabled, then the host-erlang dependency was lost.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/erlang/erlang.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index dd15539..0b8619e 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -23,7 +23,7 @@ ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
 ERLANG_CONF_OPTS = --without-javac
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
-ERLANG_DEPENDENCIES = libatomic_ops
+ERLANG_DEPENDENCIES += libatomic_ops
 ERLANG_CONF_OPTS += --with-libatomic_ops=$(STAGING_DIR)/usr
 endif
 

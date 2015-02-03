From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:22:51 +0100
Subject: [Buildroot] [git commit] package/erlang: export EI_VSN so other
	packages can use it
Message-ID: <20150203092417.789FE80E25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c1d128844c5a853853049ede5961c6495618dde
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Packages that depend on Erlang may need the Erlang Interface Version
(aka EI_VSN), so just export it.

We do export a static value instead of looking in the file, to avoid
spawning a shell every time the variable is dereferenced.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[johan.oudinet at gmail.com: update EI_VSN since the erlang update]
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang/erlang.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 81ac436..0c76531 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# See note below when updating Erlang
 ERLANG_VERSION = 17.4
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
@@ -16,6 +17,10 @@ ERLANG_INSTALL_STAGING = YES
 # Touching erts/configure.in
 ERLANG_AUTORECONF = YES
 
+# Whenever updating Erlang, this value should be updated as well, to the
+# value of EI_VSN in the file lib/erl_interface/vsn.mk
+ERLANG_EI_VSN = 3.7.20
+
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
 

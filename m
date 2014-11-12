From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:25:54 +0100
Subject: [Buildroot] [PATCH 08/24 v3] package/erlang: export EI_VSN so other
	packages can use it
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <a84bacc066e9efd2cd913ace4f6d777d642ebc4a.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages that depend on Erlang may need the Erlang Interface Version
(aka EI_VSN), so just export it.

We do export a static value instead of looking in the file, to avoid
spawning a shell every time the variable is dereferenced.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang/erlang.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index e6899de..f4687e4 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# See note below when updating Erlang
 ERLANG_VERSION = 17.3
 ERLANG_SITE = http://www.erlang.org/download
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
@@ -13,6 +14,10 @@ ERLANG_LICENSE = EPL
 ERLANG_LICENSE_FILES = EPLICENCE
 ERLANG_INSTALL_STAGING = YES
 
+# Whenever updating Erlang, this value should be updated as well, to the
+# value of EI_VSN in the file lib/erl_interface/vsn.mk
+ERLANG_EI_VSN = 3.7.18
+
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
 
-- 
1.9.1

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 10 Sep 2013 09:23:25 +0200
Subject: [Buildroot] [git commit] erlang: install to staging
Message-ID: <20130910200702.75DB59B6AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fef61fb4681add1f57c3ea6295c7d4f7ec973998
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is required to build custom port drivers/NIFs or code that
uses erl_interface.

Signed-off-by: Hans Bulfone <hans@nil.at>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/erlang/erlang.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 9f47b84..89104c9 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -12,6 +12,7 @@ HOST_ERLANG_DEPENDENCIES =
 
 ERLANG_LICENSE = EPL
 ERLANG_LICENSE_FILES = EPLICENCE
+ERLANG_INSTALL_STAGING = YES
 
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes

From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Feb 2015 23:21:01 +0100
Subject: [Buildroot] [git commit] pkg-rebar: add bin to list of install
	directories
Message-ID: <20150218222259.4DB247FEAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7af66e505359ce3b89f18d263c7e949522287816
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some Erlang packages provide a bin directory for programs that are to be
invoked from the command line. An example of such a package is the Lisp
Flavored Erlang compiler. The Erlang OTP library includes several more
examples (it doesn't use rebar, though.) This change makes sure that the
bin directory gets installed too.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-rebar.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index 57fb2f4..45d1c7d 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -43,7 +43,7 @@ REBAR_TARGET_DEPS_ENV = \
 
 # Install an Erlang application from $(@D).
 #
-# i.e., define a recipe that installs the "ebin priv $(2)" directories
+# i.e., define a recipe that installs the "bin ebin priv $(2)" directories
 # from $(@D) to $(1)$($(PKG)_ERLANG_LIBDIR).
 #
 #  argument 1 should typically be $(HOST_DIR), $(TARGET_DIR),
@@ -57,7 +57,7 @@ REBAR_TARGET_DEPS_ENV = \
 #
 define install-erlang-directories
 	$(INSTALL) -d $(1)/$($(PKG)_ERLANG_LIBDIR)
-	for dir in ebin priv $(2); do                                   \
+	for dir in bin ebin priv $(2); do                               \
 		if test -d $(@D)/$$dir; then                            \
 			cp -r $(@D)/$$dir $(1)$($(PKG)_ERLANG_LIBDIR);  \
 		fi;                                                     \

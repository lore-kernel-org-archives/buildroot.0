From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:24:17 +0100
Subject: [Buildroot] [git commit] package/pkg-rebar.mk: change semantic of
 <PKG>_KEEP_DEPENDENCIES
Message-ID: <20181209162058.B31E0883A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b28acb6861c1940ff0a20013820012af58177fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set it to NO by default and check if it is equal to NO. This is to
be more consistent with other boolean variables in Buildroot.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-rebar.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index 838e7681de..e4e3f3bb6c 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -234,9 +234,11 @@ $(2)_REBAR = rebar
 $(2)_DEPENDENCIES += host-erlang-rebar
 endif
 
+$(2)_KEEP_DEPENDENCIES ?= NO
+
 # Remove dependencies listed in rebar.config unless the package says
 # otherwise
-ifeq ($$($(2)_KEEP_DEPENDENCIES),)
+ifeq ($$($(2)_KEEP_DEPENDENCIES),NO)
 $(2)_POST_PATCH_HOOKS += remove-rebar-config-dependencies
 endif
 

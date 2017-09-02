From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:46 -0000
Subject: [Buildroot] [git commit] package/erlang-jiffy: bump version to
	0.14.11
Message-ID: <20170902130616.CE178818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c11a8e3cac58585577a83e134549c0305168d5a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed ERLANG_JIFFY_SET_VERSION_HOOK, not needed anymore after
https://github.com/davisp/jiffy/commit/d596d890bcc7d74d34d185854873ba678bbf237b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 1f83e27..4a201fe 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7d1054c475c82c626de3ad57201a7fc51da38667c8a7502149eb751edc6b601d erlang-jiffy-0.14.8.tar.gz
+sha256 c555726f592b79894c253ca1dc3c3aec6a5697271d29364d57f8175f387b86f3 erlang-jiffy-0.14.11.tar.gz
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index 3139454..9a688f7 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,17 +4,11 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 0.14.8
+ERLANG_JIFFY_VERSION = 0.14.11
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (Google double conversion library), \
 	BSD-3-Clause (tests)
 ERLANG_JIFFY_LICENSE_FILES = LICENSE
 
-# Set version manually in jiffy.app.src otherwise "git describe" is used.
-define ERLANG_JIFFY_SET_VERSION_HOOK
-	$(SED) 's/{vsn, git}/{vsn, "$(ERLANG_JIFFY_VERSION)"}/' $(@D)/src/jiffy.app.src
-endef
-ERLANG_JIFFY_POST_PATCH_HOOKS = ERLANG_JIFFY_SET_VERSION_HOOK
-
 $(eval $(rebar-package))

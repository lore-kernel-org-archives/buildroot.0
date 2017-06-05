From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:35:45 +0200
Subject: [Buildroot] [git commit] package/erlang-jiffy: set version in
	jiffy.app.src
Message-ID: <20170605093711.75D2482A12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=997b54aaad18f41a45db750f079703dd38647df1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/5c0/5c045a517ccdc97244a4cfca54465dc8d5fcc717

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-jiffy/erlang-jiffy.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index 674c80f..3139454 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -11,4 +11,10 @@ ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (tests)
 ERLANG_JIFFY_LICENSE_FILES = LICENSE
 
+# Set version manually in jiffy.app.src otherwise "git describe" is used.
+define ERLANG_JIFFY_SET_VERSION_HOOK
+	$(SED) 's/{vsn, git}/{vsn, "$(ERLANG_JIFFY_VERSION)"}/' $(@D)/src/jiffy.app.src
+endef
+ERLANG_JIFFY_POST_PATCH_HOOKS = ERLANG_JIFFY_SET_VERSION_HOOK
+
 $(eval $(rebar-package))

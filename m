From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 13:38:41 +0200
Subject: [Buildroot] [git commit] package-infra: comment why all checks are
	done in pkg-generic
Message-ID: <20141005113901.5396B9D66E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5401ccaf6d06f3140df45f70cd9746de7f870125
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix duplicate -> duplicating.]

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ec8afdd..f09f83e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -702,7 +702,11 @@ $$(foreach pkg,$$($(2)_PROVIDES),\
 	$$(eval $$(call virt-provides-single,$$(pkg),$$(call UPPERCASE,$$(pkg)),$(1))$$(sep)))
 endif
 
-# Ensure unified variable name conventions between all packages
+# Ensure unified variable name conventions between all packages Some
+# of the variables are used by more than one infrastructure; so,
+# rather than duplicating the checks in each infrastructure, we check
+# all variables here in pkg-generic, even though pkg-generic should
+# have no knowledge of infra-specific variables.
 $(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_OPT,$(2)_INSTALL_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))

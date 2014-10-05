From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Oct 2014 11:35:14 +0200
Subject: [Buildroot] [PATCH] package-infra: comment why all checks are done
	in pkg-generic
Message-ID: <1412501714-1823-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

---
Note: this goes hand-in-hand with, but does not depend on, the previous
patch from Thomas DS: http://patchwork.ozlabs.org/patch/396613/
But it replaces: http://patchwork.ozlabs.org/patch/396614/
---
 package/pkg-generic.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3e1eefa..598c0c0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -703,6 +703,10 @@ $$(foreach pkg,$$($(2)_PROVIDES),\
 endif
 
 # Ensure unified variable name conventions between all packages
+# Some of the variables are used by more than one infrastructure; so, rather
+# than duplicate the checks in each infrastructure, we check all variables
+# here in pkg-generic, even though pkg-generic should have no knowledge of
+# infra-specific variables.
 $(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_OPT,$(2)_INSTALL_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))
-- 
1.9.1

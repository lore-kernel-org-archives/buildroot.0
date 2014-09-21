From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:57:30 +0200
Subject: [Buildroot] [git commit] pkg-infra: put optional step_user def and
	assignment in one block
Message-ID: <20140921205736.1F5789D739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae69eadaa7b98fb73cbc5dcf8454e54a5189dd9b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d04fd36..4b6d818 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -56,11 +56,11 @@ endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_time
 
 # User-supplied script
+ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
 define step_user
 	@$(foreach user_hook, $(BR2_INSTRUMENTATION_SCRIPTS), \
 		$(EXTRA_ENV) $(user_hook) "$(1)" "$(2)" "$(3)"$(sep))
 endef
-ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
 GLOBAL_INSTRUMENTATION_HOOKS += step_user
 endif
 

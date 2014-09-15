From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 14 Sep 2014 21:31:11 -0400
Subject: [Buildroot] [PATCH v2 1/2] pkg-infra: put optional step_user def
	and assignment in one block
Message-ID: <1410744672-32698-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---

Like the manual says in 'The .mk file' section ...

Changes v1 -> v2
- Add acked-by
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
1.9.1

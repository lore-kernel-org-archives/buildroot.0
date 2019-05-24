From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 May 2019 21:53:24 +0200
Subject: [Buildroot] [git commit] package/glibmm: use GLIBMM_CXXFLAGS
Message-ID: <20190524194824.68C9A8DF55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72e0ff66e7be8cebfb79c1cbcab168ae1d843a61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8d8d4ecaf1bc22a89d0f373e9d1655f59f283480 ("package/glibmm: work
around gcc bug 85180") was incorrect reworked by me, and
TARGET_CXXFLAGS was used instead of GLIBMM_CXXFLAGS, causing the
Microblaze workaround to be ineffective. This new commit fixes this
typo.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibmm/glibmm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index a0abb7a49d..e66d56eac9 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -19,6 +19,6 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 GLIBMM_CXXFLAGS += -O0
 endif
 
-GLIBMM_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS)"
+GLIBMM_CONF_ENV += CXXFLAGS="$(GLIBMM_CXXFLAGS)"
 
 $(eval $(autotools-package))

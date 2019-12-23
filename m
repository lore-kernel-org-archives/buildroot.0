From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 23:12:14 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/kf5-kcoreaddons:
 fix check-package warnings
Message-ID: <20191223220621.874A98E0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b227eaa3f083c531a4d8842e6b25b6dc31c5f95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

KF5_KCOREADDONS_CONF_OPTS is set both outside and inside the
conditional block, so the value set outside would be lost if
the condition were to be true.

Use append-assignement in this case, as reported by check-package.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f7e750e8f514f84bf2f4fc99976dd11f19c8ecbc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
index 5b3e9acd90..76be8876cc 100644
--- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
@@ -23,7 +23,7 @@ KF5_KCOREADDONS_CONF_OPTS = -DCMAKE_CXX_FLAGS="$(KF5_KCOREADDONS_CXXFLAGS)"
 
 ifeq ($(BR2_microblaze),y)
 # Microblaze ld emits warnings, make warnings not to be treated as errors
-KF5_KCOREADDONS_CONF_OPTS = -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
+KF5_KCOREADDONS_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--no-fatal-warnings"
 endif
 
 $(eval $(cmake-package))

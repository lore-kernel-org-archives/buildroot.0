From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:39:52 +0200
Subject: [Buildroot] [git commit] package/qt5: use BR2_ENABLE_RUNTIME_DEBUG
 iso BR2_ENABLE_DEBUG
Message-ID: <20210607144658.C6A3A814BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a93b467427a017f57dd4bc0823759c39c5365a35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_ENABLE_DEBUG should just steer the availability of debug symbols and
should have no negative effect on performance.

Introduction of 'assert' statements, 'debug'-type builds with additional
logging, etc. should be steered by BR2_ENABLE_RUNTIME_DEBUG instead.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/qt5/qt5base/qt5base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 84e9fa4edb..8b55aa3098 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -86,7 +86,7 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-gbm
 endif
 
-ifeq ($(BR2_ENABLE_DEBUG),y)
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
 QT5BASE_CONFIGURE_OPTS += -debug
 else
 QT5BASE_CONFIGURE_OPTS += -release

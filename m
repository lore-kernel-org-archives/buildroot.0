From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 21:30:49 +0100
Subject: [Buildroot] [git commit] package/dvb-apps: fix build with some perl
 version
Message-ID: <20171127202545.15D1E81489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8234d440024719e4df61f583b26302162dc363f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

perl can't find a module that is located in the current directory,
so help it locate it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dvb-apps/dvb-apps.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 8ba1501..8aa4a29 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -15,6 +15,8 @@ DVB_APPS_DEPENDENCIES = libiconv
 DVB_APPS_LDLIBS += -liconv
 endif
 
+DVB_APPS_MAKE_OPTS = PERL5LIB=$(@D)/util/scan
+
 ifeq ($(BR2_STATIC_LIBS),y)
 DVB_APPS_MAKE_OPTS += enable_shared=no
 else ifeq ($(BR2_SHARED_LIBS),y)

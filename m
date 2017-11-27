From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 11:48:54 +0100
Subject: [Buildroot] [PATCH 1/3] package/dvb-apps: fix build with some perl
 version
In-Reply-To: <cover.1511779719.git.yann.morin.1998@free.fr>
References: <cover.1511779719.git.yann.morin.1998@free.fr>
Message-ID: <3756298044e002e93aa851a58b8337e6f676c91a.1511779719.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perl can't find a module that is located in the current directory,
so help it locate it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad@gadz.org>

---
Note: I have no idea why perl on my machine does not find that file,
while it does on all the autobuilders so far... I just assume that this
is a perl version issue, but I may very well be wrong. Fran?ois ?
---
 package/dvb-apps/dvb-apps.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 8ba1501d5c..8aa4a29307 100644
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
-- 
2.11.0

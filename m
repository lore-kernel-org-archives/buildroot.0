From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Dec 2012 12:41:35 +0100
Subject: [Buildroot] [PATCH] package/dvb-apps: fix downloading
Message-ID: <1356954095-21337-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we're using the sources from the Mercurial repository, and Buildroot
does support retrieving from a Mercurial repository, there is no need
to try (and fail1) getting the archive from the Mercurial built-in
tarball mechanism.

(Note: I was beaten by this because I had a cached copy locally, left
after the previous tvheadend-vampirises-files-from-toher-packages attempt,
that I forgot to delete before testing. Ouch...)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dvb-apps/dvb-apps.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 721fbf0..5db8148 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -5,8 +5,8 @@
 #############################################################
 
 DVB_APPS_VERSION        = 3fc7dfa68484
-DVB_APPS_SOURCE         = dvb-apps-$(DVB_APPS_VERSION).tar.bz2
-DVB_APPS_SITE           = http://linuxtv.org/hg/dvb-apps/archive/
+DVB_APPS_SITE           = http://linuxtv.org/hg/dvb-apps
+DVB_APPS_SITE_METHOD    = hg
 
 # We just install the transponders data. As this is not a 'work' as per
 # traditional copyright, but just a collection of 'facts', there's probably
-- 
1.7.2.5

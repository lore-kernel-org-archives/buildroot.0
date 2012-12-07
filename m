From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  7 Dec 2012 08:38:07 +0100
Subject: [Buildroot] [PATCH] perl: refactor configure step,
Message-ID: <1354865887-6720-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

after discussion with Perl-Cross's author (Alex Suykov)

Note: Using -A with variables that aren't option lists makes little sense.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index a86ee2a..da54ef1 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -57,12 +57,12 @@ PERL_CONF_OPT = \
 	-Dld="$(TARGET_CC_NOCCACHE)" \
 	-Dccflags="$(TARGET_CFLAGS)" \
 	-Dldflags="$(TARGET_LDFLAGS) -lm" \
-	-A define:mydomain="" \
-	-A define:myhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
-	-A define:myuname="Buildroot $(BR2_VERSION_FULL)" \
-	-A define:osname=linux \
-	-A define:osvers=$(LINUX_VERSION) \
-	-A define:perladmin=root
+	-Dmydomain="" \
+	-Dmyhostname="$(BR2_TARGET_GENERIC_HOSTNAME)" \
+	-Dmyuname="Buildroot $(BR2_VERSION_FULL)" \
+	-Dosname=linux \
+	-Dosvers=$(LINUX_VERSION) \
+	-Dperladmin=root
 
 ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
     PERL_CONF_OPT += -Dusedevel
-- 
1.7.9.5

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 01:09:16 +0100
Subject: [Buildroot] [git commit] perl: refactor configure step
Message-ID: <20121216001446.D8A0B9A02E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efddfcbe6dc531145fe3f4d7a39818e8e27d77b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After discussion with Perl-Cross's author (Alex Suykov)

Note: Using -A with variables that aren't option lists makes little sense.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/perl/perl.mk |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

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

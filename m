From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 15 Aug 2012 16:38:27 +0200
Subject: [Buildroot] [PATCH 05/12] microperl: fix perl -V
In-Reply-To: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
References: <1345041514-31539-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1345041514-31539-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/microperl/microperl.mk |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index 595e1fa..4229a2f 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -17,12 +17,11 @@ MICROPERL_MODS = $(call qstrip,$(BR2_PACKAGE_MICROPERL_MODULES))
 
 # Minimal set of modules required for 'perl -V' to work
 MICROPERL_ARCH_MODS = Config.pm Config_git.pl Config_heavy.pl
-MICROPERL_BASE_MODS = strict.pm
+MICROPERL_BASE_MODS = strict.pm vars.pm warnings.pm warnings/register.pm
 
 # CGI bundle
 ifeq ($(BR2_PACKAGE_MICROPERL_BUNDLE_CGI),y)
-MICROPERL_MODS += constant.pm CGI CGI.pm Carp.pm Exporter.pm overload.pm \
-	vars.pm warnings.pm warnings/register.pm
+MICROPERL_MODS += constant.pm CGI CGI.pm Carp.pm Exporter.pm overload.pm
 endif
 
 # Host microperl is actually full-blown perl
-- 
1.7.9.5

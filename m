From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 18 Mar 2014 19:59:59 +0100
Subject: [Buildroot] [PATCH] pkg-perl: prevents the interactive prompts
Message-ID: <1395169199-31890-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

during configure and build steps of Perl/CPAN package.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-perl.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index fdf1580..b5fada1 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -19,6 +19,9 @@
 #
 ################################################################################
 
+# prevents the interactive prompts
+export PERL_MM_USE_DEFAULT=1
+
 PERL_ARCHNAME	= $(ARCH)-linux
 
 ################################################################################
-- 
1.7.9.5

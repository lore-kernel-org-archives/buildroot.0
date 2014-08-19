From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Aug 2014 20:07:17 +0200
Subject: [Buildroot] [PATCH 5/6] intltool: refactor with host-perl
In-Reply-To: <1408471638-4551-1-git-send-email-francois.perrad@gadz.org>
References: <1408471638-4551-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1408471638-4551-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/intltool/intltool.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 5c2dca8..96333ae 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -11,5 +11,7 @@ INTLTOOL_LICENSE_FILES = COPYING
 
 HOST_INTLTOOL_DEPENDENCIES = host-gettext host-perl-xml-parser
 
+HOST_INTLTOOL_CONF_ENV = PERL=$(PERL_RUN)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.9.1

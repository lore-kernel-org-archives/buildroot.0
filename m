From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed,  7 Oct 2009 22:08:34 +0200
Subject: [Buildroot] [PATCH 11/14] disable-locale implies turning off locale
	and iconv
In-Reply-To: <f77d7f5dd82b8b3945e77fd9351619fa260cff98.1254945750.git.rep.dot.nop@gmail.com>
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
	<8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<a576ef52cd1f156525fd2d327f1e7da466257be2.1254945750.git.rep.dot.nop@gmail.com>
	<df7563b3e1a87daa6f42ade2c505fecc014aa2a2.1254945750.git.rep.dot.nop@gmail.com>
	<382fdbb8e5e36dd9348dfd57b9267862ef8d2ead.1254945750.git.rep.dot.nop@gmail.com>
	<53e08690da5a307328d4d5dc7d53865215ced09f.1254945750.git.rep.dot.nop@gmail.com>
	<b01a751a32bbd1ac0bb43898ed65a6c7afd9e0c7.1254945750.git.rep.dot.nop@gmail.com>
	<ec988dfe40afe8381a2263eeaae1bd2f8ffd9014.1254945750.git.rep.dot.nop@gmail.com>
	<f77d7f5dd82b8b3945e77fd9351619fa260cff98.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <d97ecb658b37edf74a168fa361436b5be821395c.1254945750.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Also pass --disable-locale and --disable-iconv to autoconfigured
  packages (like rsync) if locales are turned off.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index a69ea44..0a70ab4 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -303,7 +303,7 @@ TARGET_CONFIGURE_ARGS= \
 ifeq ($(BR2_ENABLE_LOCALE),y)
 DISABLE_NLS:=
 else
-DISABLE_NLS:=--disable-nls
+DISABLE_NLS:=--disable-nls --disable-locale --disable-iconv
 endif
 
 ifneq ($(BR2_LARGEFILE),y)
-- 
1.6.3.3

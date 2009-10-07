From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed,  7 Oct 2009 22:08:36 +0200
Subject: [Buildroot] [PATCH 13/14] enable config.cache per default
In-Reply-To: <730af4752b8da4a9b2a2b1583987899fa3eef334.1254945750.git.rep.dot.nop@gmail.com>
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
	<d97ecb658b37edf74a168fa361436b5be821395c.1254945750.git.rep.dot.nop@gmail.com>
	<730af4752b8da4a9b2a2b1583987899fa3eef334.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <78b8984e033470578a90d58e533aa97c31af1071.1254945750.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  It speeds up configuration considerably.
  If a package breaks due to wrong cache-entries, then the broken
  other package has to be fixed, not the innocent bystander!

  Put short: There is absolutely _no_ need to ever turn the cache off
  unless you hack on autotools itself and goof.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index ca6b298..1201279 100644
--- a/Config.in
+++ b/Config.in
@@ -160,6 +160,7 @@ config BR2_RECENT
 
 config BR2_CONFIG_CACHE
 	bool "Use a central configure cache file"
+	default y
 	help
 	  This determines if a central config cache is used by
 	  packages, reducing the configure time for packages as each
-- 
1.6.3.3

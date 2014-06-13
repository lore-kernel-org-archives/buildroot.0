From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jun 2014 09:46:27 +0200
Subject: [Buildroot] [git commit] cosmo: disable package until upstream site
	is fixed
Message-ID: <20140613074653.EE12699EBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=acaaed7d70b1d624859d04290beff66d680e3ab0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/1ca/1ca98e95b106a948f1c0d0153a290ae1d9adb76d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cosmo/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/cosmo/Config.in b/package/cosmo/Config.in
index cf5e123..869a107 100644
--- a/package/cosmo/Config.in
+++ b/package/cosmo/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_COSMO
 	bool "cosmo"
 	# run-time dependency
 	select BR2_PACKAGE_LPEG
+	# upstream site does not provide a valid archive
+	depends on BROKEN
 	help
 	  Cosmo is a "safe templates" engine for Lua.
 

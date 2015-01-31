From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Jan 2015 23:17:42 +0100
Subject: [Buildroot] [git commit] package/openldap: needs MMU
Message-ID: <20150131222039.C3C218046F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5666a72da31e1ab22f16af8bc8e70c172ce7598
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openldap uses fork(), so needs an MMU.

Fixes:
    http://autobuild.buildroot.org/results/8a7/8a72aef6525da27b92235b918b6d41ad1c7fac09/
    http://autobuild.buildroot.org/results/1ce/1ce0ac525217fc5308ea510c997c7ac59e69bc4c/
    http://autobuild.buildroot.org/results/0eb/0eb180f77d5b70886e062ada1be133916ac97c31/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openldap/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/openldap/Config.in b/package/openldap/Config.in
index be2cbdc..1f0b1ea 100644
--- a/package/openldap/Config.in
+++ b/package/openldap/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENLDAP
 	bool "openldap"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # needs fork()
 	help
 	  OpenLDAP Software is an open source implementation of
 	  the Lightweight Directory Access Protocol.
@@ -10,4 +11,5 @@ config BR2_PACKAGE_OPENLDAP
 	  http://www.openldap.org/
 
 comment "openldap needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU # needs fork()
 	depends on !BR2_USE_WCHAR

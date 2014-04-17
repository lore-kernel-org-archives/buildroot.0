From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:50:30 +0200
Subject: [Buildroot] [git commit] zmqpp: exclude old Sourcery PowerPC
	toolchains that don't have C++0x
Message-ID: <20140417215155.939779C845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7a31657938f83f8a5f9261960e2809ad13e51d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zmqpp needs some fairly advanced C++0x features, which apparently
aren't all available in gcc 4.5 used in PowerPC Sourcery 2011.03. So
this commit excludes both this toolchain and the older 2010.09 one.

Fixes:

  http://autobuild.buildroot.org/results/a37/a374e85c714aff26bceaa0df4199bc44a1278f37/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zmqpp/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 68dbf4e..2ccaf7e 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_ZMQPP
 	bool "zmqpp"
 	depends on !BR2_avr32 # compiler needs c++0x support
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # c++0x support
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # c++0x support
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_LARGEFILE # util-linux

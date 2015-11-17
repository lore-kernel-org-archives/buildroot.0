From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 21:18:52 +0100
Subject: [Buildroot] [git commit] liquid-dsp: blacklist CS powerpc toolchains
Message-ID: <20151117201908.3523881D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6cd634fa66266dc0b46f758cb3d8e5b66bb7ce1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They're unable to build liquid-dsp successfully resulting in an internal
compiler error. Fixes:
http://autobuild.buildroot.net/results/2ac/2acd745f4e5ec6edfd09afcd57b9ece216724c1b/

[Thomas: propagate the dependencies to the comment.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liquid-dsp/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
index 95233da..39cd342 100644
--- a/package/liquid-dsp/Config.in
+++ b/package/liquid-dsp/Config.in
@@ -1,10 +1,15 @@
 comment "liquid-dsp requires a (e)glibc/musl toolchain w/ dynamic library"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LIQUID_DSP
 	bool "liquid-dsp"
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on !BR2_STATIC_LIBS
+	# These result in internal compiler error
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	help
 	  Liquid-DSP is a free and open-source signal processing
 	  library for software-defined radios written in C.  Its

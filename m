From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Nov 2015 15:20:44 -0300
Subject: [Buildroot] [PATCH] liquid-dsp: blacklist CS powerpc toolchains
Message-ID: <1447784444-5336-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They're unable to build liquid-dsp successfully resulting in an internal
compiler error. Fixes:
http://autobuild.buildroot.net/results/2ac/2acd745f4e5ec6edfd09afcd57b9ece216724c1b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/liquid-dsp/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
index 95233da..c388734 100644
--- a/package/liquid-dsp/Config.in
+++ b/package/liquid-dsp/Config.in
@@ -5,6 +5,9 @@ config BR2_PACKAGE_LIQUID_DSP
 	bool "liquid-dsp"
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on !BR2_STATIC_LIBS
+	# These result in internal compiler error
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	help
 	  Liquid-DSP is a free and open-source signal processing
 	  library for software-defined radios written in C.  Its
-- 
2.4.10

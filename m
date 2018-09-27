From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu, 27 Sep 2018 07:46:45 -0700
Subject: [Buildroot] [PATCH 1/2] perl-sys-cpu: disable static builds
In-Reply-To: <20180927144646.20954-1-chrismcc@gmail.com>
References: <20180927144646.20954-1-chrismcc@gmail.com>
Message-ID: <20180927144646.20954-2-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable static builds like other perl modules
fixes autobuild failures

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/perl-sys-cpu/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/perl-sys-cpu/Config.in b/package/perl-sys-cpu/Config.in
index a604945740..8306b371dc 100644
--- a/package/perl-sys-cpu/Config.in
+++ b/package/perl-sys-cpu/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_PERL_SYS_CPU
 	bool "perl-sys-cpu"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Perl module for getting information about the system CPU
 	  (Sys::CPU).
+
+comment "perl-sys-cpu needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.14.4

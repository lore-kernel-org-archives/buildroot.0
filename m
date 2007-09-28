From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Sep 2007 20:08:50 +0200
Subject: [Buildroot] Kernel Download Error with external toolchain
In-Reply-To: <1190985506.17683.6.camel@venture.bit63.org>
References: <1190985506.17683.6.camel@venture.bit63.org>
Message-ID: <20070928180849.GQ20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 28, 2007 at 09:18:26AM -0400, Clark Rawlins wrote:
>When attempting to build a fairly simple config including a kernel using
>an external toolchain I am getting the following error:
>
>http://www.kernel.org/pub/linux/kernel/v2.6//linux-...tar.bz2

Index: target/linux/Config.in
===================================================================
--- target/linux/Config.in	(revision 20084)
+++ target/linux/Config.in	(working copy)
@@ -15,7 +15,6 @@ config BR2_PACKAGE_LINUX
 config BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG
 	bool "linux kernel experimental configuration"
 	depends on BR2_PACKAGE_LINUX
-	depends on BR2_TARGET_ATMEL
 	default n
 	help
 	  More advanced configuration (in development)

Another thing that is hidden behind some odd ATMEL symbol. What was the
reasoning for hiding this one, too?

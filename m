From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jun 2013 23:50:22 +0200
Subject: [Buildroot] [PATCH] libunwind:  new pacakge
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639A6F946@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C639A6F946@ex-mb1.corp.adtran.com>
Message-ID: <20130625235022.75b13738@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear ANDY KENNEDY,

On Tue, 25 Jun 2013 21:41:44 +0000, ANDY KENNEDY wrote:

> +config BR2_PACKAGE_LIBUNWIND
> +	bool "libunwind"
> +	help
> +	  C API to determine the call-chain of a program.
> +
> +	  Project home:  <http://www.nongnu.org/libunwind/index.html>

No need to indicate "Project home:", just:

	  http://www.nongnu.org/libunwind/index.html

Also:

 1) Did you check that it builds fine with uClibc? This kind of library
 tend to use some funky C library features, sometimes not available in
 uClibc.

 2) The libunwind code seems to contain some architecture-specific
 code. While aarch64, arm, mips, ppc, sh, x86 and x86-64 are supported,
 some other architectures that Buildroot supports are not supported. So
 maybe this package should have a "depends on BR2_aarch64 || BR2_arm ||
 BR2_armeb || ..."

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

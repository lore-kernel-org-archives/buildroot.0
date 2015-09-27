From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Sep 2015 23:35:03 +0200
Subject: [Buildroot] [PATCH] subversion: bump to version 1.9.2
In-Reply-To: <1443090000-41954-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443090000-41954-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150927233503.5de7365f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 24 Sep 2015 11:20:00 +0100, Vicente Olivert Riera wrote:
> - Bump to version 1.9.2.
> - Update the hash file.
> - Fix a typo in the berkeley-db configure option.
> - Remove non-existent configure options: neon, gssapi and ssl.
> - Remove neon dependency: is not needed to build subversion.
> - Tweak the 0001-dont-mangle-cflags.patch for the 1.9.2 version.
> - Add a new 0002-dont-check-mach-o.patch to remove a configure check for
>   Mach-O which breaks the build when cross-compiling.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Note: subversion now autoreconfigures properly, so patching the
configure script directly is not good, configure.ac should be patched
instead.

> diff --git a/package/subversion/0002-dont-check-mach-o.patch b/package/subversion/0002-dont-check-mach-o.patch
> new file mode 100644
> index 0000000..ac28d1b
> --- /dev/null
> +++ b/package/subversion/0002-dont-check-mach-o.patch
> @@ -0,0 +1,71 @@
> +Don't check for Apple's Mach-O during configure phase
> +
> +Mach-O is a short for Mach Object file format, which is used by most
> +systems based on the Mach Kernel, like NeXTSTEP, OS X, or iOS. [1]
> +
> +Given that Buildroot only supports Linux kernels, and also given that
> +this check breaks the build when cross-compiling...
> +
> +checking for Mach-O dynamic module iteration functions
> +error: cannot run test program while cross compiling
> +
> +..., it's safe to remove this check from the configure script.
> +
> +[1] : https://en.wikipedia.org/wiki/Mach-OM
> +
> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Ideally, this should be solved by running the autoconf test only on the
corresponding OS, or adding a cache variable to feed the result of the
test (which is normally what is done for most AC_RUN_IFELSE tests).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

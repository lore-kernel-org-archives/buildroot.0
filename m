From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 12:36:13 +0100
Subject: [Buildroot] [PATCH] dillo: avoid poisoned paths in configure
In-Reply-To: <20150109123645.GA23533@vostro>
References: <20150109123645.GA23533@vostro>
Message-ID: <20150110123613.6fecd66c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Fri, 9 Jan 2015 14:36:45 +0200, Alex Suykov wrote:

> diff --git a/package/dillo/0002-usr-local-include.patch b/package/dillo/0002-usr-local-include.patch
> new file mode 100644
> index 0000000..eb27742
> --- /dev/null
> +++ b/package/dillo/0002-usr-local-include.patch
> @@ -0,0 +1,41 @@
> +Do not add (possibly poisoned) /usr/local/include and /usr/local/lib
> +to gcc and ld search paths in configure.
> +
> +With BR2_COMPILER_PARANOID_UNSAFE_PATH enabled, poisoned paths result
> +in hard errors, failing affected configure tests.
> +
> +Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

Thanks. But can you make a patch that only changes configure.ac, and
not configure? This package is already autoreconf'ed. Also, please
adjust the comment above DILLO_AUTORECONF = YES in the .mk file to
mention that we also autoreconf for this new patch?

And additionally, please submit this patch to the upstream Dillo
developers!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

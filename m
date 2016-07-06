From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 20:21:04 +0200
Subject: [Buildroot] [PATCH] package/gdb: add dependency on host-textinfo
In-Reply-To: <1467734549-2767-1-git-send-email-romain.naour@gmail.com>
References: <1467734549-2767-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160706202104.50779a5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 18:02:29 +0200, Romain Naour wrote:

> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 6d70955..3941b45 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -35,7 +35,12 @@ endif
>  # For the host variant, we really want to build with XML support,
>  # which is needed to read XML descriptions of target architectures. We
>  # also need ncurses.
> -HOST_GDB_DEPENDENCIES = host-expat host-ncurses

I prefer to keep this as is.

> +# Starting with gdb 7.10, gdb wants to re-generate its documentation.
> +# We were trying to avoid that by patching the Makefiles, but it wasn't
> +# working in all situations. So, we simply add a dependency on
> +# host-texinfo in all case.
> +HOST_GDB_DEPENDENCIES += host-expat host-ncurses host-texinfo

And just add host-texinfo here.

> +GDB_DEPENDENCIES += host-texinfo

Applied with this modification. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

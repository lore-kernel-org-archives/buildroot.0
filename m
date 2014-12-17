From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Dec 2014 12:44:47 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/gdb: fix shared-only build
In-Reply-To: <1418766762-31851-1-git-send-email-romain.naour@openwide.fr>
References: <1418766762-31851-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141217124447.04cbb0e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 16 Dec 2014 22:52:42 +0100, Romain Naour wrote:

> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index dbec760..7fbf2f8 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -83,7 +83,8 @@ GDB_CONF_OPTS = \
>  	$(if $(BR2_PACKAGE_GDB_SERVER),--enable-gdbserver) \
>  	--with-curses \
>  	--without-included-gettext \
> -	--disable-werror
> +	--disable-werror \
> +	--enable-static

We probably want a comment above GDB_CONF_OPTS to explain why we're
adding --enable-static.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

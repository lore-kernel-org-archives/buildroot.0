From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 20:28:14 +0200
Subject: [Buildroot] [PATCH 2/2] samba: Add support for libnss_win*.so*
 installation
In-Reply-To: <1407176057-13180-2-git-send-email-benoit.thebaudeau@advansee.com>
References: <1407176057-13180-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1407176057-13180-2-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <20140804202814.0fb3a553@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Mon,  4 Aug 2014 20:14:17 +0200, Beno?t Th?baudeau wrote:

> +config BR2_PACKAGE_SAMBA_LIBNSS_WINS
> +	bool "libnss_wins"
> +	default y if BR2_TOOLCHAIN_USES_GLIBC
> +	help
> +	  libnss_wins is a library that permits the Name Service Switch
> +	  to resolve NetBIOS names.
> +
> +config BR2_PACKAGE_SAMBA_LIBNSS_WINBIND
> +	bool "libnss_winbind"
> +	default y if BR2_TOOLCHAIN_USES_GLIBC
> +	help
> +	  libnss_winbind is a library that permits the Name Service
> +	  Switch to resolve user and group information from a Windows
> +	  NT server.

Since libnss loadable modules only work with glibc, shouldn't those
options simply be "depends on BR2_TOOLCHAIN_USES_GLIBC" ?

Also, do we really want two separate options here?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

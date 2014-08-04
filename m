From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Mon, 4 Aug 2014 20:37:24 +0200 (CEST)
Subject: [Buildroot] [PATCH 2/2] samba: Add support for libnss_win*.so*
 installation
In-Reply-To: <20140804202814.0fb3a553@free-electrons.com>
References: <1407176057-13180-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1407176057-13180-2-git-send-email-benoit.thebaudeau@advansee.com>
 <20140804202814.0fb3a553@free-electrons.com>
Message-ID: <516153963.1672761.1407177444671.JavaMail.zimbra@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Monday, August 4, 2014 8:28:14 PM, Thomas Petazzoni wrote:
> Dear Beno?t Th?baudeau,
> 
> On Mon,  4 Aug 2014 20:14:17 +0200, Beno?t Th?baudeau wrote:
> 
> > +config BR2_PACKAGE_SAMBA_LIBNSS_WINS
> > +	bool "libnss_wins"
> > +	default y if BR2_TOOLCHAIN_USES_GLIBC
> > +	help
> > +	  libnss_wins is a library that permits the Name Service Switch
> > +	  to resolve NetBIOS names.
> > +
> > +config BR2_PACKAGE_SAMBA_LIBNSS_WINBIND
> > +	bool "libnss_winbind"
> > +	default y if BR2_TOOLCHAIN_USES_GLIBC
> > +	help
> > +	  libnss_winbind is a library that permits the Name Service
> > +	  Switch to resolve user and group information from a Windows
> > +	  NT server.
> 
> Since libnss loadable modules only work with glibc, shouldn't those
> options simply be "depends on BR2_TOOLCHAIN_USES_GLIBC" ?

This is explained in the commit message. The libnss modules are indeed designed
for glibc, but there is nothing preventing from using them directly without
glibc (for testing or whatever), just as a normal library. This is probably not
very useful, but there is no reason to prohibit this usage.

> Also, do we really want two separate options here?

I don't know. They are independent, so keeping them separate allows to save some
space (1066244 bytes for libnss_wins.so and 38676 bytes for libnss_winbind.so on
Raspberry Pi), but this is not a strong requirement if people prefer to see them
merged.

Best regards,
Beno?t

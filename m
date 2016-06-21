From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jun 2016 17:51:28 +0200
Subject: [Buildroot] [git commit] efivar: new package
In-Reply-To: <57696022.2060308@imgtec.com>
References: <20160612140155.BE24D8041E@busybox.osuosl.org>
 <57696022.2060308@imgtec.com>
Message-ID: <20160621175128.2db7e559@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Jun 2016 16:41:22 +0100, Vicente Olivert Riera wrote:

> > +comment "efivar requires an (e)glibc toolchain w/ headers >= 3.12"
> > +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
> > +		!BR2_TOOLCHAIN_USES_GLIBC  
> 
> shouldn't be
> 
> comment "efivar requires an (e)glibc toolchain w/ headers >= 3.12"
> 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
> 		BR2_TOOLCHAIN_USES_GLIBC
> 
> ...?
> 
> The package is only compatible with glibc, so it depends on it. The
> comment should depend on it as well.

No, we precisely want to display the comment when the user is *NOT*
using glibc, to inform him that the package is not available because he
is not using glibc.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

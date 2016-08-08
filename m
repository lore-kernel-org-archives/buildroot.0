From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Aug 2016 19:04:10 +0200
Subject: [Buildroot] [PATCH v2] glibc: add version 2.24
In-Reply-To: <20160808165843.GD845@tarshish>
References: <1470407808-26534-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160808164833.GB5876@free.fr> <20160808165843.GD845@tarshish>
Message-ID: <20160808170410.GC5876@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2016-08-08 19:58 +0300, Baruch Siach spake thusly:
> On Mon, Aug 08, 2016 at 06:48:33PM +0200, Yann E. MORIN wrote:
> > On 2016-08-05 15:36 +0100, Vicente Olivert Riera spake thusly:
> > > +config BR2_GLIBC_VERSION_2_24
> > > +	bool "2.24"
> > > +	# No support for pthread barriers on < v9 ISA
> > > +	depends on !BR2_sparc
> > 
> > It shall also depends on kernel headers >= 3.2 for all but x86/x86_64,
> > as discussed in your previous iteration. Something like:
> > 
> >     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_i386 || BR2_x86_64
> 
> But according to your interpretation[1] of the release announcement, glibc 
> 2.24 requires kernel headers 3.2+ to build for all architectures, including 
> x86/x84_64. So the headers dependency should not exclude x86/x84_64.

That is absolutely right, of course! Thanks for spotting.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Jan 2016 22:03:55 +0100
Subject: [Buildroot] [PATCH 1/3] package/linux-headers: add option to
 use same sources as the kernel
In-Reply-To: <20160120213607.063c1447@free-electrons.com>
References: <cover.1453314776.git.yann.morin.1998@free.fr>
 <dde8a16a5331beb6280d7b86002aa917eae44664.1453314776.git.yann.morin.1998@free.fr>
 <20160120213607.063c1447@free-electrons.com>
Message-ID: <20160120210355.GB3992@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-20 21:36 +0100, Thomas Petazzoni spake thusly:
> On Wed, 20 Jan 2016 19:34:28 +0100, Yann E. MORIN wrote:
> > +	config BR2_KERNEL_HEADERS_AS_KERNEL
> > +		bool "Same as kernel"
> > +		depends on BR2_LINUX_KERNEL
> > +
> > +	comment "Using the same version as that of the"
> > +		depends on !BR2_LINUX_KERNEL
> > +	comment "kernel needs a kernel to be built.   "
> > +		depends on !BR2_LINUX_KERNEL
> 
> I think this Config.in comment is useless. It is completely obvious
> that if you want to re-use the same kernel headers as the kernel you're
> building, you must have enabled building a kernel with Buildroot.

Yeah, I knew it was redundant; I'll remove it.

> Other than that, the patch looks good. I haven't tested it, but it
> looks good.
> 
> Yet another feature that would desperately need a test case in our test
> suite :-)

Hehe! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

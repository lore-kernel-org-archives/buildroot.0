From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Jan 2016 23:15:42 +0100
Subject: [Buildroot] [PATCH 2/3] defconfigs: use the new
 headers-version-same-as-kernel-version option
In-Reply-To: <20160120230727.6ba2b63d@free-electrons.com>
References: <cover.1453314776.git.yann.morin.1998@free.fr>
 <811e1f5fe52c239010c412ce9f22b307d115cfcf.1453314776.git.yann.morin.1998@free.fr>
 <20160120213824.686c94fb@free-electrons.com>
 <20160120215821.GD3992@free.fr>
 <20160120230727.6ba2b63d@free-electrons.com>
Message-ID: <20160120221542.GF3992@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-20 23:07 +0100, Thomas Petazzoni spake thusly:
> On Wed, 20 Jan 2016 22:58:21 +0100, Yann E. MORIN wrote:
> > Well, I think it may be worse than that, in fact... Let's see what
> > happens with a trivial defconfig from before this patch, with the
> > default toolchain and the kernel settings:
> > 
> >     BR2_LINUX_KERNEL=y
> > 
> > This would give:
> > 
> >     BR2_KERNEL_HEADERS_4_4=y
> >     BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4=y
> >     BR2_TOOLCHAIN_HEADERS_AT_LEAST="4.4"
> >     BR2_LINUX_KERNEL=y
> >     BR2_LINUX_KERNEL_LATEST_VERSION=y
> > 
> > Now we use that defconfig after this patch, this gives:
> > 
> >     BR2_KERNEL_HEADERS_AS_KERNEL=y
> >     BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD=y
> >     BR2_LINUX_KERNEL=y
> >     BR2_LINUX_KERNEL_VERSION="4.4"
> > 
> > And boom, we've lost BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4=y
> > 
> > I have no idea how we could solve this. I doubt we want to add anything
> > like BR2_LINUX_KERNEL_AT_LEAST_4_4 and the likes... :-/
> > 
> > Ideas?
> 
> Remove:
> 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
>  ?

Indeed. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

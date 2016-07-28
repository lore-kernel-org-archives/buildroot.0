From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jul 2016 22:22:21 +0200
Subject: [Buildroot] [PATCH v3] kmsxx: new package
In-Reply-To: <20160728221714.79a45576@free-electrons.com>
References: <20160728193825.9199-1-maxime.ripard@free-electrons.com>
 <20160728194927.GD5862@free.fr>
 <20160728221714.79a45576@free-electrons.com>
Message-ID: <20160728202221.GG5862@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-07-28 22:17 +0200, Thomas Petazzoni spake thusly:
> On Thu, 28 Jul 2016 21:49:27 +0200, Yann E. MORIN wrote:
> > > +	depends on BR2_INSTALL_LIBSTDCPP
> > > +	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs  
> > 
> > The comment "# libpthread-stubs" seems to imply that the dependency on
> > C++ is ihnerited from libpthread-stubs, but it is neither selected not
> > depended on; it is also not in the build dependency. Is it an oversight?
> > 
> > However, given the name of the package, I guess it needs C++ for itself.
> > So, whether libpthread-stubs is needed or not, you should drop the
> > comment altogether: C++ *is* needed by kms++.
> 
> There is no comment on the C++ dependency, so I'm not sure what you
> mean here.

Grr... I read in diagonal, and in my eyes, the comment was on the
BR2_INSTALL_LIBSTDCPP line... :-/

> The BR2_TOOLCHAIN_HAS_THREADS dependency is inherited from libdrm,
> which itself inherits it from libpthread-stubs. So the way we typically
> do it is:
> 
> 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm -> libpthread-stubs
> 
> Or just:
> 
> 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm

Indeed.

Sorry for the noise.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

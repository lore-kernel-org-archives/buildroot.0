From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Dec 2015 16:10:23 +0100
Subject: [Buildroot] [PATCH v9 06/32] package/efl/libefl: new package
In-Reply-To: <20151212151524.0b711e40@free-electrons.com>
References: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
 <1449927215-3452-7-git-send-email-romain.naour@openwide.fr>
 <20151212151524.0b711e40@free-electrons.com>
Message-ID: <20151212151023.GA3713@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Romain, All,

On 2015-12-12 15:15 +0100, Thomas Petazzoni spake thusly:
> On Sat, 12 Dec 2015 14:33:09 +0100, Romain Naour wrote:
> > diff --git a/package/efl/Config.in b/package/efl/Config.in
> > index 7ce5a36..1c6f9e5 100644
> > --- a/package/efl/Config.in
> > +++ b/package/efl/Config.in
[--SNIP--]
> > +comment "EFL needs udev /dev management and a toolchain w/ C++, dynamic library, threads, wchar"
> > +	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP \
> > +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> > +	depends on BR2_USE_MMU
> > +
> > +comment "EFL needs lua"
> > +	depends on !BR2_PACKAGE_LUA
> > +	depends on BR2_USE_MMU
> 
> Also, do you have a reason for not selecting Lua ?

Because BR2_PACKAGE_LUA is a provider for the virual package
lua-interpreter, and you should not select a provider of a virtual
package:

    https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_virtual_packages

    If your package really requires a specific provider, then you?ll
    have to make your package depends on this provider; you can not
    select a provider.

(followed byu an example why this should indeed not be done.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

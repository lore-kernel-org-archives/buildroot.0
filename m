From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2015 18:20:55 +0100
Subject: [Buildroot] [PATCH 31/84 RFC] package/udpcast: use 'menuconfig'
 instad of 'config'+'menu'
In-Reply-To: <56847216.8090904@mind.be>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <a268a17eef8f2d9e7b895fea1f8396dda8823987.1451076704.git.yann.morin.1998@free.fr>
 <56847216.8090904@mind.be>
Message-ID: <20151231172055.GC3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-31 01:08 +0100, Arnout Vandecappelle spake thusly:
> On 25-12-15 22:25, Yann E. MORIN wrote:
> > This is a bit overkill, as there is only two sub-items. However, this
> > commit is not about judging whether it makes sense or not to have a
> > sub-menu, but to cleanup the 'config'+'menu' situation.
> 
>  Well, you could just as well take this opportunity to replace it with indented
> config options. You wrote yourself in your cover text that 5 entries would be
> the arbitrary cut-off.
> 
>  That said, it's acceptable to have this as an inbetween step as well.

Well, as I said in the commit, it's not about judging whether it
makessense or not, it;s just about changing the 'config'+'menu' into a
'menuconfig'.

However, yes, I can /fix/ it in the second part of the series, when the
'5 options or more' concept is introduced.

Regards,
Yann E. MORIN.

> 
>  Regards,
>  Arnout
> 
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/udpcast/Config.in | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> > 
> > diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
> > index 0424db7..a61829a 100644
> > --- a/package/udpcast/Config.in
> > +++ b/package/udpcast/Config.in
> > @@ -2,7 +2,7 @@ comment "udpcast needs a toolchain w/ threads"
> >  	depends on BR2_USE_MMU
> >  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> >  
> > -config BR2_PACKAGE_UDPCAST
> > +menuconfig BR2_PACKAGE_UDPCAST
> >  	bool "udpcast"
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS
> >  	depends on BR2_USE_MMU # fork()
> > @@ -14,8 +14,6 @@ config BR2_PACKAGE_UDPCAST
> >  
> >  if BR2_PACKAGE_UDPCAST
> >  
> > -menu "udpcast tools selection"
> > -
> >  config BR2_PACKAGE_UDPCAST_SENDER
> >  	bool "sender"
> >  	help
> > @@ -26,6 +24,4 @@ config BR2_PACKAGE_UDPCAST_RECEIVER
> >  	help
> >  	  The udpcast receiver.
> >  
> > -endmenu
> > -
> >  endif
> > 
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

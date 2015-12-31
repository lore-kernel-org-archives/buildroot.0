From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2015 18:25:01 +0100
Subject: [Buildroot] [PATCH 33/84 RFC] package/gstreamer: use
 'menuconfig' instead of 'config'+'menu'
In-Reply-To: <5684735D.7080906@mind.be>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <b49ea4e735ecb94e314ef1e5674f7082da73d9cc.1451076704.git.yann.morin.1998@free.fr>
 <5684735D.7080906@mind.be>
Message-ID: <20151231172501.GE3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2015-12-31 01:14 +0100, Arnout Vandecappelle spake thusly:
>  Subject is wrong: there was no menu originally, you added it.
> 
>  Again I don't really like it, but I don't feel so strongly about it as about
> jquery etc.

Then you got me confused. What's different for gstreamer from jquery,
that makes it acceptable for gstreamer and not jquery?

Really, I'm puzzled...

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> On 25-12-15 22:25, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/gstreamer/gstreamer/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/gstreamer/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
> > index aee48b1..cba8774 100644
> > --- a/package/gstreamer/gstreamer/Config.in
> > +++ b/package/gstreamer/gstreamer/Config.in
> > @@ -2,7 +2,7 @@ comment "gstreamer 0.10 needs a toolchain w/ wchar, threads"
> >  	depends on BR2_USE_MMU
> >  	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> >  
> > -config BR2_PACKAGE_GSTREAMER
> > +menuconfig BR2_PACKAGE_GSTREAMER
> >  	bool "gstreamer 0.10"
> >  	depends on BR2_USE_WCHAR # glib2
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
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

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jan 2016 12:03:20 +0100
Subject: [Buildroot] [PATCH 46/84 RFC] package/directfb: use 'menuconfig'
In-Reply-To: <5687282E.1070904@mind.be>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <1b63f13fc3066aa397dedf17e729b031497ce113.1451076704.git.yann.morin.1998@free.fr>
 <5687282E.1070904@mind.be>
Message-ID: <20160102110320.GE3477@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-01-02 02:30 +0100, Arnout Vandecappelle spake thusly:
> On 25-12-15 22:25, Yann E. MORIN wrote:
> > directfb has more than 5 options, so use a 'menuconfig' to group the
> > options in an sub-menu.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/directfb/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> > index 73425d3..6a233dc 100644
> > --- a/package/directfb/Config.in
> > +++ b/package/directfb/Config.in
> > @@ -1,4 +1,4 @@
> > -config BR2_PACKAGE_DIRECTFB
> > +menuconfig BR2_PACKAGE_DIRECTFB
> >  	bool "directfb"
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS
> >  	depends on BR2_INSTALL_LIBSTDCPP
> 
>  Maybe directfb-examples should be moved into this menu as well?

I was not sure about that one.

directfb-examples is a separate package that buids _on top_ of directfb;
it does not provide additional features like addons or modules that can
be 'dynamically loaded' at runtime (like gst plugins or php mdules or
perl addons or...).

IMHO it's a bit like enlightenment and EFL: enlightenment is only one
package that can _use_ EFL and does not enhance EFL.

But since they are example for DirectFB, it probably does not nmake
sense to have it on the final target, and they would probably be used
only during development, so could belong to the directfb sub-menu.

Anyway, I'll leave it out for now, we can move it later if people
prefer.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

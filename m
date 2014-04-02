From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Apr 2014 18:26:53 +0200
Subject: [Buildroot] [PATCH 4/6] package/vlc: depends on the virtual
 package libgl
In-Reply-To: <533BABEA.4030802@mind.be>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
 <44a8749bc3ef2c283fa679da79efd8764e482682.1396302677.git.yann.morin.1998@free.fr>
 <533BABEA.4030802@mind.be>
Message-ID: <20140402162653.GB3509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-04-02 08:19 +0200, Arnout Vandecappelle spake thusly:
> On 01/04/14 00:00, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Currently, vlc depends on mesa3d to provide the openGL support.
> > 
> > We now have a virtual package, libgl, which ensures openGL is available.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Bernd Kuhls <berndkuhls@hotmail.com>
> > ---
> >  package/vlc/vlc.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> > index a9ee620..f78f209 100644
> > --- a/package/vlc/vlc.mk
> > +++ b/package/vlc/vlc.mk
> > @@ -118,9 +118,9 @@ else
> >  VLC_CONF_OPT += --disable-flac
> >  endif
> >  
> > -ifeq ($(BR2_PACKAGE_MESA3D),y)
> > +ifeq ($(BR2_PACKAGE_HAS_OPENGL),y)
> >  VLC_CONF_OPT += --enable-glx
> 
>  Since the option is called enable-glx, it sounds as if it should depend
> on X as well (I don't think wayland has glx, right?)

Well, full-openGL is only possible with X11 anyway, so BR2_PACKAGE_HAS_OPENGL
will itself not be set when X.org is not selected as well.

So, I think we can just depend on BR2_PACKAGE_HAS_OPENGL for this
option.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

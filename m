From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2015 18:23:36 +0100
Subject: [Buildroot] [PATCH 32/84 RFC] package/gstreamer: include
 plugins from gstreamer's real Config.in
In-Reply-To: <56847303.4040608@mind.be>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <14c33d26a86cb2bb6673d5f053fb871dbfe9b8c8.1451076704.git.yann.morin.1998@free.fr>
 <56847303.4040608@mind.be>
Message-ID: <20151231172336.GD3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-31 01:12 +0100, Arnout Vandecappelle spake thusly:
> On 25-12-15 22:25, Yann E. MORIN wrote:
> > It is more logical to have a single if-clause, rather than repeat it in
> > another file, possiblty brealking indentation like it previously was.
> 
>  I actually preferred the way it was indented before. Now there is no
> distinction anymore between the gstreamer options and the additional plugin
> packages.

Yes, that is on-purpose. The gstreamer plugins are really "sub-options"
(in the end-user experience) of gstreamer. That they are in fact
completely different packages is still irrelevant to him. ;-)

Regards,
Yann E. MORIN.

> But I don't feel strongly about it.
> 
> 
>  Regards,
>  Arnout
> 
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/gstreamer/Config.in           | 12 ------------
> >  package/gstreamer/gstreamer/Config.in | 10 ++++++++++
> >  2 files changed, 10 insertions(+), 12 deletions(-)
> > 
> > diff --git a/package/gstreamer/Config.in b/package/gstreamer/Config.in
> > index c6292f4..476f838 100644
> > --- a/package/gstreamer/Config.in
> > +++ b/package/gstreamer/Config.in
> > @@ -1,14 +1,2 @@
> >  # Gstreamer 0.10.x & Plugins
> >  source "package/gstreamer/gstreamer/Config.in"
> > -
> > -if BR2_PACKAGE_GSTREAMER
> > -source "package/gstreamer/gst-plugins-base/Config.in"
> > -source "package/gstreamer/gst-plugins-good/Config.in"
> > -source "package/gstreamer/gst-plugins-bad/Config.in"
> > -source "package/gstreamer/gst-plugins-ugly/Config.in"
> > -source "package/gstreamer/gst-ffmpeg/Config.in"
> > -source "package/gstreamer/gst-dsp/Config.in"
> > -source "package/gstreamer/gst-fsl-plugins/Config.in"
> > -source "package/gstreamer/gst-omapfb/Config.in"
> > -source "package/gstreamer/gst-plugin-x170/Config.in"
> > -endif
> > diff --git a/package/gstreamer/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
> > index eb1249a..aee48b1 100644
> > --- a/package/gstreamer/gstreamer/Config.in
> > +++ b/package/gstreamer/gstreamer/Config.in
> > @@ -33,4 +33,14 @@ config BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY
> >  	  Enable support for the GStreamer plugin registry. This may increase
> >  	  the launch-time for a GStreamer application.
> >  
> > +source "package/gstreamer/gst-plugins-base/Config.in"
> > +source "package/gstreamer/gst-plugins-good/Config.in"
> > +source "package/gstreamer/gst-plugins-bad/Config.in"
> > +source "package/gstreamer/gst-plugins-ugly/Config.in"
> > +source "package/gstreamer/gst-ffmpeg/Config.in"
> > +source "package/gstreamer/gst-dsp/Config.in"
> > +source "package/gstreamer/gst-fsl-plugins/Config.in"
> > +source "package/gstreamer/gst-omapfb/Config.in"
> > +source "package/gstreamer/gst-plugin-x170/Config.in"
> > +
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

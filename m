From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 12 Jul 2019 20:56:51 +0200
Subject: [Buildroot] [PATCH v2 3/6]
 package/gstreamer1/gst1-plugins-good: convert package type to meson
In-Reply-To: <b096dec2-90a1-1566-4bc5-1006cf0c6c4f@mind.be>
References: <20190710153634.25235-1-aduskett@gmail.com>
 <20190710153634.25235-4-aduskett@gmail.com>
 <20190710225203.0b81eec0@gmx.net>
 <ab41f678-9611-a6af-3314-ff2d643a7599@mind.be>
 <20190711213021.2204224c@gmx.net>
 <b096dec2-90a1-1566-4bc5-1006cf0c6c4f@mind.be>
Message-ID: <20190712205651.21503ada@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Fri, 12 Jul 2019 11:42:57 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 11/07/2019 21:30, Peter Seiderer wrote:
> > Hello Arnout,
> >
> > On Wed, 10 Jul 2019 23:53:24 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> >> On 10/07/2019 22:52, Peter Seiderer wrote:
> >>> Hello Adam,
> >>>
> >>> On Wed, 10 Jul 2019 11:36:31 -0400, aduskett at gmail.com wrote:
> >>
> >> [snip]
> >>>> -	--disable-osx_audio \
> >>>> -	--disable-osx_video \
> >>>> -	--disable-aalib \
> >>>> -	--disable-aalibtest \
> >>>> -	--disable-libcaca
> >>>> +	-Dexamples=disabled \
> >>>> +	-Dtests=disabled \
> >>>
> >>> While your are at it , the following options should move to the
> >>> 'Options which require currently unpackaged libraries' section
> >>> some lines below:
> >>
> >>  No, that should be done as a separate patch.
> >>
> >>  It would also be nice BTW if all the options would be ordered alphabetically.
> >> Now they're a bit of a hodgepodge.
> >
> > O.k. stuff for an follow up patch, I would prefer option ordering according
> > to meson_options.txt (to enable easy check for added/removed/changed options)...
>
>  OK. then indeed it can be done at the same time as the conversion to meson.

Tried it already, but doing the re-ordering in one patch with the conversion makes
patch review very hard, therefore prefer the re-ordering via an extra patch...

>
>  The ordering choice should be mentioned in the commit message then.

Or in the .mk Files, some plugin .mk files state now

     # These plugins are listed in the order from ./configure --help

should be change to

     # These plugins are listed in the order from meson_options.txt

>
> >> [snip]
> >>>>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB),y)
> >>>> -GST1_PLUGINS_GOOD_CONF_OPTS += --enable-zlib
> >>>>  GST1_PLUGINS_GOOD_DEPENDENCIES += zlib
> >>>> -else
> >>>> -GST1_PLUGINS_GOOD_CONF_OPTS += --disable-zlib
> >>>>  endif
> >>>
> >>> Should be:
> >>>
> >>>   # checked for by meson.build, gst/isomp4/meson.build, gst/matroska/meson.build
> >>>   # and gst/icydemux/meson.build
> >>
> >>  We don't add such a comment for any other package, so not needed.
> >
> > Would like to keep it, because:
> >
> > - as prove of correctness of the removed BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB Config.in entry
> > - as a reminder/blueprint for identifying zlib-like minor feature dependencies not expressed
> >   in the root meson_options.txt file
>
>  Good point, but IMHO it fits more as a commit message paragaph than as a
> comment in the source file.

Thats fine with me...

Regards,
Peter

>
>  Regards,
>  Arnout
>
> [snip]

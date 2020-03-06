From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 6 Mar 2020 15:34:24 +0100
Subject: [Buildroot] [PATCH/next v1] package/gst1-plugins-base: add
 tools option
In-Reply-To: <20200305233410.76c4e8d0@windsurf>
References: <20200303164702.18418-1-ps.report@gmx.net>
 <20200305233410.76c4e8d0@windsurf>
Message-ID: <20200306153424.3ea95cc7@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 5 Mar 2020 23:34:10 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Tue,  3 Mar 2020 17:47:02 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Add tools option to disable building/installing of
> > gst-discoverer, gst-device-monitor and gst-play commandline
> > tools (analog BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS).
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/gstreamer1/gst1-plugins-base/Config.in            | 7 +++++++
> >  package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 6 ++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
> > index f60d540337..3a3694b72e 100644
> > --- a/package/gstreamer1/gst1-plugins-base/Config.in
> > +++ b/package/gstreamer1/gst1-plugins-base/Config.ihttps://github.com/octo/liboping/pull/50/commits/664414123a3fe89984abfa0917946c513bf47163n
> > @@ -10,6 +10,13 @@ menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE
> >
> >  if BR2_PACKAGE_GST1_PLUGINS_BASE
> >
> > +config BR2_PACKAGE_GST1_PLUGINS_BASE_INSTALL_TOOLS
> > +	bool "install gst-discoverer & gst-device-monitor & gst-play
>
> Missing closing double quote. Also, I changed this to "install tools",
> to keep the prompt shorter.

Thanks for fixing it...

>
> > +	default y
>
> I know gstreamer1 does this, but this "default y" is really not in line
> with the typical Buildroot policy of minimalism, so I dropped this.

The reasoning was to do the same as for BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
(which defaults to y) but I am although o.k. with this one...

Regards,
Peter

>
> Applied to next with those changes.
>
> Thanks!
>
> Thomas

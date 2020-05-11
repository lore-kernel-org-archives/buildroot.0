From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 11 May 2020 01:54:03 -0600
Subject: [Buildroot] [PATCH 2/5] package/gssdp: add optional dependency
 for gobject-introspection
In-Reply-To: <CAPi7W83Vin+mO-jBozA4kisWGm9Op1dxSujDpkY8QuipvJL71g@mail.gmail.com>
References: <20200315172459.881615-1-aduskett@gmail.com>
 <20200315172459.881615-2-aduskett@gmail.com>
 <20200511071910.74806b2a@windsurf.home>
 <CAPi7W80ZVFdJrbvPtoSnbOxXBstdziKW5zcy51pSjSUgzE7hgg@mail.gmail.com>
 <CAPi7W83Vin+mO-jBozA4kisWGm9Op1dxSujDpkY8QuipvJL71g@mail.gmail.com>
Message-ID: <CADvTj4oHO5HnYxRU6VkdLRNCpsBJS0R5kWJd62Y3jDfA212EsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 11, 2020 at 1:18 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Hi all,
>
> Le lun. 11 mai 2020 ? 09:02, Fabrice Fontaine
> <fontaine.fabrice@gmail.com> a ?crit :
> >
> > Hi Thomas,
> >
> > Le lun. 11 mai 2020 ? 07:19, Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> a ?crit :
> > >
> > > Hello,
> > >
> > > On Sun, 15 Mar 2020 10:24:55 -0700
> > > aduskett at gmail.com wrote:
> > >
> > > > From: Adam Duskett <Aduskett@gmail.com>
> > > >
> > > > If gobject-introspection is selected, explicitly set -Dintrospection=true in
> > > > the configure options and add a dependency for gobject-introspection.
> > > >
> > > > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > >
> > > The build of gssdp is broken with introspection support:
> > >
> > >   /bin/sh: 1: /home/buildroot/autobuild/instance-2/output-1/host/bin/../nios2-buildroot-linux-gnu/sysroot/home/buildroot/autobuild/instance-2/output-1/host/bin/g-ir-scanner: not found
> > >
> > > Could you have a look ?
> > >
> > > I am wondering if this couldn't be a fallout of the recent changes in
> > > the pkg-config Meson logic.
> > James sent a patch that fix this build failure:
> > https://patchwork.ozlabs.org/project/buildroot/patch/20200502060435.23004-1-james.hilliard1 at gmail.com.
> > The patch sent by James is fixing atk as well as many other meson
> > packages such as gssdp. However, it seems there was some debate on
> > this patch.It seems that James suggested that a better solution would be to patch meson. This proposal was merged by meson a few days ago:
> https://github.com/mesonbuild/meson/pull/7072/commits/0aa52b538fa678e2da1d0dedff800408e5e7afbb
> James, could you provide a v2 of your patch?
I was waiting on it to get included in a meson release since it doesn't apply
to the latest release, seems the gnome module has been refactored quite
a bit since 0.54.1.
> > >
> > > Thomas
> > > --
> > > Thomas Petazzoni, CTO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > Best Regards,
> >
> > Fabrice
> Best Regards,
>
> Fabrice

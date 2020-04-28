From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Apr 2020 22:09:43 -0600
Subject: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.18.0
In-Reply-To: <ed014e8f-4aa1-1577-7bad-d2068a625dc1@mind.be>
References: <20200303230943.24334-1-james.hilliard1@gmail.com>
 <20200305210537.42d4c081@windsurf>
 <CADvTj4p7bNSX6C+Y6Lo_cuHMT+4ifdJgckm2mEPX1tvyFyMTdQ@mail.gmail.com>
 <0b0b94ef-53a8-3f93-2cc6-09be6b5d318f@mind.be>
 <CADvTj4rWcE615eLkeWeLW-BvXu+4Ruebo-xVLVQRVx=XJKKW6w@mail.gmail.com>
 <ed014e8f-4aa1-1577-7bad-d2068a625dc1@mind.be>
Message-ID: <CADvTj4qqBC9QMqyxvKKVO0+yn7CsG36hSqvf1vu7CEzshaJe2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 25, 2020 at 2:02 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 24/03/2020 19:19, James Hilliard wrote:
> > On Mon, Mar 9, 2020 at 2:12 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 05/03/2020 21:23, James Hilliard wrote:
> >>> On Thu, Mar 5, 2020 at 1:05 PM Thomas Petazzoni
> >>> <thomas.petazzoni@bootlin.com> wrote:
> >>>>
> >>>> Hello James,
> >>>>
> >>>> +Arnout, as there is a meson/pkg-config question.
> >>>>
> >>>> Thanks for the patch. Two questions below.
> >>>>
> >>>> On Tue,  3 Mar 2020 16:09:43 -0700
> >>>> James Hilliard <james.hilliard1@gmail.com> wrote:
> >>>>
> >>>>> diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
> >>>>> index e325c6d752..6de92f63d9 100644
> >>>>> --- a/package/wayland/wayland.mk
> >>>>> +++ b/package/wayland/wayland.mk
> >>>>> @@ -4,7 +4,7 @@
> >>>>>  #
> >>>>>  ################################################################################
> >>>>>
> >>>>> -WAYLAND_VERSION = 1.17.0
> >>>>> +WAYLAND_VERSION = 1.18.0
> >>>>>  WAYLAND_SITE = http://wayland.freedesktop.org/releases
> >>>>>  WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
> >>>>>  WAYLAND_LICENSE = MIT
> >>>>> @@ -13,12 +13,12 @@ WAYLAND_INSTALL_STAGING = YES
> >>>>>  WAYLAND_DEPENDENCIES = host-pkgconf host-wayland expat libffi libxml2
> >>>>>  HOST_WAYLAND_DEPENDENCIES = host-pkgconf host-expat host-libffi host-libxml2
> >>>>>
> >>>>> -# 0002-configure-add-option-to-disable-tests.patch
> >>>>> -WAYLAND_AUTORECONF = YES
> >>>>> +WAYLAND_CONF_OPTS = \
> >>>>> +     -Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
> >>>>
> >>>> Are you sure this is needed since commit
> >>>> 4e0bc29993376613d200e892d491e31ea5a49622 ? Indeed, with this commit,
> >>>> meson is properly able to use pkg-config either for native builds or
> >>>> cross builds.
> >>> It was failing for me without this.
> >>
> >>  That means something is wrong with commit 4e0bc29933.
> > From what I can tell that change is for fixing a different issue.
>
>  Right! I forgot - commit 4e0bc29933 was only handling it for target. For host,
> we would need a native-compilation.conf. I had started on that but didn't finish
> it because I had no package to test it with. Hm, apparently I never even posted
> the WIP on the mailing list...
I managed to get it working properly here:
https://patchwork.ozlabs.org/project/buildroot/patch/20200428040638.122494-1-james.hilliard1 at gmail.com/
>
>  Anyway, good to now that I can test it with weston and wayland packages now.
> When I have time (yeah, right) I can properly test that series.
>
>  Regards,
>  Arnout

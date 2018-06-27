From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Jun 2018 07:35:37 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: needs host-python2
In-Reply-To: <20180627033622.23ouuvp2zvr4cw5y@sapphire.tkos.co.il>
References: <20180626214326.27205-1-fontaine.fabrice@gmail.com>
 <20180627033622.23ouuvp2zvr4cw5y@sapphire.tkos.co.il>
Message-ID: <CAPi7W82WL5MwxnQWri0dg5Ep92fHedomD3XJHLViLGUcr2JwXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch,

2018-06-27 5:36 GMT+02:00 Baruch Siach <baruch@tkos.co.il>:

> Hi Fabrice,
>
> On Tue, Jun 26, 2018 at 11:43:26PM +0200, Fabrice Fontaine wrote:
> > gnuradio needs host-python2 however there is no way to enforce this so
> > add a dependency on !BR2_PACKAGE_PYTHON3.
> > Indeed, if BR2_PACKAGE_PYTHON3 is selected, then buildroot will only
> > build host-python3.
>
> Why not just add host-python to _DEPENDENCIES?
>
Indeed, I will update my patch. Thanks for your help.

>
> baruch
>
> > This issue was not raised in the previous version of gnuradio as
> > host-python-cheetah was the only dependency and host-python-cheetah
> > enforces python2 through HOST_PYTHON_CHEETAH_NEEDS_HOST_PYTHON however
> > we now have host-python-six and host-python-mako dependencies and it
> > does not seem right to enforces python2 on those packages
> >
> > Fixes:
> >  - http://autobuild.buildroot.net/results/a502fef3e2a40f38ca63332440b0b6
> bd2ed11d5a
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/gnuradio/Config.in | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> > index f748b902a7..25131fb105 100644
> > --- a/package/gnuradio/Config.in
> > +++ b/package/gnuradio/Config.in
> > @@ -1,5 +1,6 @@
> >  comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic
> library"
> >       depends on BR2_USE_MMU
> > +     depends on !BR2_PACKAGE_PYTHON3
> >       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> >               !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> >
> > @@ -10,6 +11,7 @@ config BR2_PACKAGE_GNURADIO
> >       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> >       depends on BR2_USE_MMU # use fork()
> >       depends on BR2_USE_WCHAR # boost
> > +     depends on !BR2_PACKAGE_PYTHON3
> >       select BR2_PACKAGE_BOOST
> >       select BR2_PACKAGE_BOOST_DATE_TIME
> >       select BR2_PACKAGE_BOOST_FILESYSTEM
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--
> Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180627/4a151f11/attachment.html>

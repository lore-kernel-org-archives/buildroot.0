From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Jul 2015 23:04:01 +0300
Subject: [Buildroot] [PATCH 1/1] package/exfat-utils: fix compilation
 error with musl
In-Reply-To: <CA+BsyQ6yfCRKAHpMq2Y68N9DSKrD3z20jBzfWgmSdqnTjXEk4w@mail.gmail.com>
References: <1437932111-411-1-git-send-email-brendanheading@gmail.com>
 <20150726193803.GB17029@tarshish>
 <CA+BsyQ6yfCRKAHpMq2Y68N9DSKrD3z20jBzfWgmSdqnTjXEk4w@mail.gmail.com>
Message-ID: <20150726200401.GF17029@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brendan,

On Sun, Jul 26, 2015 at 08:59:36PM +0100, Brendan Heading wrote:
> > > --- a/package/exfat-utils/Config.in
> > > +++ b/package/exfat-utils/Config.in
> > > @@ -1,5 +1,6 @@
> > >  config BR2_PACKAGE_EXFAT_UTILS
> > >       bool "exfat-utils"
> > > +     select BR2_PACKAGE_LIBFUSE
> > >       depends on BR2_USE_WCHAR
> >
> > Please propagate BR2_PACKAGE_LIBFUSE dependencies.
> 
> Baruch,
> 
> Sorry .. can you define "propagate" ?

Just copy the dependencies of BR2_PACKAGE_LIBFUSE to BR2_PACKAGE_EXFAT_UTILS. 
See the explanation at http://nightly.buildroot.org/manual.html#_config_files 
under "Choosing depends on or select".

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

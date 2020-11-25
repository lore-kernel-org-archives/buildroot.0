From: Christian Stewart <christian@paral.in>
Date: Tue, 24 Nov 2020 18:06:46 -0800
Subject: [Buildroot] [PATCH v4 3/5] package/libnvidia-container: new
 package
In-Reply-To: <5f5c5a57-72c4-d7c9-5395-9042b49a5441@gmail.com>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-3-christian@paral.in>
 <5f5c5a57-72c4-d7c9-5395-9042b49a5441@gmail.com>
Message-ID: <CA+h8R2qSLSRKj9XLzhmBPvTpeBp6b1EuqQ+dhN0X+do78zG0iw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,


On Sat, Nov 21, 2020 at 2:55 AM Romain Naour <romain.naour@gmail.com> wrote:
> Le 19/11/2020 ? 08:53, Christian Stewart a ?crit :
> > The libnvidia-container package adds a library and CLI for GPU-backed
> > containers, agnostic to container runtime.
> >
> > https://github.com/NVIDIA/libnvidia-container


> > +Subject: [PATCH] Build fixes from vowstar portage overlay
> > +
> > +This commit brings in build fixes written by @vowstar in the overlay:
> > +
> > +https://github.com/vowstar/vowstar-overlay/tree/master/app-emulation/libnvidia-container/files
> > +
> > +Signed-off-by: Christian Stewart <christian@paral.in>
> > +---
>
> This is really a huge patch...

The patches bringing in the header files for nvidia-modprobe can
actually be referenced in the staging headers directory.

So I can remove this massive patch by doing the following:

 - Add build dependency on nvidia-modprobe
 - Add staging dir to header search path

Then the headers will be sourced from nvidia-modprobe source tree instead

>
> > diff --git a/package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch b/package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch
> > new file mode 100644
> > index 0000000000..d4ba9dfe80
> > --- /dev/null
> > +++ b/package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch
> > @@ -0,0 +1,698 @@
> > +From 6752d8d5e315eb3f061498a9c35558f90f9600e2 Mon Sep 17 00:00:00 2001
> > +From: Christian Stewart <christian@paral.in>
> > +Date: Sat, 18 Jul 2020 15:26:22 -0700
> > +Subject: [PATCH] Remove dependency handling from Makefile
> > +
> > +Buildroot will handle this for the makefile.
> > +
> > +Signed-off-by: Christian Stewart <christian@paral.in>
> > +---
>
> Same

I don't see how to avoid this patch.

At the moment I will look into removing these large patches from the
series, add the /usr/include/tirpc directory to the
libnvidia-container compile header search path, and re-test using
BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64.

Best,
Christian

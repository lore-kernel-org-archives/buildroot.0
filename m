From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Mar 2020 19:04:46 +0100
Subject: [Buildroot] [git commit] boot/barebox: license files hashes
 only valid for latest version
In-Reply-To: <CAGm1_kvY1+5QbCX=vTB6AYRVESTVntm9AT+1tiSVifV8jH8Qyg@mail.gmail.com>
References: <20200206193221.B87B38D427@busybox.osuosl.org>
 <CAGm1_kvY1+5QbCX=vTB6AYRVESTVntm9AT+1tiSVifV8jH8Qyg@mail.gmail.com>
Message-ID: <20200319180446.GH10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2020-03-19 14:32 +0100, Yegor Yefremov spake thusly:
> On Thu, Feb 6, 2020 at 8:44 PM Peter Korsgaard <peter@korsgaard.com> wrote:
> > We can only know the details of the license files for known versions.  For
> > custom, older or newer versions, the license files may change, or may be
> > moved around.
> >
> > So, do for Barebox as was done for ATF, linux, and linux-headers, and
> > only define the list of license files for the latest version.
[--SNIP--]
> > diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> > index 52178d89c8..f11f9950d1 100644
> > --- a/boot/barebox/barebox.mk
> > +++ b/boot/barebox/barebox.mk
> > @@ -33,7 +33,9 @@ endif
> >
> >  $(1)_DEPENDENCIES = host-lzop
> >  $(1)_LICENSE = GPL-2.0 with exceptions
> > +ifeq ($(BR2_TARGET_BAREBOX_LATEST_VERSION),y)
> >  $(1)_LICENSE_FILES = COPYING
> > +endif
> >
> >  $(1)_CUSTOM_EMBEDDED_ENV_PATH = $$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH))
> 
> This approach works with barebox. But when I also use barebox-aux from
> git (for am335x), I get the following error:
> 
> ERROR: No hash found for barebox-aux-1e23cf5c7b71c29cc8dd7b0c5b80929d286b554e.tar.gz

This error is not about the hash files, but about the actual downloaded
tarball, while the patch you are replying to is about the hash of the
license file.

Care to provide a defconfig, or even just the URL to that git repo,
please?

Regards,
Yann E. MORIN.

> package/pkg-generic.mk:167: recipe for target
> '/home/user/buildroot/bsp-experimental/build/barebox-aux-1e23cf5c7b71c29cc8dd7b0c5b80929d286b554e/.stamp_downloaded'
> failed
> make[1]: *** [/home/user/buildroot/bsp-experimental/build/barebox-aux-1e23cf5c7b71c29cc8dd7b0c5b80929d286b554e/.stamp_downloaded]
> Error 1
> Makefile:84: recipe for target '_all' failed
> make: *** [_all] Error 2
> 
> Any idea how to fix this?
> 
> Yegor

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun, 15 Sep 2019 09:45:50 -0700
Subject: [Buildroot] [PATCH 15/27] package/smartmontools: bump to
 version 7.0
In-Reply-To: <20190915162255.740e79a6@windsurf.home>
References: <20190908161159.26692-1-chrismcc@gmail.com>
 <20190915162255.740e79a6@windsurf.home>
Message-ID: <CALURroQW-f5bZi0qgjW20B=-Oj945z11mdq7jzQoWz0rokrzMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My free time comes and goes. I should have some free time mid week to give
it a shot


On Sun, Sep 15, 2019, 7:22 AM Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Christopher,
>
> On Sun,  8 Sep 2019 09:11:59 -0700
> Christopher McCrory <chrismcc@gmail.com> wrote:
>
> > +# Work around broken configure check.
> > +ifneq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> > +SMARTMONTOOLS_CONF_OPTS += CXXFLAGS="$(TARGET_CXXFLAGS)
> -fno-stack-protector"
> > +endif
>
> Could you instead fix the configure.ac, by using AC_LINK_IFELSE()
> instead of AC_COMPILE_IFELSE() to check for the availability of
> -fstack-protector ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190915/25064bb3/attachment.html>

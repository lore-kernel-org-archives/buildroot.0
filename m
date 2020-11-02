From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Mon, 2 Nov 2020 07:12:10 +0100
Subject: [Buildroot] [PATCH 6/8] package/optee-test: bump to version
 3.11.0
In-Reply-To: <20201031230043.21190d90@windsurf>
References: <20201030075045.6960-1-etienne.carriere@linaro.org>
 <20201030075045.6960-6-etienne.carriere@linaro.org>
 <20201031230043.21190d90@windsurf>
Message-ID: <CAN5uoS_wka2VDe8qEV=_4Nq=Xr+Jh5C+6AEva-PaQ6Wv5u72vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 31 Oct 2020 at 23:00, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 30 Oct 2020 08:50:43 +0100
> Etienne Carriere <etienne.carriere@linaro.org> wrote:
>
> > -     depends on !BR2_TOOLCHAIN_HAS_THREADS
> > +     depends on !BR2_TOOLCHAIN_HAS_THREAD
>
> You introduced a typo here by dropping the S.
>
> > +     depends on !BR2_INSTALL_LIBSTDCPP
>
> And this should have been:
>
>         depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
>
> indeed, the way you had written the conditions, the comment would only
> displayed if the toolchain does not have threads *and* does not have
> C++. But what we want is the comment to appear when the toolchain does
> not have threads *or* does not have C++.
>
> I fixed that up when applying. Thanks!

Understood.
Thanks for the fixes and for applying the changes.

Regards,
Etienne

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Oct 2020 15:05:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/pistache: force Release mode
In-Reply-To: <20201017145658.45f593d5@windsurf>
References: <20200516121935.1235445-1-fontaine.fabrice@gmail.com>
 <20201017145658.45f593d5@windsurf>
Message-ID: <CAPi7W83=64X9fUthHY1fJ8wWDQi6L999BJrv7jLZYW4geZne+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 17 oct. 2020 ? 14:56, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sat, 16 May 2020 14:19:35 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > +# Force Release to fix build failure without SSP
> > +PISTACHE_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release
>
> In some packages, we use CMAKE_BUILD_TYPE=Buildroot, and in others
> CMAKE_BUILD_TYPE=Release. Should we take a decision on which one makes
> the most sense ?
Release is a standard cmake value
(https://cmake.org/cmake/help/v3.0/variable/CMAKE_BUILD_TYPE.html). It
is "forced" in 5 packages.
Buildroot is not standard and is used by only 2 packages.
So I would vote for Release.
More globally, perhaps we should always set CMAKE_BUILD_TYPE to
Release in pkg-cmake independently of the BR2_ENABLE_DEBUG value.
This would allow us to remove all those workarounds.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice

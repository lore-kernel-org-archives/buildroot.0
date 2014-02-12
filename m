From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Feb 2014 13:47:16 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAXf6LV6FZJ_KdxjEZ83550vM4V8n-zaRfieZJusfdKVYxyOAg@mail.gmail.com>
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <20140212093245.49e2b6ac@skate>
 <CAAXf6LXjfkZ=3_fFPowo3k2HHyUkSpiHnOfGG=HS=0icjYBXhA@mail.gmail.com>
 <20140212104745.61ea39bd@skate>
 <CAAXf6LUDUyWxQ_cf2+TapCcSoB0=HRs2_413MH_FCXN56C3R_Q@mail.gmail.com>
 <CAAXf6LXTF0XKg-pBGKhDmxV+VPULPSxhJm84UnfzUH=kGa3MNA@mail.gmail.com>
 <CAAXf6LVVkFtkFiL-9AD918JTeTPf4zgUf=RQsp4XZUOBVUaTDQ@mail.gmail.com>
 <20140212133153.7995b73a@skate>
 <CAAXf6LV6FZJ_KdxjEZ83550vM4V8n-zaRfieZJusfdKVYxyOAg@mail.gmail.com>
Message-ID: <20140212134716.523aa19f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 12 Feb 2014 13:44:05 +0100, Thomas De Schampheleire wrote:

> In alsa-utils, configure.in contains the following line:
> AM_PATH_ALSA(1.0.24)
> 
> This macro is defined in aclocal.m4, and I want to change that,
> because this is where the -ldl is added unconditionally.
> 
> So, if aclocal uses configure.in to generate aclocal.m4, the real
> definition of AM_PATH_ALSA must be somewhere else (outside the
> alsa-utils sources).
> 
> So how to change the AM_PATH_ALSA ?

AM_PATH_ALSA is defined in the alsa-lib source code, utils/alsa.m4. So
when we install alsa-lib, it should also install alsa.m4
in $(STAGING_DIR)/usr/share/aclocal, so that when the autoreconf of
alsa-utils is done, it finds it.

BTW, what about joining #buildroot on IRC to do live discussion ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

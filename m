From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 May 2019 08:29:10 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: add libunwind optional
 dependency
In-Reply-To: <20190515204721.18722-2-fontaine.fabrice@gmail.com>
References: <20190515204721.18722-1-fontaine.fabrice@gmail.com>
 <20190515204721.18722-2-fontaine.fabrice@gmail.com>
Message-ID: <20190516082910.5ed9ab2c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Wed, 15 May 2019 22:47:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +_Unwind_GetIP is used in build_stack_trace however this function can be
> +provided by libunwind so check for it to avoid the following build
> +failure:
> +
> +/home/buildroot/autobuild/run/instance-1/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.4.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ./.libs/libmini.a(libmini_la-mini-exceptions.o): in function `build_stack_trace':
> +/home/buildroot/autobuild/run/instance-1/output/build/mono-5.20.1.27/mono/mini/mini-exceptions.c:365: undefined reference to `_Unwind_GetIP'
> +collect2: error: ld returned 1 exit status

I am really not familiar with _Unwind_GetIP, and I haven't done much
research, but it seems like _Unwind_GetIP is also provided by libgcc.

Did you make some further research to understand what is
_Unwind_GetIP ? Or was your analysis just based on "mono needs
_Unwind_GetIP, it's provided by libunwind, let's link with it" ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

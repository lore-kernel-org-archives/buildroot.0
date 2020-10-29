From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Oct 2020 23:36:00 +0100
Subject: [Buildroot] [PATCH 1/3] package/libabseil-cpp: enforce C++11
In-Reply-To: <20201027174046.17157-2-buildroot@heine.tech>
References: <20201027174046.17157-1-buildroot@heine.tech>
 <20201027174046.17157-2-buildroot@heine.tech>
Message-ID: <20201029233600.4b2c8bd8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Oct 2020 18:40:44 +0100
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> From: Michael Nosthoff <buildroot@heine.tech>
> 
> For gcc < 6 the c++ default is 98. Abseil needs@least 11
> but doesn't enforce this anymore. So we need to do this.
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Is this fixing a build issue? What was the thing that made you write
this patch?

> +# abseil needs c++ >= 11 but doesn't set this anymore,
> +# before gcc6 the default is 98.
> +ifeq ($(BR2_GCC_AT_LEAST_6_0),)
> +LIBABSEIL_CPP_CONF_OPTS += -DCMAKE_CXX_STANDARD=11
> +endif
> +
> +ifeq ($(BR2_HOST_GCC_AT_LEAST_6_0),)
> +HOST_LIBABSEIL_CPP_CONF_OPTS += -DCMAKE_CXX_STANDARD=11
> +endif

Can we do it unconditionally ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

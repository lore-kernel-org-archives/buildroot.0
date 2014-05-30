From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 May 2014 09:30:59 -0300
Subject: [Buildroot] [PATCH v6 3/3] Add an BR2_GCC_ENABLE_GRAPHITE flag
 for the buildroot toolchain
In-Reply-To: <BLU436-SMTP1389119D64FEA33BF25D8E5A8320@phx.gbl>
References: <1400528893-4483-1-git-send-email-scjthm@live.com>
 <BLU436-SMTP1389119D64FEA33BF25D8E5A8320@phx.gbl>
Message-ID: <53887A03.90001@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/19/2014 04:48 PM, Steve Thomas wrote:
> +ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
> +HOST_GCC_COMMON_DEPENDENCIES += \
> +   host-isl \
> +   host-cloog
> +
> +#This is needed as with-isl doesn't work
> +HOST_GCC_COMMON_CONF_OPT += \
> +   --disable-isl-version-check
> +endif

Hi.
Hidden option?
How about adding something like:

config BR2_GCC_ENABLE_GRAPHITE
        bool "Enable graphite loop optimizations"
        depends on BR2_GCC_SUPPORTS_GRAPHITE
        help
          Enable the support for the framework for loop optimizations
          based on a polyhedral intermediate representation.

...to package/gcc/Config.in.host before BR2_GCC_ENABLE_TLS ?
Regards.

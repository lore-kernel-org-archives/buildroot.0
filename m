From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jul 2013 10:04:29 +0200
Subject: [Buildroot] [PATCH] package/iozone: Build non-threads version
 if !BR2_PTHREADS_NATIVE
In-Reply-To: <1373615072-5258-1-git-send-email-mjonker@synopsys.com>
References: <1373615072-5258-1-git-send-email-mjonker@synopsys.com>
Message-ID: <20130712100429.7950ace7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Fri, 12 Jul 2013 09:44:32 +0200, Mischa Jonker wrote:

>  # No threading target is non-AIO as well
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> +ifeq ($(BR2_PTHREADS_NATIVE),)
>  IOZONE_TARGET = linux-noth
>  # AIO support not available on uClibc, use the linux (non-aio) target.
>  else ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)

BR2_PTHREADS_NATIVE is a Config.in option that only makes sense in the
context of the internal toolchain backend. So any usage of it in
package/ is going to not be suitable for external toolchain usage. So
your change, as is, would disable thread support in IOZone for any
external toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

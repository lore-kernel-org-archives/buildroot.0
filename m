From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 12:05:43 +0200
Subject: [Buildroot] [PATCH] ext-toolchain: MIPS: Select correct
 endianness for the target
In-Reply-To: <1381744345-8306-1-git-send-email-markos.chandras@imgtec.com>
References: <1381744345-8306-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <20131014120543.267c23a7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Mon, 14 Oct 2013 10:52:25 +0100, Markos Chandras wrote:
> +ifeq ($(BR2_mipsel)$(BR2_mips64el),y)
> +ifeq ($(BR2_ENDIAN),"LITTLE")

If we're on mipsel or mips64el, we're always little endian, right? So
maybe the test on BR2_ENDIAN isn't that useful? :-)

> +TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_MIPS_TARGET_LITTLE_ENDIAN
> +TOOLCHAIN_EXTERNAL_CFLAGS += -EL
> +endif
> +endif

Should we do it for -EB as well? Or do we consider because the Sourcery
toolchain defaults to big endian we don't need to explicit -EB ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

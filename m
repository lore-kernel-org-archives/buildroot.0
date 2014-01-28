From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 22:57:31 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: Fix EABIhf check
In-Reply-To: <1389687696-4824-1-git-send-email-stefan.sorensen@spectralink.com>
References: <1389687696-4824-1-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <20140128225731.103edf8a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan S?rensen,

On Tue, 14 Jan 2014 09:21:34 +0100, Stefan S?rensen wrote:
> Currently the check for EABI/EABIhf toolchains looks for the
> Tag_ABI_VFP_args attribute in the crt1.o file which gcc adds
> in a EABIhw toolchain. The crt1.o is however often not compiled
> from c but assembler, and will then always failt he EABIhf check.

Do you have details about this? Because the crt1.o trick was actually
tested by me on several toolchains, and it was indeed working.

> +	TEMP_C_FILE=`mktemp --tmpdir --suffix=.c`; \
> +	touch $${TEMP_C_FILE}; \
> +	$${__CROSS_CC} -c -o $${TEMP_C_FILE}.o $${TEMP_C_FILE}; \

If all you need is build an empty source file, then you do not even
need to create a temporary .c file:

	gcc -x c -c -o toto.o /dev/null

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

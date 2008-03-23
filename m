From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 23 Mar 2008 23:57:57 +0200 (EET)
Subject: [Buildroot] [PATCH] Add thumb support to buildroot for the ARM
 architecture
In-Reply-To: <20080322131902.1b4a74bf@crazy>
References: <20080312090846.2cfecec8@crazy> <20080314090331.11f1bddc@crazy>
	<47DA7E94.2070302@promwad.com> <20080314141929.006a424d@crazy>
	<20080314145655.3c119daa@crazy>
	<59110.195.222.79.169.1206184018.squirrel@webmail.promwad.com>
	<20080322131902.1b4a74bf@crazy>
Message-ID: <34487.195.222.88.127.1206309477.squirrel@webmail.promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Sure I had CONFIG_EABI enabled.

I tried to apply your patch - when ucLibc is configured ( BR2_UCLIBC_CONFIG=toolchain/uClibc/uClibc-0.9.29.config )
it is asking Target File Format:
1. FDPIC ELF
2. STATIC FLAT
3. STATIC FLAT (sep-data)
4. SHARED FLAT

What did you choose? If I choose FDPIC ELF I'm getting unrecognized command line option "-mfdpic" - when
arm-linux-gcc is trying to build uClibc.

Regards,
Ivan


>> I compiled for ARM_920T & EABI & SOFTFLOAT.
>> I checked busybox binary ( arm-linux-objdump ) - there is no blx
>> instruction. Seems all these ARM troubles were related to avr32
>> patches (see recent posts in mailing list) because yesterday finally
>> I managed to build working rootfs.
>
> Hum, maybe.
>
>> However busybox binary seems resulted in OABI format because when
>> in kernel disable OABI_COMPAT - rootfs does not boot.
>
> Do you have CONFIG_EABI=y in your buildroot config file ?
>
> But anyway, do you confirm that my patch works ?
>
> Sincerly,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Free Embedded Linux Training Materials
> on http://free-electrons.com/training
> (More than 1500 pages!)
>

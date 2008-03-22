From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 22 Mar 2008 13:06:58 +0200 (EET)
Subject: [Buildroot] [PATCH] Add thumb support to buildroot for the ARM
 architecture
In-Reply-To: <20080314145655.3c119daa@crazy>
References: <20080312090846.2cfecec8@crazy> <20080314090331.11f1bddc@crazy>
	<47DA7E94.2070302@promwad.com> <20080314141929.006a424d@crazy>
	<20080314145655.3c119daa@crazy>
Message-ID: <59110.195.222.79.169.1206184018.squirrel@webmail.promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I compiled for ARM_920T & EABI & SOFTFLOAT.
I checked busybox binary ( arm-linux-objdump ) - there is no blx instruction.
Seems all these ARM troubles were related to avr32 patches (see recent posts in mailing list) because
yesterday finally I managed to build working rootfs. However busybox binary seems resulted
 in OABI format because when in kernel disable OABI_COMPAT - rootfs does not boot.

BR,
Ivan


> Le Fri, 14 Mar 2008 14:19:29 +0100,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
>
>> However, there is quite a big difference between your S3C2440 real
>> hardware and the Qemu versatilepb emulation. S3C2440 is based on 920T
>> as you say, which supports the ARMv4T ISA. But the versatilepb
>> emulation of Qemu emulates an ARM926EJ-S CPU, which supports the
>> ARMv5TEJ ISA. And as far as I understood, there are some differences
>> in the ARM <-> Thumb switch capabilities between ARMv4T and ARMv5T.
>
> In particular, from the ARM architecture manual:
>
> ?
> BL (H == 10 and H == 11 forms) is in all T variants.
> BLX (H == 01 form) is in T variants of ARMv5 and above.
> ?
>
> So on your S3C2440, the 'blx' instruction is not supported. And this
> instruction can especially be used to do interworking. So if gcc
> generated this instruction, it of course will fail with the "illegal
> instruction" exception.
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

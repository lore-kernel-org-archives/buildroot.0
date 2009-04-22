From: Laine Walker-Avina <lwalkera@ieee.org>
Date: Wed, 22 Apr 2009 09:31:34 -0700
Subject: [Buildroot] PXA270 and gcc-4.3.3 for iwMMXt
In-Reply-To: <dfb660300904220929r41351171x258cee3484cd8f@mail.gmail.com>
References: <dfb660300904220908x17502c02xad3358a6c64cb3f9@mail.gmail.com>
	<20090422161456.GD19863@buzzloop.caiaq.de>
	<dfb660300904220929r41351171x258cee3484cd8f@mail.gmail.com>
Message-ID: <dfb660300904220931s4549c459r9ba9ab956c7b4eff@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 22, 2009 at 9:14 AM, Daniel Mack <daniel@caiaq.de> wrote:
> Check that your kernel and toolchain binaries are both built for EABI
> and check for the following entries in your busybox .config:
>
> BR2_iwmmxt=y
> BR2_ARM_TYPE="ARM_IWMMXT"
> # BR2_ARM_OABI is not set
> BR2_ARM_EABI=y
> BR2_ARCH="arm"
> BR2_ENDIAN="LITTLE"
> BR2_GCC_TARGET_TUNE="iwmmxt"
> BR2_GCC_TARGET_ARCH="iwmmxt"
> BR2_GCC_TARGET_ABI="aapcs-linux"
>
> What you describe to see is very likely that kind of problem, we had
> that many times already. The above settings should do well, though.
>
> Daniel

All of the above is the same as my config. I'm attaching the .config
for the kernel and buildroot; please let me know if there's anything
you see wrong.

-Laine
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 26928 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090422/ef6690e5/attachment-0001.obj>

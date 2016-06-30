From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Jun 2016 19:47:21 -0300
Subject: [Buildroot] [PATCH 0/8] Re-organize Qemu MIPS defconfigs
In-Reply-To: <1467198275-46657-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1467198275-46657-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <5775A179.4050607@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/06/16 08:04, Vicente Olivert Riera wrote:

> This patch renames the existing Qemu MIPS defconfigs in order to have a
> name format that allows a better organization if more defconfigs are
> added for different MIPS variants.
>
> After that it adds Qemu MIPS defconfigs for mips-32r6 and mips-64r6,
> both big and little endian.

Hi Vicente.
Wouldn't it be better to compose the arch + cpu combo without the 
underscore? Otherwise it looks a bit noisy.
Something like qemu_mipsel64r6_malta_defconfig for example instead of 
qemu_mipsel_64r6_malta_defconfig.
Also the MSA patches can be dropped if you use kernel 4.6.2+ since it's 
upstream (hence use 4.6.3).
Other than that it looks great.
Regards.

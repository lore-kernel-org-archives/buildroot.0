From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Dec 2017 11:31:26 +1030
Subject: [Buildroot] musl and linux-tool-gpio
Message-ID: <CACPK8Xc7=f_p8Ws4u4yYn3yx_63AXP8XaWELiy49M2K459AaeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello buildroot,

I was trying to create an ARM image that used a musl libc and contains
the Linux gpio tools. It fails to build as tools/gpio/gpio-event-mon.c
requires but does not directly include sys/types.h for the u_int32_t
types.

On a glibc system sys/types.h appears to be included through unistd.h.

I've sent a patch to the kernel:

 https://patchwork.kernel.org/patch/10126851/

How do I fix this for buildroot? We could disable the gpio tools for
kernels that do not include this fix. Or we could disable the tools
for musl builds.

Better would be to patch the kernel build in buildroot, but it appears
that patches can't be added to linux-tools in the same way as other
packages.

Which solution should we go with?

Cheers,

Joel

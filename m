From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 07 Dec 2011 09:34:49 +0100
Subject: [Buildroot] Real time Linux implementation
In-Reply-To: <20111203120816.4c0f862a@skate>
References: <CAO6BqMXyye4TFHf0Pxc99Naq28wWg1ne=--q=e+VmfvPVuwD3w@mail.gmail.com>
 <4ED91A0B.10403@relinux.de> <20111203000854.6dcc2764@skate>
 <201112030453.45164.minimod@morethan.org> <20111203120816.4c0f862a@skate>
Message-ID: <4EDF2529.60003@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/2011 12:08, Thomas Petazzoni wrote:
> For extensions like Xenomai and RTAI, I think having Buildroot
> integration make sense because those extensions have userspace parts
> that need to be compiled and integrated to the root filesystem.
>
> For something like PREEMPT_RT, which is "only" a kernel patch, the need
> for integration in Buildroot is a bit less important, in my opinion.
> You can just manage your kernel tree outside of Buildroot (choosing the
> right kernel version, applying the right PREEMPT_RT patch set), and
> then tell Buildroot to use that particular kernel source tree.

Thomas is right. To use PREEMPT_RT with Buildroot a:
    BR2_LINUX_KERNEL_CUSTOM_VERSION=y
    BR2_LINUX_KERNEL_VERSION="3.0.12"
   
BR2_LINUX_KERNEL_PATCH="http://www.kernel.org/pub/linux/kernel/projects/rt/3.0/patch-3.0.12-rt29.patch.bz2"
is enough.
Ok, this implies that the user knows what he wants to do, but this is
generally the case when using PREEMPT-RT as this patch is only available
for a restricted number of Linux kernel versions.

Regards,
Julien

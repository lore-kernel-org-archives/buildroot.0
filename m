From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri, 24 May 2019 16:25:48 +0300
Subject: [Buildroot] [PATCH v1] package/busybox: Avoid "can't create
 /proc/sys/kernel/hotplug" error
In-Reply-To: <87pno8qol1.fsf@dell.be.48ers.dk>
References: <20190523131444.36058-1-andriy.shevchenko@linux.intel.com>
 <87ftp5s0k6.fsf@dell.be.48ers.dk> <87pno8qol1.fsf@dell.be.48ers.dk>
Message-ID: <20190524132548.GU9224@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 24, 2019 at 09:49:30AM +0200, Peter Korsgaard wrote:
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
> >>>>> "Andy" == Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
>  >> At runtime on most of the modern kernels [1] S10mdev script produces an error:
>  >> /etc/init.d/S10mdev: line 9: can't create /proc/sys/kernel/hotplug: nonexistent directory
> 
>  >> since the commit
> 
>  >> caae7fa1d737 ("busybox: register mdev as hotplug helper when selected")
> 
>  >> added it unconditionally.
> 
>  >> Check the presence of procfs node before writing to it.
> 
>  >> [1]: Linux kernels with the commit
>  >> 86d56134f1b6 ("kobject: Make support for uevent_helper optional.")
>  >> applied.
> 
>  > But how can mdev work on such setups?

At least the script is used to initialize modules at the boot time.
What happens afterwards I didn't investigate. I have no such issues.

> To be clear, if mdev needs CONFIG_UEVENT_HELPER=y for hotplug
> notifications, then we should rather force that in linux/linux.mk and
> mention the dependency in the mdev help text rather than silently not
> having hotplug work.
> 
> I have marked this patch as changes requested in patchwork.

Kernel can be built outside of Buildroot. Still this needs to be fixed.

-- 
With Best Regards,
Andy Shevchenko

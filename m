From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 09:42:45 +0100
Subject: [Buildroot] Inappropriate ioctl - hwclock
In-Reply-To: <SNT119-W1972A4A3A479929AD85F7882F00@phx.gbl>
References: <SNT119-W1972A4A3A479929AD85F7882F00@phx.gbl>
Message-ID: <20110114094245.78bf04ff@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Jan 2011 09:55:41 +0000
Johnny Beardsmore <jny0@hotmail.com> wrote:

> I've copied the hwclock and rtc files onto my architecture, but when I call hwclock, I get the following message:
>  
> RTC_RD_TIME: Inappropriate ioctl for device
> ioctl() to /dev/misc/rtc to read the time failed.
>  
> Any ideas what I've done wrong?

This is not really Buildroot related, but anyway.

Are you sure that /dev/misc/rtc is a really a RTC device ? The
RTC_RD_TIME ioctl() is implemented in the core RTC infrastructure of
the kernel, so it looks like you're not talking to the right device, or
using a really really old version of the kernel that didn't support
this ioctl(). Or that your kernel lacks RTC support completely.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

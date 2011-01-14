From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 14 Jan 2011 09:53:45 +0100
Subject: [Buildroot] Inappropriate ioctl - hwclock
In-Reply-To: <20110114094245.78bf04ff@surf>
References: <SNT119-W1972A4A3A479929AD85F7882F00@phx.gbl>
	<20110114094245.78bf04ff@surf>
Message-ID: <4D300F19.70704@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 14.01.2011 09:42, schrieb Thomas Petazzoni:
> On Thu, 13 Jan 2011 09:55:41 +0000
> Johnny Beardsmore <jny0@hotmail.com> wrote:
> 
>> I've copied the hwclock and rtc files onto my architecture, but when I call hwclock, I get the following message:
>>  
>> RTC_RD_TIME: Inappropriate ioctl for device
>> ioctl() to /dev/misc/rtc to read the time failed.
>>  
>> Any ideas what I've done wrong?
> 
> This is not really Buildroot related, but anyway.
> 
> Are you sure that /dev/misc/rtc is a really a RTC device ? The
> RTC_RD_TIME ioctl() is implemented in the core RTC infrastructure of
> the kernel, so it looks like you're not talking to the right device, or
> using a really really old version of the kernel that didn't support
> this ioctl(). Or that your kernel lacks RTC support completely.

I agree, /dev/misc/rtc is not a default rtc device. If you look at the kernel RTC configuration ("Device Drivers"->"Real Time Clock"), you'll see the following option:

/dev/rtcN (character devices)

Yegor

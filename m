From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Tue, 24 Aug 2010 23:23:54 +0200
Subject: [Buildroot] hwclock doesn't work
In-Reply-To: <29519433.post@talk.nabble.com>
References: <29519433.post@talk.nabble.com>
Message-ID: <4C74386A.4050503@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 24.08.2010 09:39, schrieb JNY:
> When I try to use hwclock on my target system I get the error:
>    
> can't open '/dev/misc/rtc'
> Is there a buildroot option or setting I've not noticed to enable hwclock?
Hi,

Please verify the output of the kernel during bootup. Also accessible 
via "dmesg" after login. Make sure to have some sort of message, which 
confirms to activate a real time clock. Setting up a real time clock 
module is an issue of the kernel. Not buildroot itself.
 >dmesg|grep -i clock
or
 >dmesg|grep -i rtc

Regards,
Marcus

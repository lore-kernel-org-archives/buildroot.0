From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Sep 2010 14:02:03 +0200
Subject: [Buildroot] hwclock again
In-Reply-To: <29603222.post@talk.nabble.com>
References: <29603222.post@talk.nabble.com>
Message-ID: <20100902140203.1cf3a8e6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2 Sep 2010 04:29:07 -0700 (PDT)
JNY <jny0@hotmail.com> wrote:

> I've enabled 
> CONFIG_RTC=y
> CONFIG_GEN_RTC=y
> in linux-2.6.32.9.config and set the environment variable to read
> this file. After building and installing, I still get
> '/dev/misc/rtc': No such file or directory when I use hwclock.
> 
> Why won't the hwclock work?

Because nobody created /dev/misc/rtc. By default, Buildroot uses a
static /dev, so you have to manually add the missing device files.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

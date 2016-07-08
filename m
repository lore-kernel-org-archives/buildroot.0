From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 11:29:41 +0200
Subject: [Buildroot] Config defined package version is always built
In-Reply-To: <CAM+bi4tV3U-JVJkB3YY1pZY7ce12hzqXLZ7x+ebM=JzUdT7=bg@mail.gmail.com>
References: <CAM+bi4tV3U-JVJkB3YY1pZY7ce12hzqXLZ7x+ebM=JzUdT7=bg@mail.gmail.com>
Message-ID: <20160708112941.516fd688@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 8 Jul 2016 11:10:31 +0200, Alvaro Gamez wrote:

> I'm writing a custom package whose version I want to define via menuconfig.
> Thus, I include in Config.in a string config option called
> BR2_PACKAGE_MYPKG_VERSION, and inside mypkg.mk I set MYPKG_VERSION =
> $(BR2_PACKAGE_MYPKG_VERSION)

Use:

MYPKG_VERSION = $(call qstrip,$(BR2_PACKAGE_MYPKG_VERSION))

to remove the double quotes around the string. This might help in
solving your problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

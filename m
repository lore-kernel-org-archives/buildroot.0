From: Hebbar <gururajakr@sanyo.co.in>
Date: Fri, 9 May 2008 22:39:51 -0700 (PDT)
Subject: [Buildroot] x11-input-drivers/xdriver_xf86-input-evdev-1.2.0
 missing inputproto depends
In-Reply-To: <46a136670805090934u308f1d8dufe014f34b4020c60@mail.gmail.com>
References: <17146898.post@talk.nabble.com>
	<46a136670805090922w7d3b2cebqd558f0fad738eea8@mail.gmail.com>
	<46a136670805090934u308f1d8dufe014f34b4020c60@mail.gmail.com>
Message-ID: <17160183.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

Thanks for the reply

i looked at http://xorg.freedesktop.org/releases/individual/driver and found
xf86-input-evdev-1.2.0.tar.bz2. so i updates the version to 1.2.0

i am trying to build X11r7 (BR2_PACKAGE_XSERVER_x11r7=y)

>>The problem is probably not where it is installed, but rather how
pkgconfig is gathering it's information >>about the X11 headers. Look at the
xf86-input-evdev config.log or inside the configure script to see >>what's
happening. You can also try adding CFLAGS="-I$(STAGING_DIR)/usr/include/X11"
to the >>CONF_OPTS in the buildroot makefile for xf-86-input-evdev

The point is that the required header files are not installed at-all inside
staging_dir/usr/include/X11.  Yesterday i made few more research and found
that the headers file required ( by xdriver-xf86-input-evdev,
xdriver-xf86-video-fbdev) are not installed to staging_dir/usr/include/X11
from xserver-xorg-server-1.4, since all these header files come under
install-sdkHeader make option. which are not called atall during make.

>>Also, I don't think you'll have any success building it for an ARM target
either,
>>as there is no PC compatible PCI bus on it, which is required for the
>>drivers and xorg server itself.

Yes u r correct. So i have to see if any other solution exists to solve this
to solve this. 

Also i have added a few patches to my xserver-xorg-server build
package.(enable tslib to find proper device, enable xcalibrate, proper
pkgconfig-fix, keyboard updates, fbdev updates and alike) . If you wish i
can forward the same to the list.

Regards
Gururaja

-- 
View this message in context: http://www.nabble.com/x11-input-drivers-xdriver_xf86-input-evdev-1.2.0-missing-inputproto-depends-tp17146898p17160183.html
Sent from the BuildRoot mailing list archive at Nabble.com.

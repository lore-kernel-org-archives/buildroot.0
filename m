From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 11:41:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/hidapi: select glibc gconv libs
 copy
In-Reply-To: <1529257913-9183-1-git-send-email-danwalkes@trellis-logic.com>
 (Dan Walkes's message of "Sun, 17 Jun 2018 17:51:53 +0000")
References: <1529257913-9183-1-git-send-email-danwalkes@trellis-logic.com>
Message-ID: <874lgvh8am.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dan" == Dan Walkes <danwalkes@trellis-logic.com> writes:

 > Hidapi source uses iconv_open UTF-16 conversion [1] which requires
 > gconv libararies when buiding with glibc in order to successfully
 > find serial number, manufacturer and product strings [2].

 > Use select in the config file to autmatically select gconv libararies
 > for inclusion on the target when building with glibc

 > Tested with ./utils/test-pkg -c hidapi.cfg -p hidapi and hidapi.cfg file
 > contents:
 > BR2_PACKAGE_HIDAPI=y
 > BR2_PACKAGE_EUDEV=y
 > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 > BR2_USE_MMU=y
 > BR2_USE_WCHAR=y

 > Also tested on x86-64 build target with application using hidapi

 > [1]: https://github.com/signal11/hidapi/blob/a6a622ffb680c55da0de787ff93b80280498330f/libusb/hid.c#L446
 > [2]: https://www.silabs.com/community/interface/forum.topic.html/cp2114_linux_sta-RtWg

 > Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>
 > Tested-by: Dan Walkes <danwalkes@trellis-logic.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard

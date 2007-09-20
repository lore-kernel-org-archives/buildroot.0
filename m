From: Allan Clark <allanc@chickenandporn.com>
Date: Thu, 20 Sep 2007 08:21:57 +0800
Subject: [Buildroot] libusb now compile - patch
In-Reply-To: <12788591.post@talk.nabble.com>
References: <a63ecaf0709190929h6296331epf5388fc46e0922a1@mail.gmail.com>
	<12788591.post@talk.nabble.com>
Message-ID: <37c712e0709191721r6eb18b51l5c4e9cf53e523ba@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9/20/07, Hebbar <gururajakr@sanyo.co.in> wrote:
>
> Hi Sushi Sensei,
> Thanks for the patch. Now i am able to build libusb. unfortunately when i
> try to build usbutils i get an error saying
>
> <snip>
> checking for usb_get_string_simple in -lusb... no
> configure: error: get libusb 0.1.8 or newer
> make: ***
> [/home/guru/project/original/bldrt/buildroot/build_arm/usbutils-0.72/.configured]
> Error 1

In libusb/libusb.mk, try this change:

<     cp -dpf $(LIBUSB_DIR)/.libs/libusb*.so.* $(TARGET_DIR)/usr/lib
--
>     cp -dpf $(LIBUSB_DIR)/.libs/libusb*.so* $(TARGET_DIR)/usr/lib

notice ".so.*" ==> ".so*" -- this will allow libusb.so to exist, and
perhaps allow the build to continue.  Otherwise, if the libusb.a is
there, and not working, check the build path.

If this doesn't work, in private email, can you send your .config, or
provide a download URL?  I'm curious, and have some time in 16 hours.

Allan
-- 
allanc at chickenandporn.com  "??" http://linkedin.com/in/goldfish
please, no proprietary attachments (http://tinyurl.com/cbgq)

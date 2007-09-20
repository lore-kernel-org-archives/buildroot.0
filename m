From: Rex Luscus <sinestado@gmail.com>
Date: Wed, 19 Sep 2007 23:39:19 -0300
Subject: [Buildroot] libusb now compile - patch 02
In-Reply-To: <12789032.post@talk.nabble.com>
References: <a63ecaf0709190929h6296331epf5388fc46e0922a1@mail.gmail.com>	<12788591.post@talk.nabble.com>	<37c712e0709191721r6eb18b51l5c4e9cf53e523ba@mail.gmail.com>
	<12789032.post@talk.nabble.com>
Message-ID: <46F1DD57.5090403@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to Hebbar and Allan. This is the final patch

Hebbar escribi?:
> Hi Sushi Sensei & Allan,
>
>  Thanks for the support. Here is how i finally was able to build both libusb
> & usbutils. 
>
> 1. Libusb used to build and copy its lib to $(TARGET_DIR)/usr/lib as per
> Sushi patch.
> 2. Allan's pAtch Corrected it for proper Lib file copy
> 3. But i think usbutils was searching for lib in $(STAGING_DIR)/usr/lib for
> libusb library.
> 4. So i manually added below code after (Sushi  + Allan) Patch 
>
>        cp -dpf $(LIBUSB_DIR)/.libs/libusb*.so* $(STAGING_DIR)/usr/lib
>
> and it worked 
>
>
> Thanks for all your support
>
> Regards
> Gururaja
>
>
>   

-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2-libusb.patch
Type: text/x-patch
Size: 612 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070919/6f847dd7/attachment.bin 

From: hartleys <hartleys@visionengravers.com>
Date: Wed, 18 Jun 2008 15:08:07 -0400
Subject: [Buildroot] Problem building usbutils
In-Reply-To: <871w2v9lm9.fsf@macbook.be.48ers.dk>
References: <BD79186B4FD85F4B8E60E381CAEE190918280F@mi8nycmail19.Mi8.com>
	<871w2v9lm9.fsf@macbook.be.48ers.dk>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909182C01@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Finally got it to work. But I really don't understand why this was
necessary.

In ext-tool.mk I changed the following

-	for FILE in `find $${LIB_DIR} -maxdepth 1 -type l -name
"$${LIB}*"`; do \ 
+	for FILE in `find $${LIB_DIR}/ -maxdepth 1 -type l -name
"$${LIB}*"`; do \ 

I have no idea why adding the extra / fixed the problem but at least it
works.

Hartley

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
Korsgaard
Sent: Wednesday, June 18, 2008 1:46 AM
To: hartleys
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Problem building usbutils

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

Hi,

 hartleys> 1) usbutils requires libusb This was the easy one. I just
hartleys> needed to select the libusb package. But, shouldn't the
hartleys> Config.in for usbutils select it automatically?

Yes, fixed in trunk.

 hartleys> 2) configure for usbutils outputs error: get libusb 0.1.8
hartleys> or newer Not sure how to fix this one. The libusb in
hartleys> buildroot is 0.1.12. It built fine and the library is in my
hartleys> build_arm/staging_dir/usb/lib directory. For some reason
hartleys> it's not being found. Can anyone offer so insite on what I
hartleys> might have setup wrong?

Strange, it builds here (i386).

Could you provide more details, please?

--
Bye, Peter Korsgaard

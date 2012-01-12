From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 12 Jan 2012 10:43:38 +0100
Subject: [Buildroot] Error installing  udev  : frugalware ??
In-Reply-To: <87ipkh8hp8.fsf@macbook.be.48ers.dk>
References: <DBC7AF7422C5458EB0B788B267A834FC@JohanW7>
 <87ipkh8hp8.fsf@macbook.be.48ers.dk>
Message-ID: <8E8EC4AEBD4345D2BF6FE26E33A7874A@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I had done not changes, but  I had copied the old release package directory and renamed it udevold

So I had topdir/package/......
                       |udev  (173) 
				|udevold (114)
				|.....

So it seems the buildroot scripts are scanning the package directory and seems to act on it even if it is not included in the
package/Config.in.

Strange, because I did not see anything suspected in the build output.

So I started grep to find out where the frugalware text came from...

Why is the package directory scanned ?

Johan
					
-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: donderdag 12 januari 2012 9:10
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: Error installing udev : frugalware ??

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi
 Sagaert> Using 2011.11 :

 Sagaert> make[1]: Leaving directory `/home/johan/buildroot-2011.11js/output/build/udev-173'

Looks to be the end of 'make install'

 Sagaert> /usr/bin/install -m 0755 package/udev/S10udev /home/johan/buildroot/output/target/etc/init.d

This is UDEV_INSTALL_INITSCRIPT

 Sagaert> /usr/bin/install -m 0644 /home/johan/buildroot/output/build/udev-173/etc/udev/frugalware/*
 Sagaert> /home/johan/buildroot/output/target/etc/udev/rules.d
 Sagaert> /usr/bin/install: cannot stat `/home/johan/buildroot/output/build/udev-173/etc/udev/frugalware/*': No such file or
directory
 Sagaert> make: *** [/home/johan/buildroot/output/build/udev-173/.stamp_target_installed] Error 1

But this isn't. Do you have any local modifications related to this?

-- 
Bye, Peter Korsgaard

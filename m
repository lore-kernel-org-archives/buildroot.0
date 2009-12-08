From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Dec 2009 23:09:53 +0100
Subject: [Buildroot] missing kernel headers when compiling kismet
In-Reply-To: <F9A30328-AECD-494A-A1BB-D28339481F10@hsr.ch> (Marc Egli's
	message of "Tue, 8 Dec 2009 22:27:08 +0100")
References: <A208E45D-08AF-4294-ADEA-4734E3530DDC@hsr.ch>
	<87r5r5on5c.fsf@macbook.be.48ers.dk>
	<0BEC155F-0AE3-43B6-B538-9C024D89964F@hsr.ch>
	<87my1tocab.fsf@macbook.be.48ers.dk>
	<F9A30328-AECD-494A-A1BB-D28339481F10@hsr.ch>
Message-ID: <873a3lnmmm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marc" == Marc Egli <marc.egli@hsr.ch> writes:

 Marc> make clean and make did result in the same error i got before:
 Marc> checking for linux/wireless.h... (cached) no
 Marc> find ./ -name wireless.h gave me:
 Marc> ./output/toolchain/linux-2.6.31.6/include/linux/wireless.h
 Marc> ./output/toolchain/uClibc_dev/usr/include/linux/wireless.h
 Marc> ./output/toolchain/linux/include/linux/wireless.h
 Marc> ./output/build/staging_dir/usr/include/linux/wireless.h
 Marc> ./output/build/linux-2.6.31.6/include/config/wireless.h
 Marc> ./output/build/linux-2.6.31.6/include/linux/wireless.h
 Marc> ./output/build/ifplugd-0.28/src/wireless.h

 Marc> and my config is attached

Hmm, I don't see any issues here with building the network packages you
had enabled (the most obvious ones to check for linux/wireless.h). I see
you have some local lxde packages enabled, maybe one of those checks for
wireless? Could you try temporarily disabling them and doing a clean
rebuild?

-- 
Bye, Peter Korsgaard

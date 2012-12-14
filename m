From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Dec 2012 16:06:37 +0100
Subject: [Buildroot] [PATCH 03/20] package/usbredir: new package
In-Reply-To: <201212141401.11951.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 14 Dec 2012 14:01:11 +0100")
References: <cover.1355435224.git.yann.morin.1998@free.fr>
 <b6f27b8d9306f0a01bd003e2c9bdc1f5c5e87128.1355435224.git.yann.morin.1998@free.fr>
 <87mwxgiylq.fsf@dell.be.48ers.dk>
 <201212141401.11951.yann.morin.1998@free.fr>
Message-ID: <87ip84isg2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> +comment "usbredir requires libusb"
 Yann> +	depends on !BR2_PACKAGE_LIBUSB
 Yann> +
 >> 
 >> We normally use select for libraries. Any reason to not use it here?

 Yann> libusb depends on threads, and I do not want to play the game of
 Yann> inheriting the dependencies of my own dependencies, and reproduce
 Yann> the libffi mess.

 Yann> libusb has a dependency I can not select, so I just depend on it.

Ok, but that just moves the trouble higher up the stack. E.G. you want
to enable qemu, but it tells you that it needs usbredir so you go
hunting around for it only to discover that it needs libusb and finally
you see that you need threads support in your toolchain.

In other words, selects are more user friendly than depends
on. Most likely we have more users than developers, so we should
optimize for making things nice for users rather than devs.

I would prefer you select libusb.

-- 
Bye, Peter Korsgaard

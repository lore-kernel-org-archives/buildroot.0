From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Dec 2010 11:29:08 +0100
Subject: [Buildroot] "output" directory for multiple targets
In-Reply-To: <201012142240.20508.yann.morin.1998@anciens.enib.fr>
References: <966150.47074.qm@web111115.mail.gq1.yahoo.com>
	<201012142240.20508.yann.morin.1998@anciens.enib.fr>
Message-ID: <20101215112908.009964e8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Dec 2010 22:40:20 +0100
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> You can do out-of-tree builds, one for each of your devices:
>   mkdir device-1
>   cd device-1
>   make -C "/path/to/buildroot" O="$(pwd)" menuconfig
>   make
> 
> The first time you run 'make -C....', as above, it creates wrapper
> Makefile in $(pwd) that allows you to simply call make the following
> times.

Or, using the exact same feature, but differently, what I do is :

	cd buildroot/
	mkdir ../outputs/device1
	make O=../outputs/device1 menuconfig
	make O=../outputs/device1
	mkdir ../outputs/device2
	make O=../outputs/device2 menuconfig
	make O=../outputs/device2

and so on.

This O= feature is documented in our documentation,
http://buildroot.org/downloads/buildroot.html#using.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

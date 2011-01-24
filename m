From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 17:02:56 +0100
Subject: [Buildroot] uclibc config changes and cross-compiler
In-Reply-To: <AANLkTi=e=ncL_G+F0iH5Dia+N2iBHi=x8EA9bsw6=uhO@mail.gmail.com>
References: <AANLkTi=e=ncL_G+F0iH5Dia+N2iBHi=x8EA9bsw6=uhO@mail.gmail.com>
Message-ID: <20110124170256.4cbf2e10@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 Jan 2011 10:46:48 +0300
Sergey Naumov <sknaumov@gmail.com> wrote:

> Does anybody know whether changes in uclibc.conf when cross-compiler
> is already built can lead to unrunnable programs?

I don't think there is an uclibc.conf file, but I assume you're talking
about uClibc .config file.

> For example, we made a toolchain with certain uclibc features. Then we
> decided to add/remove some programs from our build so we need
> additional/no longer need some uclibc features. Is it safe to rebuild
> only uclibc in this case, or we also have to rebuild compiler?

I am not an uClibc expert, but my understanding is that uClibc does not
provide ABI compatibility between versions and configurations.
Therefore, you cannot assume that programs compiled against version
A/configuration A of uClibc will work properly with version
B/configuration B of uClibc.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

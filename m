From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2011 18:21:24 +0100
Subject: [Buildroot] toolchain into the root disk
In-Reply-To: <AANLkTim0Up1xxGFx8AAg-_BWSNXgiJDjRV-3w1eaV9+m@mail.gmail.com>
References: <AANLkTi=tEiD9=biree-6EzC5qN_6ZL0r=tyhC0WPtpm1@mail.gmail.com>
	<20110307143332.3afe2773@surf>
	<AANLkTim0Up1xxGFx8AAg-_BWSNXgiJDjRV-3w1eaV9+m@mail.gmail.com>
Message-ID: <20110307182124.555f16ab@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 7 Mar 2011 16:54:23 +0000
Max <themaxmail@gmail.com> wrote:

> the BR2_PACKAGE_GCC_TARGET seams to me to work only with the internal
> toolchain.

Yes. Nobody has done the effort on getting BR2_PACKAGE_GCC_TARGET to
work with external toolchain as of today. As said previously, Buildroot
is a cross-compiling environment, so the need of a toolchain on the
target is not very common.

> I'm creating a root disk for a powerpc64 architecture. As build root does
> not support powerpc64, I'm
> using and external toolchain. With few workarounds evething works fine.

Just curious, which toolchain have you used ?

> When I use BR2_PACKAGE_GCC_TARGET=y the tool tries to download gcc but the
> version is not
> define so it tries to get the file gcc-.tar.bz2.

Yes, correct.

> Can you please tell me where in the tool the gcc version is set? I was not
> able to spot the location.

It isn't set in the external toolchain case, that's the problem. I now
Gustavo Zacarias has planned to rework the gcc handling, and it should
probably fix this problem.

In the mean time, you can force the GCC version by modifying the code,
but you'll very likely have issues when building gcc for the target.

Do you really need a native toolchain on the target ? What do you want
to build on the target ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

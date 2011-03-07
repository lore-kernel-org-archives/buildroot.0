From: Max <themaxmail@gmail.com>
Date: Mon, 7 Mar 2011 16:54:23 +0000
Subject: [Buildroot] toolchain into the root disk
In-Reply-To: <20110307143332.3afe2773@surf>
References: <AANLkTi=tEiD9=biree-6EzC5qN_6ZL0r=tyhC0WPtpm1@mail.gmail.com>
	<20110307143332.3afe2773@surf>
Message-ID: <AANLkTim0Up1xxGFx8AAg-_BWSNXgiJDjRV-3w1eaV9+m@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

the BR2_PACKAGE_GCC_TARGET seams to me to work only with the internal
toolchain.

I'm creating a root disk for a powerpc64 architecture. As build root does
not support powerpc64, I'm
using and external toolchain. With few workarounds evething works fine.

When I use BR2_PACKAGE_GCC_TARGET=y the tool tries to download gcc but the
version is not
define so it tries to get the file gcc-.tar.bz2.

Can you please tell me where in the tool the gcc version is set? I was not
able to spot the location.

Thanks,
Massimiliano


On Mon, Mar 7, 2011 at 1:33 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Fri, 4 Mar 2011 16:47:42 +0000
> Max <themaxmail@gmail.com> wrote:
>
> > Is there any way to setup builroot to insert a toolchain into the
> > root disk?
>
> See the BR2_PACKAGE_GCC_TARGET option, which allows to enable toolchain
> in the target.
>
> However, remember that Buildroot is a *cross-compilation* build system:
> its purpose is to cross-compile libraries and programs for the target.
> Therefore, the target toolchain (which allows to do native compilation
> on the target) is not that widely used, and therefore not that widely
> tested.
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110307/66a7eca0/attachment.html>

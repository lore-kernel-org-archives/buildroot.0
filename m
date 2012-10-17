From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Oct 2012 19:23:37 +0200
Subject: [Buildroot] BuildRoot not starting with Udev
In-Reply-To: <CA+mmYj34+xbUcq=jvEuTFRu_XwX3TMn1Bcv6Rwnnn17pDCewiA@mail.gmail.com>
References: <loom.20121015T104727-737@post.gmane.org>
 <20121016194117.2ed3a609@skate>
 <CA+mmYj34+xbUcq=jvEuTFRu_XwX3TMn1Bcv6Rwnnn17pDCewiA@mail.gmail.com>
Message-ID: <20121017192337.7f1ac3eb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Antoine,

On Wed, 17 Oct 2012 10:22:22 +0200, Antoine Caurier wrote:

> I found one of your previous post, where you said that if kernel was
> build by buildroot, it should be ok. So I was thinking that it should
> be ok just activating udev as I am building kernel with buildroot.
> 
> I tried to manually set DEVTMPFS in linux-menuconfig, and then
> recompile the kernel (with buildroot), and it is now working.
> 
> Is it normal to have manualy to set DEVTMPFS in kernel configuration
> in order to have udev working?

No, but it depends on what you did exactly.

If you did:

 1) Configure /dev management as static
 2) Configure your kernel
 3) Build Buildroot
 4) Reconfigure /dev management as udev
 5) Build Buildroot

Then yes, it is normal: Buildroot doesn't try to be smart about
this kind of dependency. If you change the /dev management style, you
are responsible to restart the build of the kernel (make
linux-dirclean; make) so that it gets a configuration that is
compatible with a dynamic /dev management.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

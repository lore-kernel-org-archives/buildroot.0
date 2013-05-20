From: prabindh <prabu@ti.com>
Date: Sun, 19 May 2013 20:31:35 -0700 (PDT)
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <20130219162959.34295207@skate>
References: <20130114105802.1199d10e@skate>
 <CAHQn0kiUCGte++HwWEgW6=awTCZ0FNN7kxZ9LxVBnek2p2qZWA@mail.gmail.com>
 <20130114120416.42b34d77@skate> <1361247529229-40702.post@n4.nabble.com>
 <20130219162959.34295207@skate>
Message-ID: <1369020695818-45544.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Using default cross-compiled toolchain for the Beaglebone, some of the Xorg
libraries are failing to link, with below errors:

undefined reference to `pwrite64'
undefined reference to `pread64'

Looks like a fix is needed as per below threads - Can you please confirm
what is the right approach here ?

http://lists.uclibc.org/pipermail/uclibc/2013-January/047415.html
http://git.uclibc.org/uClibc/commit/?id=a586f419f5195ee5d7cb69c9c40263e01aec42


I need C++ toolchain as well, that does not seem to be built with buildroot
by default. Are the below the right set of options to add to have this
support ?

"BR2_GCC_CROSS_CXX=y BR2_INSTALL_LIBSTDCPP=y"

regards,
prabu



Thomas Petazzoni-2 wrote
> Hello prabindh,
> 
> On Mon, 18 Feb 2013 20:18:49 -0800 (PST), prabindh wrote:
> 
>> On below - how can I help ? Note that sgxconfiguro, while useful in
>> autoconfigure for egl/gles2, for Qt5 is not especially useful as it
>> fails because of missing icu detection via autoconfig. So I reverted
>> back to regular configurations via qmake.conf at this time.
> 
> If you're interested in Buildroot, the best way you can help is by
> creating packages for the SGX stuff needed to bring OpenGL support on
> OMAP platforms. That would definitely be useful.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list

> buildroot@

> http://lists.busybox.net/mailman/listinfo/buildroot





--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Currently-packaging-Qt5-tp38584p45544.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.

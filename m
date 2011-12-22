From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Dec 2011 14:16:05 +0100
Subject: [Buildroot] [PATCH 2/7] lttng-modules: new package
In-Reply-To: <CAAXf6LUiqde1C2zY=aoKkRCc37r-ZASSfavVCX1WmwWT9g=TyA@mail.gmail.com>
References: <cover.1324547779.git.thomas.petazzoni@free-electrons.com>
 <5c075a80f633c498d1e359c7a7bc521157caf22a.1324547779.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LUiqde1C2zY=aoKkRCc37r-ZASSfavVCX1WmwWT9g=TyA@mail.gmail.com>
Message-ID: <20111222141605.160d5b67@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 22 Dec 2011 14:03:14 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> On an old system, I have noticed a problem with this approach. With
> the above line, the 'depmod' utility of the host will be used instead
> of the depmod that was built with the linux kernel in $(LINUX_DIR). If
> the host depmod is very old, a segmentation fault occurs.
> 
> To fix this, one should add DEPMOD="$(HOST_DIR)/usr/sbin/depmod" to
> the command, just as linux/linux.mk does it.  

Ah, ok. Then maybe this DEPMOD=... variable should be part of
LINUX_MAKE_FLAGS.

> In fact, since building kernel modules from buildroot is not uncommon
> anymore (there are some packages in the tree that do it, plus
> user-specific packages, wouldn't it be a good idea to provide a small
> infrastructure for building kernel modules? This would prevent such
> mistakes. Instead of gentargets, we could have something like
> kernelmodule.
> What do you think about that?  

I don't know. I am not exactly sure because there is no real standard
way for packaging external kernel modules. If you look at linux-fusion,
RTAI or lttng-modules, you'll see that the build mechanism is very
different. I'm not sure there is a real pattern here that we can
factorize nicely in an infrastructure. Which pattern do you see?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2011 17:24:25 +0200
Subject: [Buildroot] external buildroot toolchain: LD_LIBRARY_PATH needed
In-Reply-To: <CAAXf6LUndmNrEU108f1_7h7fC3bsrAAu1Uvf5aOjH+=BJsZCZg@mail.gmail.com>
References: <CAAXf6LV8wL4wAp1eETK7mtwqCFCgoJWFBScnhGzhERZMs2R+Ww@mail.gmail.com>
 <j331vf$6s0$1@dough.gmane.org>
 <CAAXf6LUndmNrEU108f1_7h7fC3bsrAAu1Uvf5aOjH+=BJsZCZg@mail.gmail.com>
Message-ID: <20110906172425.0fc541eb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 25 Aug 2011 11:07:31 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> However, the missing library does not seem part of sysroot. It is
> located at output/host/opt/ext-toolchain/lib
> where libgmp, libmpfr, libexpat etc. reside.

Those libraries are libraries for the host, and they are used by gcc
and binutils.

> Maybe this wrapper should be adapted as to include the proper
> LD_LIBRARY_PATH?

No, I don't think it's the right solution. I think there are two
solutions:

 * Link the toolchain binaries statically against those libraries so
   that the toolchain binaries only rely on the C libraries but not on
   gmp, mpfr, etc.

 * Link the toolchain binaries with a proper rpath.

> How does crosstool-ng handle this fixed-path problem?

From what I can see, using static linking against those libraries.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

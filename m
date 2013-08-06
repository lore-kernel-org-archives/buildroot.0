From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Aug 2013 19:54:02 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
Message-ID: <20130806195402.2f3f94e7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 5 Aug 2013 14:01:51 +0200, Thomas De Schampheleire wrote:

> I was looking at an autobuild failure on AVR32 and tried reproducing
> it locally. Unfortunately, the AVR32 toolchain that was configured was
> pre-built on a 64-bit machine, which I don't have. Hence, the
> configured toolchain was not usable.
> 
> Then I tried building my own AVR32 toolchain with the internal
> backend, see config attached. Unfortunately, this failed as well:

I just tested here on my Ubuntu 13.04 64 bits machine, with the latest
Buildroot Git, and the atngw100_defconfig (AVR32) could build a
toolchain properly. This toolchain however seems to have a problem as
it is not able to link the kernel. This specific regression was, I
think, introduced by my patches converting the internal backend to
proper packages. I'll try to investigate this one.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Mar 2011 12:44:02 +0100
Subject: [Buildroot] 2011_02 qt compilation error
In-Reply-To: <AANLkTimU+hUM71bBWk7VGpsJ8wGsLNKNGqMy19oD1Am5@mail.gmail.com>
References: <AANLkTimU+hUM71bBWk7VGpsJ8wGsLNKNGqMy19oD1Am5@mail.gmail.com>
Message-ID: <20110301124402.25226ea9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Mar 2011 11:45:41 +0100
Belisko Marek <marek.belisko@gmail.com> wrote:

> ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h:361:35:
> error: output number 1 not directly addressable

Reproduced. It's apparently a bug in gcc 4.5, see
https://bugs.launchpad.net/gcc-linaro/+bug/675347. I haven't checked if
there is a workaround at Qt level, but in the mean time, the easiest
solution is to revert to a gcc 4.4 based toolchain.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

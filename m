From: Michael Nosthoff <buildroot@heine.tech>
Date: Mon, 14 Sep 2020 12:20:43 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-09-13
In-Reply-To: <20200914071215.44B0E203D8@silver.osuosl.org>
References: <20200914071215.44B0E203D8@silver.osuosl.org>
Message-ID: <406f8fd2-5cb4-fd7a-1bf4-2835f1b132de@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 14.09.2020 09:12, Thomas Petazzoni wrote:
> nios2 | boost-1.74.0 | NOK |
> http://autobuild.buildroot.net/results/f54c998a107c797b14889dd957f90c0dc3bf20b6
> | nios2 | boost-1.74.0 | NOK |
> http://autobuild.buildroot.net/results/cfefb8cc111525a7d17237d9a11c0d06d6daacda
> | nios2 | boost-1.74.0 | NOK |
> http://autobuild.buildroot.net/results/8dbcd14fd36c5dd19935a365f77309c2774e7bc0
> | 

all those builds fail because of boost::atomic with this failing assert:

"Boost.Atomic unsupported target platform: native atomic operations not
implemented for bytes"
which triggers on "once_flag_operations::is_always_lock_free".

Should the nios2 toolchain provide this?

I think the package libatomic_ops provides similar functionality and is
not enabled for nios2. So would it be an option to mirror the conditions
for |BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS? Or would it make sense to
make this a more global flag?


Regards,
Michael

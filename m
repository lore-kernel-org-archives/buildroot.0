From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 May 2013 10:02:37 +0200
Subject: [Buildroot] [PATCH] toolchain/crostool-NG: mark as deprecated
In-Reply-To: <1367880422-12739-1-git-send-email-yann.morin.1998@free.fr>
References: <1367880422-12739-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130507100237.3888a716@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue,  7 May 2013 00:47:02 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> For the following reasons:
>   - it used to be broken without anyone noticing for a long time,
>   - it is still not fully integrated within the Buildroot set of options,
>   - it has not gained much traction (not even I use it),
>   - I've always argued that sustained development should use an external
>     toolchain, and not rely on building one with Buildroot,
>   - I did not submit any of the enhancements requested during the last
>     developpers' day in Brussels,
>   - I have neither the incentive nor the time to maintain and enhance it,
> 
> it is time to deprecate the crosstool-NG backend for the 2013.05 release.
> 
> Then, it will be entirely removed early in the 2013.08 cycle, to let some
> time for those that rely on it to voice their opinions. ;-)

I don't have real comments about the proposal to deprecate the
Crosstool-NG support, but I'd like to take this opportunity to unveil
my plans about the internal toolchain support (I hate unveiling plans
before the code is ready, but it seems like a good idea in this
particular case) :

 (1) I am currently converting the existing internal toolchain logic to
     use the package infrastructure. I've already done it for
     'gdb' (merged for 2013.05), I have patches that seem to work for
     elf2flt and linux-headers, and I've started working on converting
     gcc (which is the most complicated piece of the puzzle).

 (2) Once this conversion is done, I intend to work on adding (e)glibc
     support to the internal toolchain backend, so that regardless of
     what happens with the Crosstool-NG backend, Buildroot will
     continue to have the possibility to build a (e)glibc toolchain.

(1) and (2) represent a significant amount of work, so don't expect
those things to be ready overnight.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

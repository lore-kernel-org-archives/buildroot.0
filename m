From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 09:37:42 +0100
Subject: [Buildroot] [PATCH] package/gcc: disable libitm for sparc <v9
In-Reply-To: <1421281784-5243-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421281784-5243-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150115093742.1fb23f1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Jan 2015 21:29:44 -0300, Gustavo Zacarias wrote:
> libitm (transactional memory) needs SPARC V9+ ISA, otherwise when
> enabling C++ the toolchain fails to build:
> 
> /tmp/cclQ6hrD.s: Assembler messages:
> /tmp/cclQ6hrD.s:1261: Error: Architecture mismatch on "rd".
> /tmp/cclQ6hrD.s:1261:  (Requires v9|v9a|v9b; requested architecture is
> v8.)
> Makefile:517: recipe for target 'beginend.lo' failed
> make[5]: *** [beginend.lo] Error 1
> 
> So disable it for our current (v8, leon3) support.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks. Is it only SPARCv8 that doesn't have libitm support,
or could other architectures be affected? If other architectures are
affected, we may want to introduce a BR2_ARCH_HAS_LIBITM or some other
similar thing.

Another weird thing: we're not enabling libitm, so why is gcc enabling
it by itself, if it knows that the architecture cannot support it?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

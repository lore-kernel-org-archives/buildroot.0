From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 12:11:47 +0100
Subject: [Buildroot] [PATCH] external toolchain: [ARC] gcc cpu parameter
In-Reply-To: <884EA965490E3C4D8E66AEF41E98025006C2AD@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E98025006BF3A@ezex10.ezchip.com>
 <20140223104807.473b5d47@skate>
 <884EA965490E3C4D8E66AEF41E98025006C2AD@ezex10.ezchip.com>
Message-ID: <20140223121147.3c24dde4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Noam Camus,

(It would be nice if you could avoid top-posting. It is considered a
bad practice in most open-source circles. See
http://en.wikipedia.org/wiki/Posting_style#Top-posting vs.
http://en.wikipedia.org/wiki/Posting_style#Bottom-posting. Thanks!)

On Sun, 23 Feb 2014 10:57:06 +0000, Noam Camus wrote:

> Using external toolchain than BR2_GCC_TARGET_CPU is passed to GCC by -mcpu 
> Using buildroot toolchain than BR2_GCC_TARGET_CPU is passed to configure by --with-cpu

Passing -mcpu or --with-cpu is already taken care of by Buildroot
depending on the case. However, normally, gcc accepts the same
possible values for both -mcpu and --with-cpu.

> ARC GCC likes to get -mcpu=ARC700
> However through configure I am not sure but I think that config.gcc script is involved and it likes to get arc*.
> 
> Maybe my patch is a workaround to make external toolchain work for ARC and complete solution is to change ARC GCC.

I'm Cc'ing Anton, from Synposys, to get more details about this.

Noam, which ARC external toolchain are you using? Maybe it's an older
ARC toolchain, and Synopsys has since then changed the possible -mcpu
values?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

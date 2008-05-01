From: Will Newton <will.newton@gmail.com>
Date: Thu, 1 May 2008 10:02:37 +0100
Subject: [Buildroot] mplayer in buildroot
In-Reply-To: <46a136670804301006p74346c55qf9fc2253f34b7c52@mail.gmail.com>
References: <46a136670804301006p74346c55qf9fc2253f34b7c52@mail.gmail.com>
Message-ID: <87a5b0800805010202h72826070s8f1ff60ea1ed7404@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 30, 2008 at 6:06 PM, John Voltz <john.voltz@gmail.com> wrote:
> I cannot get mplayer to build for x86 in buildroot. I keep getting this
> error:
>
> cabac.h:513: error: can't find a register in class 'GENERAL_REGS' while
> reloading 'asm'
> cabac.h:513: error: 'asm' operand has impossible constraints
>
> Why can't it use inline assembler? It compiles just fine if I build it for
> AVR32.

AVR32 will not use the same inline assembler. The error message
suggests the constraints for the asm operands are too restrictive in
some way, or it may be the compiler isn't doing a great job of
register allocation. Try a newer/older compiler, adjust the
constraints or see if asm optimizations can be selectively disabled.

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Oct 2012 20:51:46 +0200
Subject: [Buildroot] [PATCH] sdl_gfx: don't use --enable-mmx on x86_64
In-Reply-To: <1350240476-22608-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 14 Oct 2012 20:47:56 +0200")
References: <1350240476-22608-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9vozy2l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Even though the MMX instructions are available on x86_64 processors,
 Thomas> the MMX code in sdl_gfx is written in IA32-specific assembly code, and
 Thomas> therefore does not build on x86_64. It generates the following build
 Thomas> issues:

 Thomas> SDL_imageFilter.c: Assembler messages:
 Thomas> SDL_imageFilter.c:34: Error: `pusha' is not supported in 64-bit mode
 Thomas> SDL_imageFilter.c:38: Error: `popa' is not supported in 64-bit mode
 Thomas> SDL_imageFilter.c:77: Error: `pusha' is not supported in 64-bit mode
 Thomas> SDL_imageFilter.c:93: Error: `popa' is not supported in 64-bit mode
 Thomas> [...]

 Thomas> We fix this by only enabling MMX support in this package when the
 Thomas> processor supports MMX *and* it is a IA32 compatible processor.

 Thomas> Fixes

 Thomas>   http://autobuild.buildroot.org/results/b9efc611f5da487079b6be37bb7a41a3198d63b9/

Committed, thanks.

-- 
Bye, Peter Korsgaard

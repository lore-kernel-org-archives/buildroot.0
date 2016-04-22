From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 15:02:40 +0200
Subject: [Buildroot] [PATCH v3] elf2flt: Update version to fix buffer
 overflow in output_relocs()
In-Reply-To: <1461329977-22872-1-git-send-email-mcoquelin.stm32@gmail.com>
References: <1461329977-22872-1-git-send-email-mcoquelin.stm32@gmail.com>
Message-ID: <20160422150240.7b78470d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Apr 2016 14:59:37 +0200, Maxime Coquelin wrote:
> This new version contains a patch that fixes the following crash:
> make[1]: Entering directory `<...>/build/uclibc-1.0.14'
>   CC utils/getconf
> *** buffer overflow detected ***: <...>/bin/elf2flt terminated
> ======= Backtrace: =========
> /lib/x86_64-linux-gnu/libc.so.6(+0x7338f)[0x2ad3be5f738f]
> /lib/x86_64-linux-gnu/libc.so.6(__fortify_fail+0x5c)[0x2ad3be68ec9c]
> /lib/x86_64-linux-gnu/libc.so.6(+0x109b60)[0x2ad3be68db60]
> /lib/x86_64-linux-gnu/libc.so.6(+0x109069)[0x2ad3be68d069]
> /lib/x86_64-linux-gnu/libc.so.6(_IO_default_xsputn+0xbc)[0x2ad3be5ff70c]
> /lib/x86_64-linux-gnu/libc.so.6(_IO_vfprintf+0xaef)[0x2ad3be5ce7df]
> /lib/x86_64-linux-gnu/libc.so.6(__vsprintf_chk+0x84)[0x2ad3be68d0f4]
> /lib/x86_64-linux-gnu/libc.so.6(__sprintf_chk+0x7d)[0x2ad3be68d04d]
>  <...>/bin/elf2flt[0x403cda]
>  <...>/bin/elf2flt[0x4030a4]
> /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf5)[0x2ad3be5a5ec5]
>  <...>/bin/elf2flt[0x403642]
> 
> Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> ---
>  package/elf2flt/elf2flt.hash | 2 +-
>  package/elf2flt/elf2flt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

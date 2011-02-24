From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 24 Feb 2011 18:57:55 +0100
Subject: [Buildroot] New Buildroot install setup issues
In-Reply-To: <0D753D10438DA54287A00B027084269764D0949BF6@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B027084269764D0949BF6@AUSP01VMBX24.collaborationhost.net>
Message-ID: <201102241857.55960.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hartley, All,

On Thursday 24 February 2011 18:37:57 H Hartley Sweeten wrote:
> The system has a fresh install of Fedora 14 on it.  I cloned a new copy of
> Buildroot last night then did a make menuconfig and setup everything like
> my current system.  The problem occurs when setting up the external-toolchain.
> 
> mkdir -p /export/kdrive/mvr/mx35/devel/buildroot/output/external-toolchain
> bzcat /export/kdrive/mvr/mx35/devel/buildroot/dl/arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2 | tar --strip-components=1 -C /export/kdrive/mvr/mx35/devel/buildroot/output/external-toolchain  -xf -
> /din/sh: /export/kdrive/mvr/mx35/devel/buildroot/output/external-toolchain/bin/arm-none-linux-gnueabi-gcc: /lib/ld-linux.so.2: bad ELF interpreter: No such file or directory
> readlink: missing operand
> Try `readlink --help` for more information.
> /bin/sh: line 5: @echo: command not found
> make: *** [/export/kdrive/mvr/mx35/devel/buildroot/output/stamps/ext-toolchain-installed] Error 1

Your machine is a pure 64-bit system. The CodeSourcery toolchains are meant
to run on 32-bit machines. So what the error actually means is that it can't
execute the binaries.

To fix it, you'll have to install the ia32 libraries for your distribution
(in Debian, they are bundled in packages whose names start with ia32-libs,
Fedora should have something similar).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

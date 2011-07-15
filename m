From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 15 Jul 2011 15:10:07 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <20110715143053.558a756a@skate>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <20110715143053.558a756a@skate>
Message-ID: <201107151510.08098.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas and Thomas, All,

On Friday 15 July 2011 14:30:53 Thomas Petazzoni wrote:
> Le Fri, 15 Jul 2011 08:34:34 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
> > * I need to get to the dtc (device tree compiler) which resides in
> > <linux>/scripts/dtc/dtc
> 
> This tool looks like a useful host tool built by the kernel. Maybe we
> should install it in $(HOST_DIR)/usr/bin ?
> 
> > * I need to be able to compile external kernel modules, so in that
> > Makefile I need to point to the right kernel directory.
> 
> Ok. Those could be integrated as Buildroot packages, in which case
> getting access to the Linux source directory is easy.

Or use the 'build' and 'source' symlinks in the (rootfs)/lib/modules/(version)
Of course, it still requires the version string, which Daniele provided
a very simple way to get it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

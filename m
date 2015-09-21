From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Sep 2015 22:54:37 +0200
Subject: [Buildroot] Generating a defconfig
In-Reply-To: <20150921190806.5b845258@free-electrons.com>
References: <56002C63.1070806@synopsys.com>
 <20150921190806.5b845258@free-electrons.com>
Message-ID: <20150921205437.GE3570@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joao, Thomas, All,

On 2015-09-21 19:08 +0200, Thomas Petazzoni spake thusly:
> On Mon, 21 Sep 2015 17:12:19 +0100, Joao Pinto wrote:
> > I am about to generate a buildroot' defconfig for ARM Juno r1 board, and I would
> > like to know what is the std procedure to make this on buildroot.
> 
> Just create your Buildroot configuration, and then run:
> 
> 	make savedefconfig
> 
> It will create a file named 'defconfig', which you can simply move to
> configs/<foo>_defconfig.
> 
> You can also do it in one step like this:
> 
> 	make BR2_DEFCONFIG=configs/<foo>_defconfig savedefconfig
> 
> Note that for the board defconfig, we have a few rules in Buildroot:
> 
>  * The version of the kernel headers and kernel must be fixed (you
>    should not use the "latest version" option)
> 
>  * The configuration should be minimal, i.e nothing but the default
>    userspace package (just Busybox).

To complement what Thomas said:

    ... and just the minimal set of packages that make the board boot
    (e.g. the bootloader, a hardware blob and such low-level stuff).

For example, the raspberrypi defconfig files also enable the
rpi-firmware package, because it contains the bootloader blob.

Otherwise, as Thomas said: nothing fancy. The strictly minimum to get
the board up to a shell.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

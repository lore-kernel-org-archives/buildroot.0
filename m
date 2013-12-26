From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Dec 2013 16:59:40 +0100
Subject: [Buildroot] buildroot_defconfig Error
In-Reply-To: <CAO8ZbKt9uYRyRutgkMYFS4hY=EYASWEeyEXha4-q+9C6dmDMCw@mail.gmail.com>
References: <CAO8ZbKt9uYRyRutgkMYFS4hY=EYASWEeyEXha4-q+9C6dmDMCw@mail.gmail.com>
Message-ID: <20131226155940.GB3398@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ron, All,

On 2013-12-26 15:50 +0000, Ron Eggler spake thusly:
> About 30min into the compilation, I keep getting a "buildroot_defconfig"
> error that I'm not able to get resolved.
> It looks like this:
> >>> linux 3.2.52 Configuring
> cp "board/synapse/e10/linux-3.12.1-config"
> /etc/E10-buildroot/br2013.11/output/build/linux-3.2.52/arch/arm/configs/buildroot_defconfig
> cp: cannot stat ?board/synapse/e10/linux-3.12.1-config?: No such file or
> directory

That is the real error: the file 'board/synapse/e10/linux-3.12.1-config'
does not exist.

That file does not exist in upstream Buildroot. You did configure
Buildroot to use that file (it's in the Linux sub-menu), but you do not
provide it. If you got your Buildroot config from someone else, then
that someone else forgot to provide you with that file.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

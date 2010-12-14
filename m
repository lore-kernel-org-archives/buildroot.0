From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 14 Dec 2010 22:40:20 +0100
Subject: [Buildroot] "output" directory for multiple targets
In-Reply-To: <966150.47074.qm@web111115.mail.gq1.yahoo.com>
References: <966150.47074.qm@web111115.mail.gq1.yahoo.com>
Message-ID: <201012142240.20508.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Justin, All,

On Tuesday 14 December 2010 22:34:14 Justin Mark wrote:
> If I want to use buildroot for multiple targets (or devices), is there a way
> to specify each target's own "output" directory (not only the destination
> root filesystem folder)? so I can keep all the build results for different
> targets?

You can do out-of-tree builds, one for each of your devices:
  mkdir device-1
  cd device-1
  make -C "/path/to/buildroot" O="$(pwd)" menuconfig
  make

The first time you run 'make -C....', as above, it creates wrapper Makefile
in $(pwd) that allows you to simply call make the following times.

And so on for each of your devices...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 22:33:18 +0200
Subject: [Buildroot] [PATCHv2 09/21] pkg-download: remove support for
 the SHOW_EXTERNAL_DEPS DL_MODE
In-Reply-To: <20150413203115.GG29025@free.fr>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-10-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413203115.GG29025@free.fr>
Message-ID: <20150413223318.3429cc65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 13 Apr 2015 22:31:15 +0200, Yann E. MORIN wrote:

> That's weird, the output looks like that:
> 
>     $ make external-deps
>     make -C /home/ymorin/dev/buildroot/buildroot O=/home/ymorin/dev/buildroot/O/. external-deps
>     [--SNIP--]
>     gcc-4.8.4.tar.bz2
>     gdbm-1.11.tar.gz
>     genext2fs-1.4.1.tar.gz
>       GEN     /home/ymorin/dev/buildroot/O/./Makefile
>     genimage-7.tar.xz
>     genpart-1.0.2.tar.bz2
>     [--SNIP--]
> 
> Weird that the message about our Makefile wrapper is irght in the middle
> of that... :-/

Weird, indeed. Could it be because external-deps is implement itself as
a call to $(MAKE) _external-deps ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

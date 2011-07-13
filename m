From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 13 Jul 2011 20:11:50 +0200
Subject: [Buildroot] [PATCH 2/2] source: print messages when all sources
	downloaded
In-Reply-To: <87r55ufzyx.fsf@macbook.be.48ers.dk>
References: <1310512066-11450-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <1310512066-11450-3-git-send-email-yann.morin.1998@anciens.enib.fr>
 <87r55ufzyx.fsf@macbook.be.48ers.dk>
Message-ID: <201107132011.51230.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Wednesday 13 July 2011 08:37:26 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:
[--SNIP--]
>  Yann> To avoid confusion, add an explicit message that makes it clear that
>  Yann> downloading the sources was sucessful, and nothing more.
> 
> I agree it isn't optimal, but this breaks E.G. make external-deps

Indeed. We could print the message only if DL_MODE==DOWNLOAD. Would that
be OK with you?

Incidentally, external-deps and source-check will not be really complete
when crostool-NG is the backend, as there is no way to ask such a thing
to crosstool-NG.

Note that source-check is currently borked due to some unconfigured
defconfig files for bootloaders and kernel. Eg. for barebox:
  $ make -C ../br.upstream O=$(pwd) source-check
  [--SNIP-]
  make O=/home/ymorin/dev/buildroot/O _source-check
  make[1]: Entering directory `/home/ymorin/dev/buildroot/br.upstream'
  boot/barebox/barebox.mk:60: *** No Barebox defconfig file. Check your
  BR2_TARGET_BAREBOX_BOARD_DEFCONFIG setting.  Stop.
  make[1]: Leaving directory `/home/ymorin/dev/buildroot/br.upstream'
  make: *** [source-check] Error 2
  make: Leaving directory `/home/ymorin/dev/buildroot/br.upstream'

Setting the barebox defconfig to non-empty now breaks on u-boot, still
because the defconfig entry is empty. And then it is the Linux kernel
that breaks for the same reason. :-/

I'll push a patch shortly...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

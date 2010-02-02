From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 2 Feb 2010 15:20:47 +0100
Subject: [Buildroot] 'make ARCH=arm' warning, how can I correct?
In-Reply-To: <SNT129-W159AEF2E2D689BDC2F9C82B9570@phx.gbl>
References: <SNT129-W159AEF2E2D689BDC2F9C82B9570@phx.gbl>
Message-ID: <5f2b61002020620r5fcd9847ke8b12c873374cc83@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tony,

On 2 February 2010 14:47, Tony Mozi <spooflinux@hotmail.fr> wrote:
> Hello all,
> I make the cross-compilation for an ARM.
>
> When I make 'make ARCH=arm', I have some errors :
>
> <stdin>:91:1: warning: "__IGNORE_sync_file_range" redefined
> In file included from <stdin>:2:
> include/arm/unistd.h:444:1: warning: this is the location of the previous
> definition
> <stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
> <stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
> <stdin>:1321:2: warning: #warning syscall pselect6 not implemented
> <stdin>:1325:2: warning: #warning syscall ppoll not implemented
> <stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented
>
> How can I correct?

Do not use 'make ARCH=arm' with Buildroot. Use 'make menuconfig' and select
the target architecture in the menu. See 'make help' for some predefined
configurations.

Best regards,
Bj?rn Forsman

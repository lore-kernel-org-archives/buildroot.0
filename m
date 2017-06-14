From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Jun 2017 23:13:21 +0200
Subject: [Buildroot] scsi/scsi.h: No such file or directory
In-Reply-To: <CAM7NYThRL6ouhnxzg5rEosu4q54qkefdZke+Kz9qvvGg6jYEJA@mail.gmail.com>
References: <CAM7NYTg0TK9phO3EEszpmyY+v9F4nn6uCocZ=OuvvSfd6xCOJQ@mail.gmail.com>
 <20170612152332.wmyjhvatvid7ghgd@sapphire.tkos.co.il>
 <5DD81335-B484-44C4-89F6-A8018E31FE3B@free.fr>
 <CAM7NYTjHa0waAPpauLhFL1j60pnmskGcZRUVR9G7iNYnWyCHQg@mail.gmail.com>
 <20170612173345.kqjxqzsoznsgjhkh@tarshish>
 <CAM7NYThRL6ouhnxzg5rEosu4q54qkefdZke+Kz9qvvGg6jYEJA@mail.gmail.com>
Message-ID: <20170614211321.GA4600@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tamim, All,

Please, do not post HTML mail, and do not top-post; this is considered
bad practice. Send mails as plain tesxt, and reply below the mail you
are replying to.

On 2017-06-14 16:42 -0400, MD I. Islam spake thusly:
> I'm using *arm_foundationv8_defconfig. *I didn't make any change in config.
> The last 100 lines of build output is as following:
[--SNIP--]
> >>> host-util-linux 2.29.2 Building
> PATH="/home/tamim/buildroot/output/host/bin:/home/tamim/buildroot/output/host/sbin:/home/tamim/buildroot/output/host/usr/bin:/home/tamim/buildroot/output/host/usr/sbin:/home/tamim/bin:/home/tamim/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
>   CC       sys-utils/eject-eject.o
> sys-utils/eject.c:41:23: fatal error: scsi/scsi.h: No such file or
> directory

So, this fails while building the host variant of util-linux. So your
build machine is missing some critical system headers.

It looks like you are using a Ubuntu machine, and this header is
normally installed by libc6-dev, which you would have installed if you
install the meta-package build-essential.

Please, check the requirements in the manual:

    https://buildroot.org/downloads/manual/manual.html#requirement

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

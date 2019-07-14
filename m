From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 19:21:33 +0200
Subject: [Buildroot] [PATCH 2/2] fs/cpio: make cpio rootfs reproducible
In-Reply-To: <20190714164725.GB29941@scaer>
References: <20190714162335.12684-1-itsatharva@gmail.com>
 <20190714162335.12684-2-itsatharva@gmail.com>
 <20190714164725.GB29941@scaer>
Message-ID: <20190714172133.GC29941@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atharva, All,

On 2019-07-14 18:47 +0200, Yann E. MORIN spake thusly:
> On 2019-07-14 21:53 +0530, Atharva Lele spake thusly:
> > Pass the recommended argument in the CPIO manual to make cpio archives
> > reproducible.
[--SNIP--]
> > +# --repoducible option was not introduced until cpio v2.12. Some distros
> > +# like Ubuntu 16.04 or Debian oldstable which package v2.11. Hence build
> > +# host-cpio.
> > +ifeq ($(BR2_REPRODUCIBLE), y)
> > +ROOTFS_CPIO_DEPENDENCIES += host-cpio
> > +CPIO_OPTS = --reproducible

In addition to my previous comments: the variable shall be prefixed with
ROOTFS_CPIO_, not just with CPIO_, otherwise it could clash with variables
from the cpio package itself.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

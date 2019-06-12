From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Jun 2019 22:18:56 +0200
Subject: [Buildroot] add option to run docker with initramfs
In-Reply-To: <CAL+Nh7PQaDFU_SrWoV_W7-H=s6Y4ALHeC3A_LUozY+SnyXo3Lw@mail.gmail.com>
References: <CAL+Nh7PQaDFU_SrWoV_W7-H=s6Y4ALHeC3A_LUozY+SnyXo3Lw@mail.gmail.com>
Message-ID: <20190612201856.GH2647@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

On 2019-06-12 19:18 +0300, Fragkiskos Sigalas spake thusly:
> By default docker uses pivot_root which is not available in initramfs.

pivot_root is provided by either util-linux or busybox; it has (AFAICT)
no relation to whether running from an initramfs or any other filesystem).

Our default configuration for busybox eeven enables pivot_root.

So, it looks like your could very well add pivot_root to your initramfs,
in fact.

Regards,
Yann E. MORIN.

> The way to override the default behaviour is to define an
> environment variable DOCKER_RAMDISK when starting the daemon (weirdly enough there appears to be no respective command line option).
> Would it make sense to add such an option in the docker package?



-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

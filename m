From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2015 23:49:51 +0200
Subject: [Buildroot] Kernel panic - unable to mount root fs on
 unknown-block(0, 0) - i486
In-Reply-To: <92c9421a9c3260f1653ab207e9b9d4d4@www.startit.hu>
References: <92c9421a9c3260f1653ab207e9b9d4d4@www.startit.hu>
Message-ID: <20150424214951.GJ4244@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pongr?cz, All,

[Please, wrap lines at aronf ~72 chars, it's easier to read]

On 2015-04-24 22:34 +0200, Pongr?cz Istv?n spake thusly:
> I have a problem with booting kernel built by buildroot on i486. The
> kernel (3.18.x) panicked: Kernel panic - not syncing: VFS:
> Unable to mount root fs on unknown-block(0,0)
[--SNIP--]
> I tried to boot from usb.  There is no initramfs (initrd).

For the record so it gets archived on the list, after our discussion
on IRC:

  - add 'rootwait' to the kernel command line, as USB can be pretty slow
    to enumerate the devices on the bus

Kernel seems to wait forever, so:

  - check that all is built-in: USB driver, USB mass-storage, SCSI
    support, SCSI disk support (maybe a few things else...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

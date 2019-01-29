From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jan 2019 19:33:48 +0100
Subject: [Buildroot] flags to build Qt5 for AMD Geode LX arch ?
In-Reply-To: <bb5b237e-ba8d-6857-f475-1960a6375112@gmx.com>
References: <bb5b237e-ba8d-6857-f475-1960a6375112@gmx.com>
Message-ID: <20190129183348.GL7130@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2019-01-29 19:28 +0100, David Picard spake thusly:
> I can build Qt5 successfully. I tested my custom application in QEMU, with
> the same disk.img that I use on the read target (AMD Geode LX).
> 
> But on the target, whenever I link one of my programs with Qt5, it
> terminates straight away with a SIGILL (illegal instruction). Including a
> simple printf("Hello world") that doesn't include nor call in Qt5.
[--SNIP--]
> I thought I could pass e.g. -march=geode when I build Qt. But I don't know
> how to do it. I noticed a arch.conf file in the build directory but it gest
> overwritten when I make qt5base-reconfigure...

Well, if even a program that is not linked to Qt failes, you won;t solve
that by only "fixing" it in Qt...

In that cas, since your processor is a geode, you have to confiugyure
Buildroot to generate code for that processor, i.e.: BR2_x86_geode=y

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

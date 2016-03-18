From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Mar 2016 18:43:59 +0100
Subject: [Buildroot] The best way to add a new group to /etc/group
In-Reply-To: <CALtfCQY_vSZ3PGxgqhAsEsVpir+5p76TfLhCdQYJZASsNnSDzA@mail.gmail.com>
References: <CALtfCQY_vSZ3PGxgqhAsEsVpir+5p76TfLhCdQYJZASsNnSDzA@mail.gmail.com>
Message-ID: <20160318174359.GC3696@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?scar, All,

On 2016-03-18 10:38 +0100, ?scar G?mez Fuente spake thusly:
> I'm building a new package in buildroot and I would like to know the best
> way to add a new group.
> 
> I have to add a new group called: test_group. In my system (with
> INIT_SYSV). I have a user called root and I have to add it to this group
> too.
> 
> I've read the section "17.5.2. generic-package reference" in the buidroot
> manual and find this variable: NAMEPACKAGE_USERS that it's very interesting
> because automatically it adds the user you want and the uid and guid can be
> computed automatically, so is very useful.
> 
> Does anyone know if there is something similar to add a group?

Yes, it's simple: specify the username as just a plain dash '-', as
explained in the manual:
    https://buildroot.org/downloads/manual/manual.html#makeuser-syntax

    ---8<---
    username is the desired user name (aka login name) for the user. It
    can not be root, and must be unique. If set to -, then just a group
    will be created.
    ---8<---

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

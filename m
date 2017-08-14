From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Aug 2017 17:43:14 +0200
Subject: [Buildroot] [PATCH/2017.02.x 2/2] dbus: add upstream patch to
 fix startup hang with with expat >= 2.2.1
In-Reply-To: <C56A6F38-72BB-48CA-9E8C-ED32DB6D7E8F@armadeus.com>
References: <1502372823-31706-1-git-send-email-sebastien.szymanski@armadeus.com>
 <1502372823-31706-2-git-send-email-sebastien.szymanski@armadeus.com>
 <20170813125606.GA3475@scaer>
 <C56A6F38-72BB-48CA-9E8C-ED32DB6D7E8F@armadeus.com>
Message-ID: <20170814154314.GB2810@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

S?bastien, All,

On 2017-08-14 10:40 +0200, S?bastien Szymanski spake thusly:
>   On 13 Aug 2017, at 14:56, Yann E. MORIN < [1]yann.morin.1998@free.fr> wrote:
>   On 2017-08-10 15:47 +0200, S?bastien Szymanski spake thusly:
>     After c0ad6ded018ffbc33f7f5 expat: security bump to version 2.2.1
>     the system can hang on startup under certain circumstances.
[--SNIP--]
>   In the meantime. expat 2.2.3 has been released, which contrains (amongst
>   other interesting stuff) commit 55839b633 (xmlparse.c: Read /dev/urandom
>   if non-blocking getrandom failed), which ought to fix the boot delay.
[--SNIP--]
> expat is still at version 2.2.2 on the master branch.

I was suggesting that expat be bumped on master, yes.

> I guess a patch needs to be first on the master branch before it can be
> backported on a LTS branch, isn?t it?

Ah, this is for the stable branches. Then, it is OK to just add this
patch for DBus, yes.

>   Or did I miss something?

Yup, I did... ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

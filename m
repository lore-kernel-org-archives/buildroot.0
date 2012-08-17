From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2012 15:19:16 +0200
Subject: [Buildroot] external toolchain
In-Reply-To: <1345207629.82252.YahooMailNeo@web164603.mail.gq1.yahoo.com>
References: <1345207629.82252.YahooMailNeo@web164603.mail.gq1.yahoo.com>
Message-ID: <201208171519.16926.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zoran, All,

On Friday 17 August 2012 14:47:09 Zoran Djordjevic wrote:
> I am using buildroot to build RFS with external toolchain support.
> When using Crosstool- NG, it builds OK, but on my target I got
> an error- saying "kernel too old".

When you build your toolchain with crosstool-NG, you can tell glibc what the
oldest supported kernel should be:
    C-library  --->
        Minimum supported kernel version (Specific kernel version)  --->
            (2.6.9) Minimum kernel version to support

Of course, 2.6.9 is just an example. Use whatever you see fit for your
use-case (eg. 2.6.32?)

> Seems to me that there is no other
> way out (is it so ?) knowing that 2.6.32 is the latest kernel that I 
> found for my board.

Bug your provider about this issue. Tell them they should upgrade. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

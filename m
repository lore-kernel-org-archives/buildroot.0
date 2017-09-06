From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Sep 2017 21:10:53 +0200
Subject: [Buildroot] [PATCH 1/1] fixes build crash when building systemd
 with linux-pam, described in more detail here <http://narkive.com/0RdHHA6A>
In-Reply-To: <CAAV4SYaGDc79SQ7ONFvkGi_Hsw_4GXHSWwhAJ2ChkTKAcp9hZA@mail.gmail.com>
References: <20170906145409.1085-1-charles@ccxtechnologies.com>
 <20170906182324.GB2885@scaer>
 <CAAV4SYaGDc79SQ7ONFvkGi_Hsw_4GXHSWwhAJ2ChkTKAcp9hZA@mail.gmail.com>
Message-ID: <20170906191053.GC2885@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, All,

On 2017-09-06 14:48 -0400, Charles Eidsness spake thusly:
> It also fails in Arch Linux.

This is interesting to know.

> There are other packages with the same setting, binutils, gcc,
> gutenprint, and thrift.

For gcc and binutils, this is expected and normal: those are components
of the toolcahin, and passing --with-sysroot to them is what makes it
useless to pass to all other packages.

For gutenprint, it's been there since the package was added, with no
explanation why it was needed. It's not much better for thrift, added at
about the same time.

> Maybe it should be set for all autotools
> packages.

I don't think so... If at all, it should be removed from thrift and
gutenprint.

> The issue is that lt_sysroot isn't being set in the libtool script for
> systemd.

Yes, I believe this is a libtool issue.

> It's cool if you find a better way to fix this issue, I have a fix that
> will let me built so I'm happy.

Yes, I am looking into that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Jan 2016 23:08:12 +0100
Subject: [Buildroot] [PATCH 2/3] defconfigs: use the new
 headers-version-same-as-kernel-version option
In-Reply-To: <CAJJ6jxtuOqfdTsbgcbwP1+y5yuLGFi-Ny5=_96kMhaWpSN5uvA@mail.gmail.com>
References: <cover.1453314776.git.yann.morin.1998@free.fr>
 <811e1f5fe52c239010c412ce9f22b307d115cfcf.1453314776.git.yann.morin.1998@free.fr>
 <20160120213824.686c94fb@free-electrons.com>
 <87powwrlbr.fsf@dell.be.48ers.dk>
 <CAJJ6jxtuOqfdTsbgcbwP1+y5yuLGFi-Ny5=_96kMhaWpSN5uvA@mail.gmail.com>
Message-ID: <20160120220812.GE3992@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On 2016-01-20 13:37 -0800, Steve Calfee spake thusly:
> Can we still have different header and kernel versions?

Yes! :-)

> As I understand it we have to rebuild the toolchain when we change
> header versions. So if I have a working embedded system based on
> kernel x and am trying to get a new one working with kernel x+1, I
> really don't want to change the kernel header version. In this case
> they should be backward compatible. And rebuilding the toolchain is
> such a pain that I always use an external toolchain, even if using the
> buildroot internal built one.

When you use an external toolchain, you can't use this new
same-version-as-for-kernel option, since it is only available for
the internal toolchain.

For the external toolchain (even if built by Buildroot), you anyway have
to tell what the kernel series the headers are from.

> So as long as I can still have separate header/kernel versions, I am
> happy with this change. Otherwise, it will be a pain with more full
> rebuilds.

No, it is just another option.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

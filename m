From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Feb 2017 16:54:03 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26
In-Reply-To: <20170227142854.34d3fb86@free-electrons.com>
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
Message-ID: <20170227155403.GB3655@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-27 14:28 +0100, Thomas Petazzoni spake thusly:
[--SNIP--]
> >          arc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/fb677a917545adee321bdcd2c2519c81326448c4
> 
> ../video/out/filter_kernels.c: In function 'jinc':
> ../video/out/filter_kernels.c:318:18: error: implicit declaration of function 'j1' [-Werror=implicit-function-declaration]
>      return 2.0 * j1(x) / x;
> 
> Vlad, this is only occurring on ARC, could you have a look?

That's again because of the Synopsys toolchain, whise uClibc has been
configured without the "Bessel functions of the first kind".

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

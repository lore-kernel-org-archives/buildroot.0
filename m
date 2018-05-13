From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 May 2018 21:54:03 +0200
Subject: [Buildroot] [PATCH 0/2] package/jamvm: fix build on MIPS
In-Reply-To: <20180513214829.3572c662@windsurf.home>
References: <cover.1526207669.git.yann.morin.1998@free.fr>
 <20180513214829.3572c662@windsurf.home>
Message-ID: <20180513195403.GL22130@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-05-13 21:48 +0200, Thomas Petazzoni spake thusly:
> On Sun, 13 May 2018 12:34:35 +0200, Yann E. MORIN wrote:
> 
> > Yann E. MORIN (2):
> >       package/jamvm: move arch dependency to a symbol
> >       package/jamvm: restrict on what MIPS procs are allowed
> 
> Thanks, series applied to master. To be honest, I don't fully
> understand the MIPS details, but since we no longer have anyone really
> taking care of this architecture, it's not a big deal if we exclude too
> many MIPS variants. They can always be re-enabled later when/if someone
> complains.

Neither do I understand entirely either, but this code:

    swc1 $f1,4($8)

will cause binutils to warn if FP ABI is fp32, or error out if it is
either fpxx or fp64.

Sicne that code in jamvm depends on the use of hard floats, we just
allow it for soft-float or fp32.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

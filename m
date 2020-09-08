From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Sep 2020 09:36:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/strace: disable mpers support
In-Reply-To: <20200908085449.35e7ec6f@windsurf.hq.k.grp>
References: <20200907202410.12228-1-heiko.thiery@gmail.com>
 <20200907225655.GU14354@scaer>
 <20200908085449.35e7ec6f@windsurf.hq.k.grp>
Message-ID: <20200908073601.GV14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-09-08 08:54 +0200, Thomas Petazzoni spake thusly:
> On Tue, 8 Sep 2020 00:56:55 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > However, some systems may very well run a 64-bit kernel with a 32-bit
> > userland. In that case, strace should be able to interpret the syscalls
> > made by the process and the replies sent by the kernel, and those are
> > done in the bitness of the process, not of the kernel.
> > 
> > So, we always want an strace that is of the same bitness as the
> > userland. And so I indeed think we do not need this ill-named
> > multi-personality support of strace.
> > 
> > Note that some people may however run such multi-bitness systems. But in
> > that case, they had to build two userlands, a 32-bit one and a 64-bit
> > one, and somehow aggregate the two after the fact. In that case, they
> > would bear the responsibility to carry an strace for each bitness.
> 
> So, is this an Acked-by for this patch ? :-)

It would, but I'd still like to have some feedback from Baruch, who had
initial added of the mpers option, so may have further explanations to
provide.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

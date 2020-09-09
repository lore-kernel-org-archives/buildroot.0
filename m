From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 22:42:43 +0200
Subject: [Buildroot] [PATCH] libcap: disable GOLANG
In-Reply-To: <d1e0d62f-098d-4dbb-037a-8f827772dd1e@aliyun.com>
References: <1f3d9456-9ca2-75f4-7e15-d851e65005ea@aliyun.com>
 <873642deyy.fsf@dell.be.48ers.dk>
 <d1e0d62f-098d-4dbb-037a-8f827772dd1e@aliyun.com>
Message-ID: <20200909204243.GS14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tian Yuanhao, All,

On 2020-09-01 00:14 +0800, Tian Yuanhao via buildroot spake thusly:
> This patch is for the next branch.
> 
> Recently, the go infrastructure has changed, and libcap has been
> upgraded to 2.42. libcap introduced golang in 2.28, see:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/Make.Rules?id=0615d996379dceedefcd65a114f93fefd81c208f
> 
> When you compile host-go and then compile host-libcap, GOLANG will be
> automatically set to yes. Because libcap.mk lacks golang support,
> compilation will fail.

I've taken those explanations and used them as the new commit log, and
applied the patch.

However, the patch was mangled: TABs were replaced by spaces, so I had
to fix that too.

Applied to master, thanks!

Regards,
Yann E. MORIN.

> > > libcap is a pure C library before 2.27, it lacks some environment
> > > variables set in pkg-golang.mk.
> >
> > Can you be more specific? What exactly is this fixing? I don't see
> > any related autobuilder errors?
> >
> > http://autobuild.buildroot.net/?reason=libcap-2.27
> >
> > And I don't see any reference to GOLANG in libcap-2.27?
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

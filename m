From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Apr 2018 08:07:20 -0500
Subject: [Buildroot] [PATCH] picocom: disable custom baud rate for musl
 libc
In-Reply-To: <04f165bfdd9c1e98e3e8485e392e77b003c92ace.1523354385.git.baruch@tkos.co.il>
References: <04f165bfdd9c1e98e3e8485e392e77b003c92ace.1523354385.git.baruch@tkos.co.il>
Message-ID: <CANQCQpbT_0ccGwWzkV8Dj+CA1XWtZwX64uj2BfTsKNAHQG_=zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Apr 10, 2018 at 4:59 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Since version 3.1 picocom enabled custom baud rate support for x86
> targets. This requires the c_ispeed and c_opseed field in struct termios
> that musl libc does not provide. Disable this feature to fix the build.
>
> Fixes:
> http://autobuild.buildroot.net/results/28e/28ec584484dedfd6ef473dfd9dd24481e27ce2b3/
> http://autobuild.buildroot.net/results/912/912493a8f99416524a5897634ae62604436e9b51/
> http://autobuild.buildroot.net/results/65d/65d0f449822f296dfe6b9be0e03a5a855f700a9e/
>

Baruch, thanks for also posting an update on the github picocom issue
ticket.  We'll see if they plan to add MUSL coexistence/support but
that obviously really doesn't matter for this patch-set.
https://github.com/npat-efault/picocom/issues/100

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 19:43:48 +0100
Subject: [Buildroot] [PATCH] package/ltp-testsuite: simplify code to
 exclude test-cases
In-Reply-To: <YBBYSkMrryKEr3yx@pevik>
References: <20210126174741.1046950-1-yann.morin.1998@free.fr>
 <YBBYSkMrryKEr3yx@pevik>
Message-ID: <20210126184348.GY2325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2021-01-26 18:58 +0100, Petr Vorel spake thusly:
> > We have three conditions under which some tests may get removed:
> > uClibc, musl, static libraries. All three use the same mechanism
> > to exclude those test-cases: remove the files.
> 
> > The first two use a common variable to list the affected files,
> > and share the same hook of their own to iterate over that list,
> > while the third has its own hook.
> 
> > This is not very clean, so switch to using a single variable and
> > a single hook for all three conditions.
> Nice cleanup, thank you!

:-)

> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Applied to master, thanks for the review.

Regards,
Yann E. MORIN.

> Kind regards,
> Petr
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

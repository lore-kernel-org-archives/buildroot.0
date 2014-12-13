From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Dec 2014 11:00:40 +0100
Subject: [Buildroot] [PATCH] package/nettle: fix shared-only build
In-Reply-To: <87zjarrkbn.fsf@dell.be.48ers.dk>
References: <1418419668-13558-1-git-send-email-yann.morin.1998@free.fr>
 <87zjarrkbn.fsf@dell.be.48ers.dk>
Message-ID: <20141213100040.GA4198@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-12-13 10:05 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Changeset f1d3e09 (Build shared libraries only as the default) broke the
>  > nettle package.
> 
>  > nettle really wants to statically link its tools, examples and testsuite
>  > against its own libraries. But for a shared-only build, static libraries
>  > are not even built, so the build breaks when trying to link any of them.
> 
>  > Fix that in two ways:
> 
>  >   - the proper way, by using whatever libraries are available, with a
>  >     preference toward using shared libraries;
> 
>  >   - disabling both examples and testsuite since we do not need them.
> 
>  > Fixes numerous build failures:
>  >     http://autobuild.buildroot.net/results/e93/e93da743c5b84b1bb6274aeee3fe3b52962c560c/
>  >     http://autobuild.buildroot.net/results/51d/51d0138ff39c45603315dcedf1f654c18604e1a8/
>  >     http://autobuild.buildroot.net/results/521/521d979658e402103f1a18fcfeab3f9705f0c000/
>  >     ...
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  > Cc: Peter Korsgaard <jacmet@uclibc.org>
>  > ---
>  >  package/nettle/0001-fix-shared-only-build.patch    | 75 ++++++++++++++++++++++
> 
> Committed, thanks - Don't forget to send the patch upstream.

Well, upstream has changed quite a bit since version 2.7.1. There is a
new 3.0 release, and the patch no longer applies because they changed
the way they link with internal libs.

However, what they've done seems to also work for us. So I'm trying to
bump nettle now. But that's a different story than fixing the build
failures.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Feb 2021 10:51:54 +0100
Subject: [Buildroot] [PATCH-NEXT 2/4] package/linux-firmware.mk: get rid
 of temporary tarball for file installation
In-Reply-To: <875z2we1uy.fsf@dell.be.48ers.dk>
References: <20210212184049.13202-1-peter@korsgaard.com>
 <20210212184049.13202-3-peter@korsgaard.com>
 <20210212203939.GK1679218@scaer> <87blcpezmw.fsf@dell.be.48ers.dk>
 <20210213083705.GO1679218@scaer> <875z2we1uy.fsf@dell.be.48ers.dk>
Message-ID: <20210213095154.GP1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-02-13 10:47 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Peter, All,
>  > On 2021-02-12 22:37 +0100, Peter Korsgaard spake thusly:
>  >> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  >> > Peter, All,
>  >> > On 2021-02-12 19:40 +0100, Peter Korsgaard spake thusly:
>  >> >> There is no specific reason to use a temporary file, we can just as well
>  >> >> pipe the two tar invocations together, so do that instead.
>  >> > Actually, there *is* a reason why an intermediate tarball is used, see
>  >> > commit 21a283ffb0d (linux-firmware: fail build for missing file).
>  >> Ok, so we need to stick a set -o pipefail before?
>  > I prefer if we could cleanup the install sequence, as I suggested and
>  > proposed in another reply.
> Well, having our temporary tarball in the build directory is also kind
> of ugly, but ok - Fine by me.

That will not be worse than now: we already leave the temporary tarball
in the build directory...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

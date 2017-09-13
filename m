From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Sep 2017 07:07:14 +0200
Subject: [Buildroot] [PATCH 1/1] download/git: force gzip compression
	level 6
In-Reply-To: <87shfr4n14.fsf@dell.be.48ers.dk>
References: <1505168020-23634-1-git-send-email-brain@jikos.cz>
 <87shfr4n14.fsf@dell.be.48ers.dk>
Message-ID: <20170913050714.GC3625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-09-12 23:36 +0200, Peter Korsgaard spake thusly:
> >>>>> "Petr" == Petr Kulhavy <brain@jikos.cz> writes:
> 
>  > Force gzip compression level 6 when calculating hash of a downloaded GIT repo.
>  > To make sure the tar->gzip->checksum chain always provides consistent result.`
> 
>  > The script was relying on the default compression level, which must not be
>  > necessarily consistent among different gzip versions. The level 6 is gzip's
>  > current default compression level.
> 
> Committed, thanks.
> 
> Is this just a theoretical issue, or something you have really run into?

Theoretical, see this mail and the ensuing discussion:
    http://lists.busybox.net/pipermail/buildroot/2017-September/202162.html

Yet, for consistency, it is good to force it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

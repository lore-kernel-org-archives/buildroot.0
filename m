From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Feb 2016 20:30:37 +0100
Subject: [Buildroot] [PATCH v1 1/1] coreutils: allow selection of
	installed programs
In-Reply-To: <87y4a9vyw1.fsf@dell.be.48ers.dk>
References: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
 <877fhxaf7l.fsf@dell.be.48ers.dk>
 <CAGkQfmNkVYVb9jP8LgyhfotmQ6rbgR3yNwQN=6Qgb57s6AVA+Q@mail.gmail.com>
 <56CE1E61.7000008@zacarias.com.ar> <20160224214832.GA3449@free.fr>
 <87r3g1zs67.fsf@dell.be.48ers.dk> <20160224221930.GB3449@free.fr>
 <CAGkQfmPYv0oSwO-wuQWDvzt+kC9i=1wcymz6dV7jjP=i9dN7CA@mail.gmail.com>
 <87y4a9vyw1.fsf@dell.be.48ers.dk>
Message-ID: <20160225193037.GA5870@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Peter, All,

On 2016-02-25 11:59 +0100, Peter Korsgaard spake thusly:
> >>>>> "Romain" == Romain Izard <romain.izard.pro@gmail.com> writes:
> >> However, I won't battle over it, as my preference would go with
>  >> hardlinks instead, but that option is not available. Meh... ;-)
>  > The issue is that the single binary mode is much more space-efficient
>  > than the classical mode. For my subset of 52 executables, it takes 704
>  > KiB for the single-binary mode with shebangs, and 1.9 MiB with separate
>  > programs (after stripping). I get a similar ratio if I compress it.
> 
>  > The classical mode is in fact worse than taking the coreutils package
>  > without filtering, which takes 1.5 MiB.
> 
> Crap, so that's no option then. I'll think some more about it.

OK, so we're back to Thomas' initial proposal: provide a single string
option that the user can set to the list of programs he wants:

    config BR2_PKG_COREUTILS_PROGRAMS
        bool "install programs"
        help
          List the programs you want. Leave empty to install all.  

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

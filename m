From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Mar 2018 15:21:42 +0200
Subject: [Buildroot] [PATCH v4 1/9] Makefile,
 skeleton: move the host skeleton logic to host-skeleton package
In-Reply-To: <87r2o8xqbc.fsf@dell.be.48ers.dk>
References: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
 <20180324142008.10375-2-thomas.petazzoni@bootlin.com>
 <87r2o8xqbc.fsf@dell.be.48ers.dk>
Message-ID: <20180325132142.GL2620@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2018-03-25 15:00 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> 
>  > As part of the per-package SDK work, we want to avoid having logic
>  > that installs files to the global HOST_DIR, and instead do it inside
>  > packages. One thing that gets installed to the global HOST_DIR is the
>  > minimal "skeleton" that we create in host:
> 
>  >  - the "usr" symbolic link for backward compatibility
> 
>  >  - the "lib" directory, and its lib64 or lib32 symbolic links
> 
>  > This commit moves this logic to a new host-skeleton package, and makes
>  > all packages (except itself) depend on it. We also make sure that this
>  > host-skeleton package doesn't depend on host-patchelf, because
>  > host-patchelf depends on host-skeleton.
> 
> Ehh, where is that done? Afaik nothing depends on (in the make sense) on
> host-patchelf, it is just forcibly enabled in all configs.

That's because this is a leftover from a previous non-itreration:

    http://lists.busybox.net/pipermail/buildroot/2017-November/207795.html

I guess Thomas just forgot to amend the commit-log. I won;t blame him on
that one, it happens all the time to me as well! ;-)

> Thinking about that, why don't we just make the sdk target depend on
> host-patchelf instead of always building it just in case somebody will
> ever run 'make sdk'?

That's probably good for another, unrelated patch, right?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

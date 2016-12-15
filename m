From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Dec 2016 18:19:53 +0100
Subject: [Buildroot] [PATCH] fs: set packages permissions even with no
 system device tables
In-Reply-To: <87oa0eyvq3.fsf@dell.be.48ers.dk>
References: <1481754490-12801-1-git-send-email-yann.morin.1998@free.fr>
 <87oa0eyvq3.fsf@dell.be.48ers.dk>
Message-ID: <20161215171953.GA3427@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-12-14 23:47 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Currently, when there is no sytem device table (permissions or static
>  > devices) defined, then package permissions are not applied, because they
>  > are guarded by the check on the system device tables being non empty.
> 
>  > Fix that by narrowing the guarding condition.
> 
>  > Note that the dependency on host-makedevs was not conditional; we always
>  > build it even if we don;t need it. Making it conditional is not
>  > possible, because we don't know all the packages permissions by the time
>  > the fs infra is parsed (packages from br2-external are parsed after it).
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  > Cc: Peter Korsgaard <peter@korsgaard.com>
> 
> Committed, thanks.
> 
> Out of interest, what is your use case for NOT having any system device
> table?

It's a combo:
  - custom skeleton
  - custom init system
  - running in a chroot
  - /chroot/dev bind-mounted from the real /dev

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

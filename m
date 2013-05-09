From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 May 2013 00:13:13 +0200
Subject: [Buildroot] [PATCH] package-infra: limit the number of // jobs
In-Reply-To: <1368137000-2766-1-git-send-email-yann.morin.1998@free.fr>
References: <1368137000-2766-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20130509221313.GB2948@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Fri, May 10, 2013 at 12:03:20AM +0200, Yann E. MORIN wrote:
[--SNIP--]
> Limit the number of jobs to the number of CPUs plus one.
[--SNIP--]
> @@ -11,7 +11,7 @@ HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
>  # while waiting on I/O.
>  ifeq ($(BR2_JLEVEL),0)
>  PARALLEL_JOBS:=$(shell echo \
> -	$$((2 * `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))
> +	$$((2 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 0`)))

I forgot to 'git add' before I 'git commit --amend'.
So this should have been a '1 +' not a '2 +'.

Sigh... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

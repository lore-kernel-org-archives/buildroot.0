From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jan 2018 18:06:44 +0100
Subject: [Buildroot] [PATCH 1/7] package/skeleton-init-common: add
 /bin/sh to /etc/shells
In-Reply-To: <87o9lvuqu0.fsf@dell.be.48ers.dk>
References: <1515963815-5843-1-git-send-email-romain.naour@smile.fr>
 <1515963815-5843-2-git-send-email-romain.naour@smile.fr>
 <87o9lvuqu0.fsf@dell.be.48ers.dk>
Message-ID: <20180115170644.GB11122@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-01-15 15:41 +0100, Peter Korsgaard spake thusly:
> >>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:
>  > Add the default shell /bin/sh to /etc/shells only if BR2_SYSTEM_BIN_SH_NONE
>  > is not selected.
> 
>  > Add an empty /etc/shells in the rootfs skeleton.
> 
> Is there any specific reason to have an empty /etc/shells?

In fact, I don't see the point of an empty one, indeed...

> It is a bit noisy to have this extra file in the BIN_SH_NONE case, and
> it afaik changes behaviour (E.G. getusershell() will return default
> values if there is no /etc/shells, but will now presumably return the
> empty string).

Woah.. I did not know about getusershell(), but its API is ugly... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

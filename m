From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 Oct 2015 22:57:48 +0100
Subject: [Buildroot] [PATCH 2/3] skeleton: optionally wait for network
 interfaces to appear
In-Reply-To: <87mvv27jc6.fsf@dell.be.48ers.dk>
References: <1446047943-24641-1-git-send-email-jezz@sysmic.org>
 <1446047943-24641-3-git-send-email-jezz@sysmic.org>
 <20151028174653.GA3650@free.fr> <2419445.kGEUX5UIA3@sagittea>
 <20151028213702.GB3650@free.fr> <87mvv27jc6.fsf@dell.be.48ers.dk>
Message-ID: <20151028215748.GC3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-10-28 22:51 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Also, I read this in man 5 interfaces;
> 
>  >     When ifupdown is being called with the --all option, before doing
>  >     anything to interfaces, if [sic] calls all the hook scripts (pre-up
>  >     or down) with IFACE set to "--all", LOGICAL set to the current value
>  >     of --allow parameter (or "auto" if it's  not set), ADDRFAM="meta"
>  >     and METHOD="none". After all the interfaces have been brought up or
>  >     taken down, the appropriate scripts (up or post-down) are executed.
> 
>  > Since S40network calls 'ifup -a' and you added a pre-up script, I guess
>  > it should filter out the '--all' interface and exit early in that case.
> 
> As far as I can see from the busybox implementation atleast, -a (all)
> only causes it to run ifup/ifdown (with IFACE set to the interface name) for
> each interface listed as auto, so it doesn't do the "--all" thing, but
> the Debian variant does.

Since we already have the option to use the full-fledged ifup-down, we
should support the case where IFACE=--all in the script.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

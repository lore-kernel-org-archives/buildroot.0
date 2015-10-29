From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Thu, 29 Oct 2015 08:53:41 +0100
Subject: [Buildroot] [PATCH 2/3] skeleton: optionally wait for network
 interfaces to appear
In-Reply-To: <20151028213702.GB3650@free.fr>
References: <1446047943-24641-1-git-send-email-jezz@sysmic.org>
 <1446047943-24641-3-git-send-email-jezz@sysmic.org>
 <20151028174653.GA3650@free.fr> <2419445.kGEUX5UIA3@sagittea>
 <20151028213702.GB3650@free.fr>
Message-ID: <5631D085.4080501@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/10/2015 22:37, Yann E. MORIN wrote:
> OK, thanks for the explanations. So there is no relation between the
> 'stanza' name and the script name, right?

None at all. ifupdown just run-parts /etc/if-$PHASE.d/ and the scripts
are responsible for not doing anything when they shouldn't.

> Also, I read this in man 5 interfaces;
> 
>     When ifupdown is being called with the --all option, before doing
>     anything to interfaces, if [sic] calls all the hook scripts (pre-up
>     or down) with IFACE set to "--all", LOGICAL set to the current value
>     of --allow parameter (or "auto" if it's  not set), ADDRFAM="meta"
>     and METHOD="none". After all the interfaces have been brought up or
>     taken down, the appropriate scripts (up or post-down) are executed.
> 
> Since S40network calls 'ifup -a' and you added a pre-up script, I guess
> it should filter out the '--all' interface and exit early in that case.

When run in this case, it will have no IF_WAIT_DELAY variable, so the
script will not do anything.

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 Oct 2015 22:37:02 +0100
Subject: [Buildroot] [PATCH 2/3] skeleton: optionally wait for network
 interfaces to appear
In-Reply-To: <2419445.kGEUX5UIA3@sagittea>
References: <1446047943-24641-1-git-send-email-jezz@sysmic.org>
 <1446047943-24641-3-git-send-email-jezz@sysmic.org>
 <20151028174653.GA3650@free.fr> <2419445.kGEUX5UIA3@sagittea>
Message-ID: <20151028213702.GB3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2015-10-28 21:21 +0100, J?r?me Pouiller spake thusly:
> On Wednesday 28 October 2015 18:46:53 Yann E. MORIN wrote:
> > On 2015-10-28 16:59 +0100, J?r?me Pouiller spake thusly:
> [...]
> > Please drop the empty lines.
> There were empty lines in original patch ;-).

OK, I see. ;-)

Still, please drop them next time, please.

[--SNIP--]
> >   - I looked at man 5 interfaces, and there is no mention of
> > wait-delay,
> 
> I have found documentation related to if-*.d scripts in section called 
> "IFACE OPTIONS" of interfaces(5) of my debian.
> 
> >   - I don't see how 'wait-delay' translates to 'wait_iface'
> 
> From interfaces(5):
> 
>   "Additionally, all options given in an interface definition stanza are 
> exported to the environment in upper case  with  "IF_"  prepended  and  
> with hyphens converted to underscores and non-alphanumeric characters 
> discarded."

OK, thanks for the explanations. So there is no relation between the
'stanza' name and the script name, right?

Also, I read this in man 5 interfaces;

    When ifupdown is being called with the --all option, before doing
    anything to interfaces, if [sic] calls all the hook scripts (pre-up
    or down) with IFACE set to "--all", LOGICAL set to the current value
    of --allow parameter (or "auto" if it's  not set), ADDRFAM="meta"
    and METHOD="none". After all the interfaces have been brought up or
    taken down, the appropriate scripts (up or post-down) are executed.

Since S40network calls 'ifup -a' and you added a pre-up script, I guess
it should filter out the '--all' interface and exit early in that case.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

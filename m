From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jul 2020 14:24:57 +0200
Subject: [Buildroot] [PATCH] initscripts: Make installation of
 S20urandom optional.
In-Reply-To: <20200719140921.5bc74639@gmx.net>
References: <20200718224444.2748609-1-christoph.muellner@theobroma-systems.com>
 <20200719100514.618894ca@windsurf.home>
 <20200719114950.GT18825@scaer> <20200719140921.5bc74639@gmx.net>
Message-ID: <20200719122457.GV18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-07-19 14:09 +0200, Peter Seiderer spake thusly:
> On Sun, 19 Jul 2020 13:49:50 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > I would however believe this script is not interesting at all. In fact,
> > an ambedded device seldom reboots nicely; instead, it is most often a
> > hard-reboot (with a power cycle). In that case, the script would have no
> > chance whatsoever to save the current seed before shutdown, thus on next
> > boot we would restore a seed that would have already been used, thus
> > defeating randomness to begin with; worse, it would give people a sense
> > of security where there would in fact be a hole.
> 
> This is a very limited view of the buildroot use-cases, I believe there
> are although some, call it 'mid-range' embedded systems, with a proper
> power-down button shutting down the system before killing the power
> (or at least the use-case of two of my customer projects)...

Yeah, but still, is saving-n-restoring the seed the sanest thing to do?
If your devices are that well engineered (yeah!), you probably have a
good source of randmoness (proably HW, or with rng-tools et al), so
don't need to save-n-restore the seed...

Even for well-designed devices, that can be sanely powered-off-then-on,
there is always the possibility that the power completely goes out, and
thus the seed would be re-used.

Re-using a seed is one of the worst thing one may do about randomness:
it is very, very bad, because it gives people a false sense of security
"Hey! I'm saving and restoring the seed, so no two boots will have the
same random sequence! Woohoo!" Boom, wrong...

So I still stand on my position that we should get rid of S20random.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

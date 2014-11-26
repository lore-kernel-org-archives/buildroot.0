From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Nov 2014 22:44:42 +0100
Subject: [Buildroot] [PATCH v4 next 1/5] support/download: silence git
 if it is a silent build
In-Reply-To: <20141126223822.6083acac@free-electrons.com>
References: <1416837422-1977-1-git-send-email-fabio.porcedda@gmail.com>
 <1416837422-1977-2-git-send-email-fabio.porcedda@gmail.com>
 <20141126213534.GA4260@free.fr>
 <20141126223822.6083acac@free-electrons.com>
Message-ID: <20141126214442.GB4260@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Fabio, All,

On 2014-11-26 22:38 +0100, Thomas Petazzoni spake thusly:
> On Wed, 26 Nov 2014 22:35:34 +0100, Yann E. MORIN wrote:
> > I am not a big fan of this.
> > 
> > I would prefer we pass the quiet flag through the environment, something
> > like this, for example:
> 
> On my side, I'm not a big fan of the environment, I find it a too
> hidden way to pass things.However, I find it a bit clunky to have this
> as a fifth optional argument.

Well, the fact that we relied on the fact that -q is optional so had to
be the fifth argument is what bothered me. If we were to be adding new
optional flags, we'd be stuck. Passing them through the environment made
it possible to add extra optional flags (although I wonder what those
might be).

> The solution I would find the cleanest
> would be to use real arguments for the download helper scripts, using
> getopt.
> 
> Like:
> 	git -o <output> -r <repo> -c <cset> -b <basename> [-q]

Yes, agreed.

Let's go for getopt in all helper scripts.

No need to recognise long options, though; shirt options are enough.

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

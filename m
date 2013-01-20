From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jan 2013 15:22:27 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	yem-instrument-build
In-Reply-To: <20130120151016.32c95e00@skate>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
 <20130120151016.32c95e00@skate>
Message-ID: <201301201522.27762.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 20 January 2013 Thomas Petazzoni wrote:
> On Thu, 17 Jan 2013 00:41:34 +0100, Yann E. MORIN wrote:
> > Yann E. MORIN (6):
> >       pkg-infra: log current message
> >       toolchain/external: sprinkle with some calls to MESSAGE
> >       toolchain/crosstool-ng: sprinkle with some calls to MESSAGE
> >       toolchain/gcc: sprinkle with some calls to MESSAGE
> >       toolchain/kernel-headers: sprinkle with some calls to MESSAGE
> >       toolchain/uClibc: sprinkle with some calls to MESSAGE
> 
> I think the "pkg-infra: log current message" needs a bit more
> discussion (I'm generally OK with it, just needs more time to think
> about it).

Yes, this one I expected some talk about.

Hooking into MESSAGE to instrument the build does not seem like the
panacea. It was just a quick-and-easy way to try and have the auto-
builders get a bit more info about a failure, so that more advanced
actions could be made (eg. bug-mail the last author of a package).

> However, the 5 followup patches that add appropriate MESSAGE
> calls in various locations of the code look good to me, and they can be
> committed now in order to reduce the burden of maintaining those
> patches from Yann's side.

I will apply Arnout's eye-candy changes, and will re-submit those patches.

I'll also revert the orderiung of the patches: the new calls to MESSAGE
do not depend on patch 1/5.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

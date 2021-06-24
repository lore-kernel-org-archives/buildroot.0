From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Jun 2021 18:22:46 +0200
Subject: [Buildroot] [PATCH 04/15] package/pkg-generic.mk: Fix .la files
 overwrite detection
In-Reply-To: <20210624174450.24fb83d4@fedora>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-5-herve.codina@bootlin.com>
 <20210621214223.GC44262@scaer>
 <20210622113124.7cf2dde1@bootlin.com>
 <20210622095609.GD44262@scaer> <20210622121220.5d4520e2@windsurf>
 <20210622103039.GG44262@scaer> <20210624174450.24fb83d4@fedora>
Message-ID: <20210624162246.GB1126048@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-06-24 17:44 +0200, Herve Codina spake thusly:
> On Tue, 22 Jun 2021 12:30:39 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > Well, I still disagree, because this patch really fixes an issue
> > introduced *in the infra* by the first patch.
> Well, my bad.

No worries, really! This series is quite the complex one. ;-)

> I think that the better thing to do is to fully rework the history.
> First fixing overwrites and then introducing the overwrite detection tooling
> (ie the actual PATCH 1 will be moved just before actual PATCH 12 and so
> actual PATCH 4 simply disappears).
> 
> The patch introducing the tooling will explain in its commit message
> why the calls to fixup-libtool-files and fixup-python-files are performed
> before taking the overwrite snapshot and why it is safe (sed --in-place).

Exactly! :-)

> The variable <PKG>_PER_PACKAGE_TWEAK_HOOKS (or other name) will be introduced
> before the tooling. The patches changing some packages to use this variable
> (move tweaks from <PKG>_POST_CONFIGURE_HOOKS to <PKG>_PER_PACKAGE_TWEAK_HOOKS)
> will also be introduced before the tooling even if these changes really make
> sense after the tooling introduction.
> Indeed, the notion of action done before taking the overwrite detection
> snapshot (<PKG>_PER_PACKAGE_TWEAK_HOOKS) and action done after
> (<PKG>_PRE_CONFIGURE_HOOKS, configure and <PKG>_POST_CONFIGURE_HOOKS)
> makes sense only with the overwrite detection tool.
> 
> Is that seem better for everyone ?

It looks a sane ordering to me, yes. THanks for working on this!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

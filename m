From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Nov 2019 19:09:58 +0100
Subject: [Buildroot] [PATCH 1/1] Include makefiles from GLOBAL_PATCH_DIR
In-Reply-To: <20191106233100.3b66c426@windsurf>
References: <20191026145151.17749-1-jeremy.rosen@smile.fr>
 <20191106163748.GA3419@scaer> <20191106233100.3b66c426@windsurf>
Message-ID: <20191107180958.GC3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-11-06 23:31 +0100, Thomas Petazzoni spake thusly:
> On Wed, 6 Nov 2019 17:37:48 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > So, I am afraid that these overrides are a poor excuse for not wanting to
> > do actual VCS work.
> Well, you are the one who introduced BR2_EXTERNAL in the first place!

Ahem... git show a4239f7fd10 ;-)

I did introduce support for multi br2-external, though.

Anyway, this patch, as on IRC by J?r?my, has a designe flaw: since the
override files are included too early, they hcamge the way pkgdir is
computed, and this breaks completely.

This can be corrected, though, and it might even not be too complex to
do.

But if we're going to do the override stuff, I think we must think it
thouroughly, and not use an half-baked solution.

If at all, I'd favour looking at the aternate solution that was floated
around during the last devdays: postpone evaluation of the infras to
after all the packages hav actually been scanned. This would even allow
overriding the type of a package (e.g. autotools-package instead of
meson-package, in case the version was changed to use another
buildsystem).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

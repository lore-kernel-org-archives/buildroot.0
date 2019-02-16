From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Feb 2019 23:29:04 +0100
Subject: [Buildroot] [PATCHv4 5/8] Config.in: reintroduce BR2_SSH
In-Reply-To: <CAAXf6LXAyeN6u=TqHrUjVgYWEhFHohvx_zb-CUiq27-mzprDwg@mail.gmail.com>
References: <20190215210803.8969-1-patrickdepinguin@gmail.com>
 <20190215210803.8969-5-patrickdepinguin@gmail.com>
 <20190216123420.GS3079@scaer>
 <CAAXf6LXAyeN6u=TqHrUjVgYWEhFHohvx_zb-CUiq27-mzprDwg@mail.gmail.com>
Message-ID: <20190216222904.GW3079@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-02-16 22:23 +0100, Thomas De Schampheleire spake thusly:
> El s?b., 16 feb. 2019 a las 13:34, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
> > On 2019-02-15 22:08 +0100, Thomas De Schampheleire spake thusly:
> > > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > >
> > > The BR2_SSH command was removed in commit
> > > db9473bf6cd7bd12aa1f9faad0a917c973c33827 ("core/download: drop the SSH
> > > command") but will be needed again to support 'source-check' for the scp
> > > download backend.
> >
> > Rather than do a new commit, why did you not use "git revert"?
> 
> How does this make a difference when sending patches via email?

git-revert prepares the git commit with appropriate information about
the revert:

    Revert "core/download: drop the SSH command"

    This reverts commit db9473bf6cd7bd12aa1f9faad0a917c973c33827.

And then you can amend the commit log to explain why it is reverted.

> The background is that originally this change was put together with
> the scp source-check implementation, which was based on the
> implementation I had in my work repository, where BR2_SSH was not yet
> removed. Only later I split this patch apart and didn't think of using
> 'git revert'.

OK, that explains it.

> > > +export SSH := $(call qstrip,$(BR2_SSH))
> > To be noted: the commit you are (manually) reverting did not export SSH,
> > but now you do need to do so, because it will now be used from one of a
> > download backends, when the original use of SSH was done in Makefile
> > code.
> Yes indeed, that is true.

And hence, as you are not reinstating the code exactly as it was prior
to the "reverted" commit, that should have been part of the commit log.

Anyway:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

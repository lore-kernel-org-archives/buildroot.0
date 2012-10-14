From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2012 15:33:54 +0200
Subject: [Buildroot] [PATCH] pkg-avail: make it work without stgit
In-Reply-To: <1350213261-4929-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1347234052-10527-3-git-send-email-yann.morin.1998@free.fr>
 <1350213261-4929-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <201210141533.54869.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 14 October 2012 Thomas Petazzoni wrote:
> In order to make this script usable by more developers, make it work
> without stgit. It supports a --mode=stgit option or a --mode=git
> option. When using --mode=stgit, it will preserve its existing
> behavior, when using --mode=git, it will simply make git commits
> without fuzzing needlessly with stgit.

You are right. This script should not depend on anything else than git.

That I use stgit behind the hood, when it is not a required tool imposed
by upstream, is my problem, and should be no concern for upstream.

> I still don't understand why people keep using stgit. I guess it's a
> remnant of quilt-style workflow or something like that, because the
> plain git, with its "git rebase -i" feature, allows to do exactly the
> same thing, without having to use a separate tool. So people using
> stgit should /really/ consider having a serious look at "git rebase
> -i", and when they will see the light, they will wonder why for so
> many years they have suffered in keeping their old-style quilt-looking
> workflows.

I use stgit because I like the patch-queue semantic better, and I find it
much easier to work with, than the rebase semantic.

Also, what I am interested in, is getting changes upstream; that's my goal.
I am not interested in learning how to use *git* per-se: it is just a tool
to achieve that goal. If I can achieve the exact same goal by using the
much simpler stgit, then I'll use that, even if git is more powerful.

And no, I never used quilt before. And no, I am not suffering of using
stgit (quite the opposite, to be true). ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

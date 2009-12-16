From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 16 Dec 2009 14:56:38 -0500
Subject: [Buildroot] OT: git workflow question
In-Reply-To: <hgb3a3$88l$1@ger.gmane.org>
References: <hgb3a3$88l$1@ger.gmane.org>
Message-ID: <a038bef50912161156l76de00ev1dd90bd8f9ae281f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 16, 2009 at 11:53 AM, Grant Edwards
<grant.b.edwards@gmail.com> wrote:
>
> Here's my question: why was there a conflict?
>
> Is this how git is supposed to work?

Chances are you changes got massaged on the way in, either
intentionally or by some script/git configuration (whitespace.strip
catches me out a lot). Some maintainers I've seen on other projects
insist that patches are perfect before they apply them. From what I've
seen Peter is a bit more pragmatic and is happy to make small
changes/amendments to patches as they get applied.

When you pull from the upstream buildroot git sees both sets of
changes and flags them as a conflict.

The best advice would be to work on local branches for logical sets of
changes (in my case I've just got one branch because I'm only
tinkering with buildroot). You can then rebase (git rebase
origin/master <branch> or git pull --rebase) these branches or blow
them away when you're done (git branch -d <branch>). Git also has a
merge helper (git mergetool) which can be configured with a graphical
diff tool like kdiff3 to make resolving merges easier.

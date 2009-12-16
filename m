From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 16 Dec 2009 21:00:23 +0100
Subject: [Buildroot] OT: git workflow question
In-Reply-To: <hgb3a3$88l$1@ger.gmane.org>
References: <hgb3a3$88l$1@ger.gmane.org>
Message-ID: <200912162100.23649.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grant Edwards, 2009-12-16:
> I don't seem to "get" git when it comes to working with
> buildroot.
> 
>  1) I cloned the repository about two weeks ago
> 
>  2) I made a bunch of small edits to docs/buildroot.html and
>     commited them locally.
> 
>  3) I submitted the changes using git format-patch
> 
>  4) The patches were merged to the "master" repository
> 
>  5) Then when I did a "git pull" to update my repository, it
>     failed because of conflicts in docs/buildroot.html

If you don't have problems with rewritten history, then "git rebase"
may suit your needs better. Can also be used with "git pull --rebase".

> Since I had only changed the one file (and those changes had
> been merged into the master repository) I didn't bother trying
> to resolve the conflict -- I just blew away my repository and
> did a 'clone'.

You should never need to do a fresh clone. Read about "git reset --hard"
for escaping from a mess.

> Here's my question: why was there a conflict?

I'm aware of 2 possible reasons:
Either Peter has fixed something in your patch before he committed it or
commit 16c1549fd22af9a5fedd98d173a4c229b909af4c, which touched the same
file afterwards, caused the conflict.

Markus

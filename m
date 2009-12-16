From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 16 Dec 2009 21:06:30 +0100
Subject: [Buildroot] OT: git workflow question
In-Reply-To: <20091216203728.1ddc624c@surf>
References: <hgb3a3$88l$1@ger.gmane.org> <20091216203728.1ddc624c@surf>
Message-ID: <200912162106.31044.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni, 2009-12-16:
> > Is this how git is supposed to work?
> 
> No. You should have made your changes in a separate branch instead of a
> master branch.

I don't think this is always necessary. Depending on the amount of
changes he is working on, working on one branch and rebasing against
origin is sufficient and may be the better approach.

> Then, you submit your patches. When they are merged, you
> do "git pull" in your master branch. And then "git branch -d
> yourbranch". If everything has been merged, "git branch -d" will
> succeed,

No, it will never succeed for him, because Peter applies his patches. It
works for you, because Peter doesn't apply patches from you, but merges
your branches. So the commit SHA1 stays the same in your case.

Markus

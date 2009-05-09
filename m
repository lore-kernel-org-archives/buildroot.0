From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 9 May 2009 11:18:16 +0200
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <d6cda7730905080356i3e2db098yc8d3cc66c41f6ac7@mail.gmail.com>
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<87ab5oapss.fsf@macbook.be.48ers.dk>
	<d6cda7730905080356i3e2db098yc8d3cc66c41f6ac7@mail.gmail.com>
Message-ID: <200905091118.16708.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thiago A. Corr?a, 08.05.2009:
> I somehow managed
> to completely trash my local tree and had to clone it again from the
> remote.

You shouldn't ever need to do a complete clone again, unless you did
something really strange. If you messed you local branches, then you can
recreate them from the remote branches or from the reflog which also
contains local changes. If you removed remote branches, you can simply
do "git fetch".

> I really miss svn revert... If I remove some file from the
> local tree, I can't bring it back with git fetch, git checkout or git
> reset.

Yes, you can, with checkout/reset. But it's be a bit different compared
to svn because of git's index. "git status" gives you hints what to do.
To prevent confusion: if you want to revert a particular file, that is
currently in the index, you need to invoke 2 commands: reset && checkout

Markus

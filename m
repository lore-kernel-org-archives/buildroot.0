From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 20:37:28 +0100
Subject: [Buildroot] OT: git workflow question
In-Reply-To: <hgb3a3$88l$1@ger.gmane.org>
References: <hgb3a3$88l$1@ger.gmane.org>
Message-ID: <20091216203728.1ddc624c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 16 Dec 2009 16:53:24 +0000 (UTC),
Grant Edwards <grant.b.edwards@gmail.com> a ?crit :

> Since I had only changed the one file (and those changes had
> been merged into the master repository) I didn't bother trying
> to resolve the conflict -- I just blew away my repository and
> did a 'clone'.
> 
> Here's my question: why was there a conflict?

Not sure why, Peter will probably give an explanation.

> Is this how git is supposed to work?

No. You should have made your changes in a separate branch instead of a
master branch. Then, you submit your patches. When they are merged, you
do "git pull" in your master branch. And then "git branch -d
yourbranch". If everything has been merged, "git branch -d" will
succeed, otherwise it will fail (and you can use "git branch -D" to
remove a branch that hasn't been merged).

This is at least how I'm contributing to Buildroot. Not necessarly the
cleanest way, I'm no git expert.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com

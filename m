From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 07:53:44 +0200
Subject: [Buildroot] [PATCH 1/2] git: fix handling of git repos using
 master as version
In-Reply-To: <37ce9be2-db77-c8e4-08a3-b70b4fc895c4@mind.be>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
 <20180604163302.2d529afd@windsurf>
 <CAESO2E+hb8=2vfAstXvYeG05L6ELKMHcYCGkoHRukptkrDhZHQ@mail.gmail.com>
 <20180604154433.GA3700@scaer>
 <CAESO2EJ7pwkrsrmarwBkpS7SswumuepmCYo01x2j0xpMmhGUCg@mail.gmail.com>
 <20180604165210.GA23325@g751.home>
 <37ce9be2-db77-c8e4-08a3-b70b4fc895c4@mind.be>
Message-ID: <20180605075344.670b31d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Jun 2018 00:19:41 +0200, Arnout Vandecappelle wrote:

> >> $ git ls-remote git at gitlab.com:adhlinux/buildroot/buildroot.git master
> >> 407fb2fe202aaeb273e4986dc88c30596a7fe8db    refs/heads/master
> >> 407fb2fe202aaeb273e4986dc88c30596a7fe8db    refs/remotes/upstream/master  
> > 
> > Yes 'ls-remote' is actually a good option.   
> 
>  It's a bit racy though. By the time you do the actual fetch, the remote branch
> may already have been updated by someone else.

And ?

Even if you get the latest commit in the branch, by the time the build
is finished, someone might have pushed some other changes.

There's nothing racy here: you are going to build the latest commit at
the moment of git ls-remote. There might obviously be further commits
made later on, either during the build or after the build. Whether
those commits were made right between ls-remote and the actual build,
or during the build, or after the build doesn't really matter.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

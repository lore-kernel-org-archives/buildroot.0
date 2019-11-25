From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 11:56:30 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-11-24
In-Reply-To: <0d328fb7-d1a9-aef5-2846-82bd2d55bac9@railnova.eu>
References: <5ddb8024.1c69fb81.357d6.9264SMTPIN_ADDED_MISSING@mx.google.com>
 <0d328fb7-d1a9-aef5-2846-82bd2d55bac9@railnova.eu>
Message-ID: <20191125115630.66ffb5f0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Titouan,

On Mon, 25 Nov 2019 10:13:05 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> >               name              | found by |        link to release-monitoring.org        |   version    |   upstream
> > -------------------------------+----------+----------------------------------------------+--------------+--------------
> >                           redis |  DISTRO  | https://release-monitoring.org/project/04181 | 5.0.5        | 5.0.7
> >   
> 
> This is lagging behind, Redis was already bumped to 5.0.6 one week ago, 
> and to 5.0.7 over the week-end :)

When a next branch exists, we use the next branch as the source of
information for what is the current version of each package in
Buildroot. We do this because typically, next is more "up to date" than
master.

However, in this specific case, redis was bumped to 5.0.7 in master,
but not in next, so until next gets merged back into master, our
tooling will think redis is at 5.0.5, because that's the version used
in next.

Perhaps this could be improved by grabbing both master and next, and
retaining the highest version between both, for each package. But oh
well, that's quite some additional complexity :/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

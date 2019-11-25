From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 25 Nov 2019 14:58:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-11-24
In-Reply-To: <20191125115630.66ffb5f0@windsurf>
References: <5ddb8024.1c69fb81.357d6.9264SMTPIN_ADDED_MISSING@mx.google.com>
 <0d328fb7-d1a9-aef5-2846-82bd2d55bac9@railnova.eu>
 <20191125115630.66ffb5f0@windsurf>
Message-ID: <1712d8e0-b249-d69a-b3c9-673369890b3c@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 11/25/19 11:56 AM, Thomas Petazzoni wrote:
> 
> When a next branch exists, we use the next branch as the source of
> information for what is the current version of each package in
> Buildroot. We do this because typically, next is more "up to date" than
> master.

Side question: what's the policy for committing to master vs. next ?

> 
> However, in this specific case, redis was bumped to 5.0.7 in master,
> but not in next, so until next gets merged back into master, our
> tooling will think redis is at 5.0.5, because that's the version used
> in next.


Thanks for the explanation, that makes much more sense.

> 
> Perhaps this could be improved by grabbing both master and next, and
> retaining the highest version between both, for each package. But oh
> well, that's quite some additional complexity :/

If you think that's worth it, I can have a look at that. Hence this 
shameless question: where does this code actually live ?

In Buildroot's repo:
$ git grep 'link to release-monitoring.org' | wc -l
0

> 
> Best regards,
> 
> Thomas
> 

Regards,

Titouan

From: Andrew Jeffery <andrew@aj.id.au>
Date: Tue, 14 Aug 2018 22:26:48 +0930
Subject: [Buildroot] [PATCH 1/1] support: git: Use git-archive to
 generate download tarball
In-Reply-To: <20180814142943.1278222d@windsurf>
References: <20180814120532.20077-1-andrew@aj.id.au>
 <20180814142943.1278222d@windsurf>
Message-ID: <1534251408.795230.1473682832.54A0626E@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 14 Aug 2018, at 21:59, Thomas Petazzoni wrote:
> Hello Andrew,
> 
> On Tue, 14 Aug 2018 21:35:32 +0930, Andrew Jeffery wrote:
> > Using tar's --transform option with the previously specified regex
> > breaks relative symlinks, as the target path starts with the sequence
> > './'. Avoid the need for --transform and indirectly generate a tar via
> > `git archive` to preserve accuracy of archive content.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> See commit 3abd5ba4243489b821d44e407528020cd8a138f8
> ("support/download/git: do not use git archive, handle it manually")
> 
>     We currently use git-archive to generate the tarball. This is all handy
>     and dandy, but git-archive does not support submodules. In the follow-up
>     patch, we're going to handle submodules, so we would not be able to use
>     git-archive.

Agh, righto. I thought there must be some reason for avoiding it though didn't
look too deeply. I guess I should find some other way around the breakage I'm
seeing.

Thanks for the pointer.

Andrew

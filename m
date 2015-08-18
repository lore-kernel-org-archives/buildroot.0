From: Alex Suykov <alex.suykov@gmail.com>
Date: Tue, 18 Aug 2015 22:59:38 +0300
Subject: [Buildroot] [PATCH] clapack: musl patches
In-Reply-To: <20150817224326.0e40b56f@free-electrons.com>
References: <20150815161506.GA28405@vostro>
 <20150817224326.0e40b56f@free-electrons.com>
Message-ID: <20150818195938.GB27921@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mon, Aug 17, 2015 at 10:43:26PM +0200, Thomas Petazzoni wrote:

> To be honest, I was a bit hesitant to add the patch that removes
> uninit.c from the build, as the entire clapack thing looks a bit
> complicated, and doing such a change without upstream's opinion is
> dangerous. However, clapack is not that widely used I believe, so let's
> see if that proposal breaks anything for anyone.

Well, I think it should be ok as long as standalone f2c is not involved.

With standalone f2c things will break, not because of this patch, but
because there will be conflict over libf2c.a. But f2c is not something
I would expect to see in buildroot any time soon.

> Alex, could you submit the two patches you have written to the upstream
> clapack project?

Patches sent upstream, let's see what they will reply.

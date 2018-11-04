From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Nov 2018 12:26:38 +0100
Subject: [Buildroot] [PATCH] traceroute: fix 'no rule to make target
 -lm' error
In-Reply-To: <20181104114514.523365ee@windsurf>
References: <1539902241-10211-1-git-send-email-sergio.prado@e-labworks.com>
 <20181104114514.523365ee@windsurf>
Message-ID: <20181104122638.7103719d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 4 Nov 2018 11:45:14 +0100, Thomas Petazzoni wrote:

> We briefly discussed this patch during the Buildroot Developers
> meeting, and setting VPATH clearly cannot be the right solution, it's a
> big hack. A better solution needs to be found :)

Looking at http://autobuild.buildroot.net/?reason=traceroute% gives
some interesting details:

 - Until May 2018, the problem was happening with external toolchains.

 - Then, there's a big gap, with no traceroute failures at all

 - Since September 11, 2018, the problem started happening again, but
   this time around, only with internal toolchains

I looked at the commits on September 10/11, but couldn't spot anything
that looks obviously related. It is also not clear why the problem
disappeared on May 2018. However, back then, it was happening only on
Matt Weber build machine. Since September, with the internal
toolchains, it is happening on apparently all autobuilder machines.

Weird.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

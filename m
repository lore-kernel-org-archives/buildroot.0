From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 23:41:13 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain-wrapper.mk: refactor
 additional flags into TARGET_FLAGS
In-Reply-To: <4a388102-267d-9be5-b293-0877e55ca958@mind.be>
References: <20161018185128.6404-1-arnout@mind.be>
 <4a388102-267d-9be5-b293-0877e55ca958@mind.be>
Message-ID: <20161025234113.45462506@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Oct 2016 20:57:55 +0200, Arnout Vandecappelle wrote:

>  So this is a part of a series I'm trying to build that will sanitize the flags
> passed to the wrapper and passed to the build systems. The idea is that all the
> flags that are currently hardcoded in toolchain-wrapper.c will move into
> TARGET_FLAGS, and that all flags that are currently added to TARGET_CFLAGS but
> not to the wrapper get added to TARGET_FLAGS as well.
> 
>  I have only lightly tested this; Vincent, please include this in your series
> and test for real.
> 
>  I wanted to push this patch fast so Vicente can use it in his series. However,
> the idea is to move all this setting of flags into a new .mk file. I was
> thinking of toolchain/toolchain-flags.mk. If anyone has better ideas, please
> speak up!

Following Vicente's feedback on -mmsa being unsuitable hardcoded in the
wrapper as it breaks the kernel build, I guess your PATCH 2/2 is
not suitable. And therefore, it makes PATCH 1/2 a bit useless.

Until we figure out the appropriate way of solving this problem, I've
marked those two patches as Changes Requested.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

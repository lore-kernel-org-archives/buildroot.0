From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 10 Mar 2011 15:48:40 +0100
Subject: [Buildroot] How to add a board with Buildroot 2011.02
In-Reply-To: <20110308224225.1d924c40@surf>
References: <F41B82AC38A41A41868925971DCBED9E06EFEFC0@rfomb01.corp.atmel.com>
	<20110308224225.1d924c40@surf>
Message-ID: <4D78E4C8.2060009@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3/8/2011 10:42 PM, Thomas Petazzoni wrote:
> The policy I'd like to see is to not add several skeletons to the
> mainline Buildroot tree, or at least not skeleton that are
> board-specific. But of course, it's only my opinion, and as a community
> project, the opinion of others also count.
>
> So, there are three cases :
>
>   *) The changes needed compared to the official skeleton can be
>      directly integrated into this official skeleton, because they make
>      sense in a generic way. In this case, send some patches on the
>      official skeleton, and we'll discuss them.
>
>   *) The changes needed are interesting outside of the specifities of a
>      particular hardware platform (and I think it's generally the case),
>      then we can add a generic Buildroot option that will adjust the
>      official skeleton as needed at build time. This is for example
>      something that is being done for choosing between static /dev,
>      devtmpfs, udev or mdev. It could be done for other customizations.
>
>   *) The changes needed are very board-specific and cannot be considered
>      as generic enough to be configuration options, in that case, what
>      I'd suggest is a post-build script (BR2_ROOTFS_POST_BUILD_SCRIPT)
>      that modifies the target filesystem, potentially by copying files
>      from the board/<manufacturer>/<boardname>  folder.
>
> Don't hesitate to discuss on the list the modifications you need on the
> skeleton, so that we can sort out together into which of the following
> three cases your modifications fall
Actually, I will no more need a specific skeleton for the moment. 
Previous patches done on it are no more needed.

Thanks for this explanation, I will follow your advices if I need to add 
some changes.

Regards

Ludovic Desroches

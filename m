From: Mathieu <mbriand@adeneo-embedded.com>
Date: Tue, 07 Feb 2012 11:06:46 +0100
Subject: [Buildroot] [PATCH] Add Freescale MX53 support
In-Reply-To: <8762fjt2m7.fsf@macbook.be.48ers.dk>
References: <1328273223-16093-1-git-send-email-mbriand@adeneo-embedded.com>
 <1328277370-18423-1-git-send-email-mbriand@adeneo-embedded.com>
 <201202070000.34270.arnout@mind.be> <8762fjt2m7.fsf@macbook.be.48ers.dk>
Message-ID: <1328609206.18704.12.camel@mathieu-OptiPlex-745>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2012-02-07 at 10:27 +0100, Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

>  >> diff --git a/board/freescale/mx53loco/linux.config b/board/freescale/mx53loco/linux.config
>  Arnout>  Personally I'd prefer to use a kernel defconfig (mx5_defconfig), but
>  Arnout> perhaps this one is more appropriate.
> 
> I agree if possible, as that's one thing less to maintain.
> 

There are two differences between mx5_defconfig and this defconfig :
- mx5_defconfig include several BSPs which result in a failure in uImage
building (multiple load addresses).
- CONFIG_MMC_BLOCK is set as module in mx5_defconfig. Since mx53 has no
nand memory, this seemed relevant.

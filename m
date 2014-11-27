From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Nov 2014 22:29:59 +0100
Subject: [Buildroot] [PATCH v2 0/9] Better handling of freescale
 self-extractible binaries
In-Reply-To: <1416432642-26005-1-git-send-email-jezz@sysmic.org>
References: <1416432642-26005-1-git-send-email-jezz@sysmic.org>
Message-ID: <20141127222959.726ca490@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Wed, 19 Nov 2014 22:30:33 +0100, J?r?me Pouiller wrote:

> J?r?me Pouiller (9):
>   freescale-imx: Add helper to extract self-extractible binaries

Applied, after doing several fixes. One of the fix was very important,
since without it, your patch was simply not working. It would be good
to at least minimally test build patches before sending them. See my
changelog:

    [Thomas:
     - reword the comment of the new macro, and add details about the
       expected arguments, as suggested by Yann E. Morin.
     - rework the logic to move the files in $(@D), as it was simply not
       working in the original patch. $(basename $(1)) was used to get the
       filename without the extension, but it also contains the full
       path. $(basename $(notdir $(1))) is needed.]

>   firmware-imx: Use self-extractible helper
>   imx-vpu: Use self-extractible helper
>   libfslcodec: Use self-extractible helper
>   libfslparser: Use self-extractible helper
>   libfslvpuwrap: Use self-extractible helper

All applied, after removing the useless "See freescale-imx.mk" comment.

>   gpu-viv-bin-mx6q: Use self-extractible helper

This patch does not apply to the next branch. Could you respin?

>   libz160: Use self-extractible helper

Applied, but merged into the patch adding libz160.

>   gpu-amd-bin-mx51: Use self-extractible helper

I haven't handled this new package yet.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

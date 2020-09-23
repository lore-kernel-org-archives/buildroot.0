From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 20:56:17 +0200
Subject: [Buildroot] [PATCH 2/3] boards: chromebook: Move "mksd.sh" out
 of chromebook snow folder.
In-Reply-To: <20200921181246.88781-3-bilalwasim676@gmail.com>
References: <20200921181246.88781-1-bilalwasim676@gmail.com>
 <20200921181246.88781-3-bilalwasim676@gmail.com>
Message-ID: <20200923205617.42ba52fe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bilal,

Thanks for your contribution!

On Mon, 21 Sep 2020 23:12:45 +0500
Bilal Wasim <bilalwasim676@gmail.com> wrote:

> The same script is used by Chromebook Elm to generate a bootable
> SD / USB image. Therefore, move the script out of the snow folder
> to one level above (boards/chromebook/snow -> boards/chromebook).
> 
> Update the Chrome snow defconfig to reflect the new location of the
> script.
> 
> Signed-off-by: Bilal Wasim <bilalwasim676@gmail.com>
> ---
>  board/chromebook/{snow => }/mksd.sh | 0
>  configs/chromebook_snow_defconfig   | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename board/chromebook/{snow => }/mksd.sh (100%)

I fixed up a bit the commit title and commit log, and applied. This
indeed is needed as a pre-requisite to adding the Chromebook Elm
configuration.

Another question: could you see if this mksd.sh script can be dropped
in favor of using genimage to generate the SD card image? Indeed,
genimage now has support for GPT partitions, so I believe it should be
able to generate a working image. Do you think you could have a look at
that ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

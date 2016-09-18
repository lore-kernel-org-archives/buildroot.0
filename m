From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 19:59:22 +0200
Subject: [Buildroot] [PATCH 00/11] Series of patch to improve Buildroot
 configuration for
In-Reply-To: <1470827167-9426-2-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
 <1470827167-9426-2-git-send-email-biagio.hkr@gmail.com>
Message-ID: <20160918195922.2dfe74e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Aug 2016 13:05:56 +0200, Biagio Montaruli wrote:

> Biagio Montaruli (11):
>   Update genimage configuration file for Arietta-G25 in order to build  
>       a bootable SD card image named "sdcard.img"
>   Add Linux Kernel stable 4.4.16 patch file for Arietta G25
>   Add post-build.sh script for Arietta G25
>   Add root filesystem overlay files and directories for Arietta G25
>   Update and improve default configuration files for Arietta G25    
>     (both 128MB and 256MB version)
>   Update README file for Arietta G25 named "readme.txt"
>   Add Linux Kernel stable v4.4.16 patch file for Aria G25
>   Add post-build.sh script for Aria G25
>   Update genimage configuration file and add post-image.sh script for   
>      Aria G25 in order to build a bootable SD card image named
>     "sdcard.img"
>   Update and improve default configuration files for Arietta G25    
>     (both 128MB and 256MB version)
>   Update README file for Aria G25 named "readme.txt"

Thanks for this patch series, and sorry for the slow response. However,
there is a big problem with this patch series: it is not bisectable.
For example, if I apply just your first patch, it breaks the build of
the Arietta G25 defconfig. Patch series should be bisectable, i.e I
should be able to apply patches 1 to 3 in your patch series, and still
have a working solution.

In your case, I believe that it would be preferable to have one patch
updating the Arietta configuration entirely (kernel patches, kernel
configuration, Buildroot defconfig, etc.), and similarly one patch for
the Aria configuration.

Also, using proper commit title would be better, like:

	configs/acmesystems_arietta_g25: update with newer kernel

I'll comment separately on the different patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

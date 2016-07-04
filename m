From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 09:04:48 +0200
Subject: [Buildroot] [PATCH 1/1] create-boot-sd.sh: fix script for
 sfdisk (>=2.26)
In-Reply-To: <20160704002229.9354-1-savoundg@gmail.com>
References: <20160704002229.9354-1-savoundg@gmail.com>
Message-ID: <20160704090448.20f94608@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Georges,

On Sun,  3 Jul 2016 17:22:29 -0700, Georges Savoundararadj wrote:
> "Since version 2.26, sfdisk [...] no longer provides any functionality
> for CHS (Cylinder-Head-Sector) addressing." [1]
> 
> The unit used in this script is the cylinder which is not supported in
> the latest versions of sfdisk. However, it supports the deprecated option
> "--unit S" that allows to keep the retro-compatibility with the older
> versions of sfdisk if we use the sector unit.
> 
> This commit converts the offset and size from the cylinder unit (8 bytes)
> to the sector unit (512 bytes).
> 
> [1] man page of sfdisk 2.28
> 
> Signed-off-by: Georges Savoundararadj <savoundg@gmail.com>
> Signed-off-by: Stanislas Bach <sbach@0g.re>

Thanks for this patch. May I ask on which platform you are still using
create-boot-sd.sh ? Indeed, we are trying to move away from this sort
of script and use genimage instead.

As far as I can see, only the imx28evk and imx6sabre support in
Buildroot still have a reference to this script. Are you using of those
two platforms? If that's the case, then we would very much prefer a
solution where the platform is migrated to use genimage.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

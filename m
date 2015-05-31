From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 May 2015 09:25:03 +0300
Subject: [Buildroot] [PATCH 1/1] Solid-Run HummingBoard i2eX defconfig
 and bootable microSD Bash script
In-Reply-To: <alpine.DEB.2.11.1505291022180.2289@tanhuma.tkos.co.il>
References: <1432820170-10513-1-git-send-email-yba@tkos.co.il>
 <20150529044005.GM2260@tarshish>
 <alpine.DEB.2.11.1505291022180.2289@tanhuma.tkos.co.il>
Message-ID: <20150531062503.GC2282@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Fri, May 29, 2015 at 10:56:14AM +0300, Jonathan Ben Avraham wrote:
> On Fri, 29 May 2015, Baruch Siach wrote:
> >On Thu, May 28, 2015 at 04:36:10PM +0300, Jonathan Ben-Avraham wrote:
> >>Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
> >>---
> >> board/solid-run/hummingboard-i2eX/make_sd_card.sh | 207 ++++++++++++++++++++++
> >
> >Is this script better/different than board/freescale/create-boot-sd.sh? I
> >think we should have one script for this job. A "SoM vendor neutral" location
> >for this script is likely to be board/freescale/ in this case. The readme.txt
> >file, once added, should mention this script.
>
> I provided the board/solid-run/hummingboard-i2eX/make_sd_card.sh script
> rather than use the board/freescale/create-boot-sd.sh script for the
> following reasons.
> 
> 1. make_sd_card.sh supports OOT builds. Also support parameters in
> environment variables or command line.
> 
> 2. make_sd_card.sh handles the likely multipath problem that happen in newer
> distros when you change partitions on media.
> 
> 3. Moved the error control to the begining of the script so that there is
> less chance of leaving a mounted filesystem or temporary mount point if some
> requried file is missing and the -e kicks in.
> 
> 4. Provides cumulative error control and check for many more types of error.
> That is, doesn't stop at the first error but continues noting all errors
> possible to detect before actually making any changes.
> 
> 5. Copy only the specific images required rather than using wildcards that
> can result in the wrong images being copied and can leave the newbie
> wondering why the SD doesn't boot.

All these are welcome improvements to board/freescale/create-boot-sd.sh.

> 6. Having a separate script takes into account the fact that we are using
> forked U-Boot repo whose bootcmd might change from the bootcmd in the
> upstream repo.

Which bootcmd you refer to? Is it the U-Boot autoboot environment variable? Or 
the i.MX specific DCD (Device Configuration Data)? If the latter, please note 
that SolidRun provided U-Boot doesn't use DCD at all. The U-Boot SPL 
configures RAM at run time.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

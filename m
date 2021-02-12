From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 09:43:31 +0100
Subject: [Buildroot] Buildroot defconfig issues
In-Reply-To: <20210212091348.75f9cd17@windsurf.home> (Thomas Petazzoni's
 message of "Fri, 12 Feb 2021 09:13:48 +0100")
References: <6025e87c3e3ce_c6a70d4128370@gitlab-sidekiq-catchall-v1-bb68c6455-8rbvh.mail>
 <20210212091348.75f9cd17@windsurf.home>
Message-ID: <878s7the18.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > Hello,
 > On Fri, 12 Feb 2021 02:31:24 +0000
 > GitLab <gitlab@mg.gitlab.com> wrote:

 >> Pipeline #254673538 (
 >> https://gitlab.com/buildroot.org/buildroot/-/pipelines/254673538 )
 >> triggered by Thomas Petazzoni ( https://gitlab.com/tpetazzoni )
 >> had 4 failed builds.
 >> 
 >> Job #1023448804 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/1023448804/raw )
 >> 
 >> Stage: test
 >> Name: raspberrypi3_qt5we_defconfig

 > So this is the infamous pkg-config/qt5webengine issue that Peter
 > Seiderer tried to fix in
 > https://patchwork.ozlabs.org/project/buildroot/patch/20201221203952.22168-3-ps.report at gmx.net/
 > but that I didn't like much.

 > But perhaps what we have at:

 >   https://patchwork.ozlabs.org/project/buildroot/patch/20191205171517.96639-3-michael.drake at codethink.co.uk/
 >   https://patchwork.ozlabs.org/project/buildroot/patch/20191205171517.96639-4-michael.drake at codethink.co.uk/

 > is a better solution for the problem ?

Sorry, don't know.


 >> Job #1023446723 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/1023446723/raw )
 >> 
 >> Stage: test
 >> Name: kontron_smarc_sal28_defconfig

 > ModuleNotFoundError: No module named 'pkg_resources'

 > when building U-Boot. I think a patch was posted not long ago about
 > this. Yes, there:
 > https://patchwork.ozlabs.org/project/buildroot/patch/20210115170156.917086-1-francois.perrad at gadz.org/

It is certainly a simple/pragmatic solution, and "building" setuptools
is very fast.


 >> Job #1023447067 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/1023447067/raw )
 >> 
 >> Stage: test
 >> Name: microchip_sam9x60ek_mmc_dev_defconfig

 > WARN: defconfig ./configs/microchip_sam9x60ek_mmc_dev_defconfig can't be used:
 >       Missing: BR2_PACKAGE_GZIP=y
 >       Missing: BR2_PACKAGE_GDB=y
 >       Missing: BR2_PACKAGE_DOSFSTOOLS=y
 >       Missing: BR2_PACKAGE_DOSFSTOOLS_FATLABEL=y
 >       Missing: BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT=y
 >       Missing: BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
 >       Missing: BR2_PACKAGE_USBUTILS=y
 >       Missing: BR2_PACKAGE_BLUEZ5_UTILS=y
 >       Missing: BR2_PACKAGE_IPERF=y
 >       Missing: BR2_PACKAGE_WGET=y
 >       Missing: BR2_PACKAGE_VIM=y

 > I guess this is due to BR2_USE_WCHAR=y being missing in the defconfig.

Yes, I think so too.


 >> Job #1022937103 ( https://gitlab.com/buildroot.org/buildroot/-/jobs/1022937103/raw )
 >> 
 >> Stage: test
 >> Name: avenger96_defconfig

 > Another case of host-openssl needed:

 > scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
 >  #include <openssl/bio.h>

I've already fixed that.

-- 
Bye, Peter Korsgaard

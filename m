From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Feb 2014 14:20:09 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-01-31
In-Reply-To: <52ECE93C.4090706@barkynet.com>
References: <20140201073011.152691019BF@stock.ovh.net>
 <52ECE93C.4090706@barkynet.com>
Message-ID: <20140201142009.31fc4c52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Sat, 01 Feb 2014 12:31:56 +0000, Martin Bark wrote:

> The axel build errors look to be a failure to download axel-2.4.tar.gz. 
>   Looking at http://axel.alioth.debian.org it seems the download is 
> broken.  The package is available from snapshot.debian.org  and using it 
> fixes the build error for me.

Yes, all alioth downloads are currently broken, because alioth is
broken. I know Peter has reported the issue to the alioth admins, but I
don't know when it is going to be fixed. Last time I discussed with
Peter, we agreed on waiting a few days to see if the problem would be
fixed, and if it doesn't, then we'll change the download URL for all
the packages coming from Alioth:

$ git grep alioth | grep _SITE
package/axel/axel.mk:AXEL_SITE = https://alioth.debian.org/frs/download.php/file/3015
package/ccid/ccid.mk:CCID_SITE = http://alioth.debian.org/frs/download.php/file/3971
package/cloop/cloop.mk:CLOOP_SITE = http://debian-knoppix.alioth.debian.org/packages/sources/cloop
package/libhid/libhid.mk:LIBHID_SITE = http://alioth.debian.org/frs/download.php/file/1958
package/ltrace/ltrace.mk:LTRACE_SITE = http://alioth.debian.org/frs/download.php/file/3947
package/minicom/minicom.mk:MINICOM_SITE = http://alioth.debian.org/frs/download.php/file/3977/
package/pcsc-lite/pcsc-lite.mk:PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/file/3963
package/sane-backends/sane-backends.mk:SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/file/3503

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

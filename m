From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 17:02:27 +0200
Subject: [Buildroot] [PATCH] configs: chromebook snow: bump to linux
	4.6.3
In-Reply-To: <20160704142413.GA13231@vostro.localdomain> (Alex Suykov's
 message of "Mon, 4 Jul 2016 17:24:13 +0300")
References: <20160704142413.GA13231@vostro.localdomain>
Message-ID: <87mvlxe9a4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alex" == Alex Suykov <alex.suykov@gmail.com> writes:

 > No significant changes but 4.6.3 moved parts of the device tree
 > into a different file, so dts patch must be updated.

 > Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
 > ---
 >  board/chromebook/snow/linux-4.3-dts-tpm.patch | 26 --------------------------
 >  board/chromebook/snow/linux-4.3.fragment      |  2 --
 >  board/chromebook/snow/linux-4.6-dts-tpm.patch | 27 +++++++++++++++++++++++++++
 >  board/chromebook/snow/linux-4.6.fragment      |  2 ++
 >  configs/chromebook_snow_defconfig             |  7 +++----
 >  5 files changed, 32 insertions(+), 32 deletions(-)
 >  delete mode 100644 board/chromebook/snow/linux-4.3-dts-tpm.patch
 >  delete mode 100644 board/chromebook/snow/linux-4.3.fragment
 >  create mode 100644 board/chromebook/snow/linux-4.6-dts-tpm.patch
 >  create mode 100644 board/chromebook/snow/linux-4.6.fragment

FYI, the diff is quite a bit easier to read if you enable rename
detection in git-diff when you generate the patch.

> diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
 > index b96441d..408805b 100644
 > --- a/configs/chromebook_snow_defconfig
 > +++ b/configs/chromebook_snow_defconfig
 > @@ -1,16 +1,15 @@
 >  BR2_arm=y
 >  BR2_cortex_a15=y
 > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y

While BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6 is currently the default
value, this will change once 4.7 is released, so I've added an explicit
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y and committed, thanks!

-- 
Bye, Peter Korsgaard

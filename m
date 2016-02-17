From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 16:59:29 +0100
Subject: [Buildroot] [PATCH v3] board: Add support for Acmesystems
	Arietta g25
In-Reply-To: <1454695720-24583-1-git-send-email-angelo.compagnucci@gmail.com>
 (Angelo Compagnucci's message of "Fri, 5 Feb 2016 19:08:40 +0100")
References: <1454695720-24583-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <87vb5nz5su.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > This patch adds a minimal working configuration for
 > Acmesystems Arietta g25.

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 > ---
 > Changelog:
 > v3 -> v3:

 > * Fixing missing DOSFSTOOLS, MTOOLS
 > * Rewording of readme.txt

 > v1 -> v2:

 > * Using genimage for image generation, updating documentation
 >   accordingly.

 >  board/acmesystems/arietta-g25/genimage.cfg      | 35 +++++++++++++++++++
 >  board/acmesystems/arietta-g25/post-image.sh     | 16 +++++++++
 >  board/acmesystems/arietta-g25/readme.txt        | 45 +++++++++++++++++++++++++
 >  configs/acmesystems_arietta_g25_128mb_defconfig | 33 ++++++++++++++++++
 >  configs/acmesystems_arietta_g25_256mb_defconfig | 33 ++++++++++++++++++
 >  5 files changed, 162 insertions(+)
 >  create mode 100644 board/acmesystems/arietta-g25/genimage.cfg
 >  create mode 100755 board/acmesystems/arietta-g25/post-image.sh
 >  create mode 100644 board/acmesystems/arietta-g25/readme.txt
 >  create mode 100644 configs/acmesystems_arietta_g25_128mb_defconfig
 >  create mode 100644 configs/acmesystems_arietta_g25_256mb_defconfig


 > +The image just built is fairly basic and the only output 
 > +you will get is on serial console, please consider to use a DPI 
 > +cable (http://www.acmesystems.it/DPI) 

There's a number of trailing spaces here and elsewhere in the readme.txt

> diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
 > new file mode 100644
 > index 0000000..e7f1dee
 > --- /dev/null
 > +++ b/configs/acmesystems_arietta_g25_128mb_defconfig
 > @@ -0,0 +1,33 @@
 > +# Architecture
 > +BR2_arm=y
 > +
 > +# Toolchain
 > +BR2_KERNEL_HEADERS_VERSION=y
 > +BR2_DEFAULT_KERNEL_VERSION="4.1.1"

With our new same-as-kernel version handling
(BR2_KERNEL_HEADERS_AS_KERNEL) these two lines can be dropped.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard

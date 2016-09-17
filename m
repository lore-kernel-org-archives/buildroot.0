From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 19:28:37 +0200
Subject: [Buildroot] [PATCH v2] boot/uboot: allow to build multiple
 Uboot images
In-Reply-To: <1472819186-30700-1-git-send-email-brain@jikos.cz>
References: <1472819186-30700-1-git-send-email-brain@jikos.cz>
Message-ID: <20160917192837.333f85af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Sep 2016 14:26:26 +0200, Petr Kulhavy wrote:
> Sometimes it is desired to build multiple U-boot images. E.g. one to save into
> flash memory and one for serial load. So far this was not possible.
> 
> This change allows to select any combination of the target formats. They are
> all copied to the image folder.
> 
> Signed-off-by: Petr Kulhavy <brain@jikos.cz>
> ---
>  boot/uboot/Config.in | 19 +++++-----
>  boot/uboot/uboot.mk  | 98 +++++++++++++++++++++++++++++++++-------------------
>  2 files changed, 73 insertions(+), 44 deletions(-)

I've applied your patch, with the following changes:

    [Thomas:
     - Handle the BR2_TARGET_UBOOT_FORMAT_BIN, which wasn't handled, and
       therefore u-boot.bin was not copied when
       BR2_TARGET_UBOOT_FORMAT_BIN=y.
     - Rename UBOOT_BIN to UBOOT_BINS, since it can now contain multiple
       values.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

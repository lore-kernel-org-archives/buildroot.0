From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Jun 2014 23:19:55 +0200
Subject: [Buildroot] [PATCH] configs/calao_qil_a9260: fix kernel build
In-Reply-To: <1401743120-32025-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Jun 2014 23:05:20 +0200")
References: <1401743120-32025-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878upft3es.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The calao_qil_a9260 was not specifying an explicit kernel version, so
 > it ended up downloading the latest kernel version, and therefore fail
 > to apply the patches. This commit changes the defconfig to used a
 > fixed kernel version, so that the patches apply properly. It fixes a
 > Jenkins build failure that has been occuring since quite some time.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Could you also please lock down the kernel headers?

 > ---
 >  configs/calao_qil_a9260_defconfig | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/configs/calao_qil_a9260_defconfig b/configs/calao_qil_a9260_defconfig
 > index f05e95c..aab670e 100644
 > --- a/configs/calao_qil_a9260_defconfig
 > +++ b/configs/calao_qil_a9260_defconfig
 > @@ -11,6 +11,8 @@ BR2_TARGET_BAREBOX=y
 >  BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR="board/calao/qil-a9260/"
 >  BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="qil_a9260"
 >  BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.4.7"
 >  BR2_LINUX_KERNEL_PATCH="board/calao/qil-a9260/linux-3.4.7.patch"
 >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 >  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/calao/qil-a9260/linux-3.4.7.config"
 > -- 
 > 1.9.3

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard

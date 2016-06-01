From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Wed, 1 Jun 2016 10:33:44 -0400 (EDT)
Subject: [Buildroot] [PATCH v3 0/2] ARM: ts4800: add basic board support
In-Reply-To: <1464296633-1880-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1464296633-1880-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <1873895196.97661.1464791624695.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, 
Can anyone take a look at this patch set please? 
Thank you, 

-- 
Patrick Keroulas 
Consultant en logiciel libre, 
Savoir-faire Linux Inc. 

7275 Saint-Urbain, bureau 200 
Montr?al, Qu?bec H2R 2Y5 
t?l: (514) 276-5468 ext. 167 
fax: (514) 276-5465 
_____________________ 


From: "Patrick Keroulas" <patrick.keroulas@savoirfairelinux.com> 
To: "buildroot" <buildroot@busybox.net>, embedded-discuss-bounces at lists.savoirfairelinux.net 
Cc: "Patrick Keroulas" <patrick.keroulas@savoirfairelinux.com> 
Sent: Thursday, May 26, 2016 5:03:51 PM 
Subject: [PATCH v3 0/2] ARM: ts4800: add basic board support 

This patchset adds support for the TS-4800 SoM manufactured by 
Technologic Systems based on the Freescale i.MX515 SoC. 

Patrick Keroulas (2): 
ts4800-mbrboot: new package 
configs: add defconfig for TS-4800 

board/technologic/ts4800/genimage.cfg | 37 +++++++++++ 
board/technologic/ts4800/linux.fragment | 3 + 
...800-add-CONFIG_SYS_FSL_ERRATUM_ESDHC_A001.patch | 36 +++++++++++ 
.../uboot/0002-ts4800-patch-env-to-boot-dts.patch | 56 +++++++++++++++++ 
board/technologic/ts4800/post-image.sh | 23 +++++++ 
configs/ts4800_defconfig | 28 +++++++++ 
package/Config.in | 1 + 
package/ts4800-mbrboot/Config.in | 5 ++ 
package/ts4800-mbrboot/src/LICENSE | 25 ++++++++ 
package/ts4800-mbrboot/src/Makefile | 21 +++++++ 
package/ts4800-mbrboot/src/mbrboot.c | 72 ++++++++++++++++++++++ 
package/ts4800-mbrboot/src/mbrboot.ld | 56 +++++++++++++++++ 
package/ts4800-mbrboot/ts4800-mbrboot.mk | 22 +++++++ 
13 files changed, 385 insertions(+) 
create mode 100644 board/technologic/ts4800/genimage.cfg 
create mode 100644 board/technologic/ts4800/linux.fragment 
create mode 100644 board/technologic/ts4800/patches/uboot/0001-ts4800-add-CONFIG_SYS_FSL_ERRATUM_ESDHC_A001.patch 
create mode 100644 board/technologic/ts4800/patches/uboot/0002-ts4800-patch-env-to-boot-dts.patch 
create mode 100755 board/technologic/ts4800/post-image.sh 
create mode 100644 configs/ts4800_defconfig 
create mode 100644 package/ts4800-mbrboot/Config.in 
create mode 100644 package/ts4800-mbrboot/src/LICENSE 
create mode 100644 package/ts4800-mbrboot/src/Makefile 
create mode 100644 package/ts4800-mbrboot/src/mbrboot.c 
create mode 100644 package/ts4800-mbrboot/src/mbrboot.ld 
create mode 100644 package/ts4800-mbrboot/ts4800-mbrboot.mk 

-- 
1.9.1 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160601/901914cb/attachment.html>

From: Gervais, Francois <FGervais@distech-controls.com>
Date: Fri, 21 Feb 2020 22:10:29 +0000
Subject: [Buildroot] [v5,
 3/9] package/qoriq-rcw: bump to version LSDK-19.09
Message-ID: <DM6PR01MB58498E8B6D7E4DFB76C2F121F3120@DM6PR01MB5849.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerry,

I think this patch breaks:

define HOST_QORIQ_RCW_BUILD_CMDS
        python $(@D)/rcw.py -i $(@D)/custom_board/rcw/$(QORIQ_RCW_PROJECT) -I $(@D)/custom_board -o $(@D)/PBL.bin
endef

host-qoriq-rcw-LSDK-19.09/rcw.py fails with:

"Only Python versions 3.0+ are supported."

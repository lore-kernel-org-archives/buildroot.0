From: Mike Frampton <mikeframpo@gmail.com>
Date: Thu, 19 Nov 2020 22:08:51 +1300
Subject: [Buildroot] [PATCH v2 0/3] add support for Dragonboard410c
Message-ID: <20201119090854.48955-1-mikeframpo@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot devs,

This is my second attempt at submitting a config for the Qualcomm
Dragonboard 410c. Thomas Petazzoni gave me some feedback on the last
series which I have tried to address in this patch.

I have built an image using the defconfig below and tested that it boots
on the DB410c. I also tested that the Wifi works.

Thomas suggested that I change the post-image.sh script so that it
doesn't reference the kernel build path. I was not able to achieve this
because my dtb and Image.gz were not copied to output/images. I
found that only the uncompressed kernel image was copied by the kernel
package, and I think my dts wasn't copied because I had
BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT=y. Is this expected behaviour?

Mike Frampton (3):
  package/qcom-db410c-firmware: new package
  package/abootimg: add host build
  configs/qcom_db410c: new defconfig

 DEVELOPERS                                    |  5 +
 board/qcom/db410c/post-image.sh               | 20 ++++
 board/qcom/db410c/readme.txt                  | 93 +++++++++++++++++++
 configs/qcom_db410c_defconfig                 | 28 ++++++
 package/Config.in                             |  1 +
 package/Config.in.host                        |  1 +
 package/abootimg/Config.in.host               |  8 ++
 package/abootimg/abootimg.mk                  | 10 ++
 package/qcom-db410c-firmware/Config.in        |  6 ++
 .../qcom-db410c-firmware.hash                 |  3 +
 .../qcom-db410c-firmware.mk                   | 41 ++++++++
 11 files changed, 216 insertions(+)
 create mode 100755 board/qcom/db410c/post-image.sh
 create mode 100644 board/qcom/db410c/readme.txt
 create mode 100644 configs/qcom_db410c_defconfig
 create mode 100644 package/abootimg/Config.in.host
 create mode 100644 package/qcom-db410c-firmware/Config.in
 create mode 100644 package/qcom-db410c-firmware/qcom-db410c-firmware.hash
 create mode 100644 package/qcom-db410c-firmware/qcom-db410c-firmware.mk

-- 
2.25.1

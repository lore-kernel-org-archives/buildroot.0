From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 Jan 2021 21:43:45 -0300
Subject: [Buildroot] [PATCH v2 1/8] package/freescale-imx/firmware-imx:
 bump version to 8.10
In-Reply-To: <CAOMZO5CQ8-rHcZyKPmmSGCo+MSSEKRcbMJMDiFHp5VQDahG+Ug@mail.gmail.com>
References: <20210105152420.26379-1-stephane.viau@oss.nxp.com>
 <20210105152420.26379-2-stephane.viau@oss.nxp.com>
 <636366db-0dd3-4a30-7097-d09423d91aa8@gmail.com>
 <CAOMZO5CQ8-rHcZyKPmmSGCo+MSSEKRcbMJMDiFHp5VQDahG+Ug@mail.gmail.com>
Message-ID: <CAOMZO5AZXr8oY1Z6K30-Bq+a3dF8RAaRmBB1S_51Fh_9UDWgdw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Tue, Jan 12, 2021 at 9:27 PM Fabio Estevam <festevam@gmail.com> wrote:

> I notice the same here on a imx53.

It works for me if I change it like this:

--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -116,9 +116,8 @@ endif
 FIRMWARE_IMX_VPU_FW_NAME = $(call
qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME))
 ifneq ($(FIRMWARE_IMX_VPU_FW_NAME),)
 define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
-       mkdir -p $(TARGET_DIR)/lib/firmware/imx/vpu
        cp $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_FW_NAME)*.bin \
-               $(TARGET_DIR)/lib/firmware/imx/vpu/
+               $(TARGET_DIR)/lib/firmware/
 endef
 endif


[    9.727308] coda 63ff4000.vpu: IRQ bit not found
[    9.848458] coda 63ff4000.vpu: Initialized CODA7541.
[    9.853967] coda 63ff4000.vpu: Firmware version: 1.4.50
[    9.937682] coda 63ff4000.vpu: encoder registered as video5
[    9.962135] coda 63ff4000.vpu: decoder registered as video6
[    9.985276] coda 63ff4000.vpu: encoder registered as video7
[   10.018420] coda 63ff4000.vpu: decoder registered as video8

Would the change above be acceptable? If so, I can submit it.

Thanks

From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Jan 2021 19:28:46 -0300
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: install
 the VPU firmware into a valid location
In-Reply-To: <2b2ee27f-f5c4-f8eb-61ff-b64d3ed0d623@gmail.com>
References: <20210113120822.327-1-festevam@gmail.com>
 <0a7f5a1d-e930-084a-3372-3ecc736a810a@smile.fr>
 <CAOMZO5BTpG8f=weBKxE9fXtEf3PjGnvs7c979sNBNyKm576ixQ@mail.gmail.com>
 <aeea51ae-483e-1cfc-0c5d-222aaf2d5400@gmail.com>
 <CAOMZO5Bs5ieYti4i5L0TCEz6uV7Zt8UkXbh=_S7mC99MLKio-A@mail.gmail.com>
 <2b2ee27f-f5c4-f8eb-61ff-b64d3ed0d623@gmail.com>
Message-ID: <CAOMZO5C=S541vwNOX49V1JNVrt6f6jq-ktibYx-RRrUVSTVSrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 13, 2021 at 6:01 PM Romain Naour <romain.naour@gmail.com> wrote:

> Something like this ?
>
> define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
>         mkdir -p $(TARGET_DIR)/lib/firmware/vpu
>         for i in $$(find $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_FW_NAME)*.bin); do \
>                 cp $$i $(TARGET_DIR)/lib/firmware/vpu/ ; \
>                 ln -sf vpu/$$(basename $$i) $(TARGET_DIR)/lib/firmware/$$(basename $$i) ; \
>         done
> endef

This works for me. I will send a v2 with your suggestion.

Thanks!

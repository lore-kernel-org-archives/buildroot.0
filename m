From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Nov 2012 07:54:28 +0100
Subject: [Buildroot] [PATCH v3 2/6] ux500-firmware: new package
In-Reply-To: <1352967920-3164-3-git-send-email-gregory.hermant@calao-systems.com>
References: <1352967920-3164-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352967920-3164-3-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <50AC7AA4.6060806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/11/12 09:25, Gregory Hermant wrote:
>
> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Minor detail below.

[snip]

> +define UX500_FIRMWARE_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +# The CG2900 linux driver has to load firmware named CG29XX_* but the firmware
> +# filenames contained in this package are CG2900_* hence the code below

  Comments inside the _CMDS macros don't work well: they are interpreted by
the shell.  It's better to put them before the macro definition.


  Regards,
  Arnout

> +	for f in $(TARGET_DIR)/lib/firmware/CG2900* ; do \
> +		mv $$f $${f/CG2900/CG29XX}; \
> +	done
> +endef
> +
> +$(eval $(generic-package))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

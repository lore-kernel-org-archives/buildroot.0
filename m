From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Sep 2012 23:56:32 +0200
Subject: [Buildroot] [PATCH 4/4] wpa-supplicant: rework .config file
	editing
In-Reply-To: <1348577725-12647-5-git-send-email-s.neumann@raumfeld.com>
References: <1348577725-12647-1-git-send-email-s.neumann@raumfeld.com>
 <1348577725-12647-5-git-send-email-s.neumann@raumfeld.com>
Message-ID: <50622890.2000107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/25/12 14:55, Sven Neumann wrote:
> Further simplify the edits on the .config file based on a nice idea
> brought up by Arnout Vandecappelle on the mailing-list.
>
> Signed-off-by: Sven Neumann<s.neumann@raumfeld.com>

  Having it as separate patches doesn't make review easier...

> ---
>   package/wpa_supplicant/wpa_supplicant.mk |  117 +--
>   raumfeld/br2-remotecontrol-arm.config    | 1284 ++++++++++++++++++++++++++++++

  Seems to be a mistake here :-)

[snip]
> +        cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
> +        sed -i $(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
> +               $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
> +               $(patsubst %,-e '1i%=y',$(WPA_SUPPLICANT_CONFIG_SET)) \
> +	       $(patsubst %,-e %,$(WPA_SUPPLICANT_CONFIG_EDITS)) \
> +               $(WPA_SUPPLICANT_CONFIG)

  Yet more whitespace problems :-)  Commands should start with a tab,
continuation lines with a tab and then spaces (if you want to align)
or another tab (if you just want to indent).

>   endef
>
>   define WPA_SUPPLICANT_BUILD_CMDS


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

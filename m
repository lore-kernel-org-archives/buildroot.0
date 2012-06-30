From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Jun 2012 21:38:30 +0200
Subject: [Buildroot] [PATCH] New package: dtach
In-Reply-To: <1339007052-13670-1-git-send-email-jmaggard10@gmail.com>
References: <1339007052-13670-1-git-send-email-jmaggard10@gmail.com>
Message-ID: <4FEF55B6.6040001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/06/12 20:24, Justin Maggard wrote:
> From: Justin Maggard<jmaggard@netgear.com>
>
> Also included is a scrollback patch from Justin Bogner.
>
> Signed-off-by: Justin Maggard<jmaggard@netgear.com>

  We avoid feature patches in buildroot: patches should be limited to those that
fix cross-compilation issues.

[snip]

> +define DTACH_INSTALL_TARGET_CMDS
> +        $(INSTALL) -D $(@D)/dtach -m 0755 \
> +                $(TARGET_DIR)/usr/bin/dtach
> +endef

  If the default install commands don't work, please include a comment why not.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

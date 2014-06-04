From: =?utf-8?B?IkrDqXLDtG1lIFBvdWlsbGVyIg==?= <jezz@sysmic.org>
Date: Wed, 4 Jun 2014 16:00:46 +0200
Subject: [Buildroot] [PATCH] packages: replace command install by
 $(INSTALL)
In-Reply-To: <1401626281-29034-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1401626281-29034-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <9904698c937856394f641361bee0ffed.squirrel@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maxime,

On Sunday 01 June 2014 14:38:01 Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[...]
> diff --git a/package/alsa-utils/alsa-utils.mk
> b/package/alsa-utils/alsa-utils.mk index 48b4bfd..2083c97 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -41,7 +41,7 @@ LSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST)
> += usr/bin/speaker-tes define ALSA_UTILS_INSTALL_TARGET_CMDS
>       mkdir -p $(TARGET_DIR)/var/lib/alsa
>       for i in $(ALSA_UTILS_TARGETS_y); do \
> -             install -D -m 755 $(STAGING_DIR)/$$i $(TARGET_DIR)/$$i; \
> +             $(INSTALL) -D -m 755 $(STAGING_DIR)/$$i $(TARGET_DIR)/$$i; \
>       done
>       if [ -x "$(TARGET_DIR)/usr/bin/speaker-test" ]; then \
>               mkdir -p $(TARGET_DIR)/usr/share/alsa/speaker-test; \
[...]

Just out of curiosity, why '$(INSTALL)' is preferred over 'install'? And
what about '$(RM)' versus 'rm'?

-- 
J?r?me Pouiller

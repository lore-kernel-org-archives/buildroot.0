From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:10:57 +0100
Subject: [Buildroot] [PATCHv3 38/74] alsa-utils: add error handling to
 for loop
In-Reply-To: <1417357142-14307-39-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-39-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130171057.GR4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/alsa-utils/alsa-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> index 17895c3..a599af8 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -46,7 +46,7 @@ ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST) += usr/bin/speaker-tes
>  define ALSA_UTILS_INSTALL_TARGET_CMDS
>  	mkdir -p $(TARGET_DIR)/var/lib/alsa
>  	for i in $(ALSA_UTILS_TARGETS_y); do \
> -		$(INSTALL) -D -m 755 $(STAGING_DIR)/$$i $(TARGET_DIR)/$$i; \
> +		$(INSTALL) -D -m 755 $(STAGING_DIR)/$$i $(TARGET_DIR)/$$i || exit 1; \
>  	done
>  	if [ -x "$(TARGET_DIR)/usr/bin/speaker-test" ]; then \
>  		mkdir -p $(TARGET_DIR)/usr/share/alsa/speaker-test; \
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

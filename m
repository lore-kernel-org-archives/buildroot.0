From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 11 Jul 2015 00:01:58 +0200
Subject: [Buildroot] [PATCH v7 16/22] rsyslog: fix config file comment
	style
In-Reply-To: <1433251718-3167-17-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-17-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <CAHXCMMLHopnN3GKo4i=c2PqnCh9Z9NPe0gj8-pu4w9Jn4dZpuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Clayton,

On Tue, Jun 2, 2015 at 3:28 PM, Clayton Shotwell
<clayton.shotwell@rockwellcollins.com> wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
> ---
> Changes v6 -> v7:
>   - No changes
>
> Changes v5 -> v6:
>   - No changes
> ---
>  package/rsyslog/rsyslog.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index 261f59d..00c313a 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -73,6 +73,10 @@ endef
>  define RSYSLOG_INSTALL_CONF
>         $(INSTALL) -m 0644 -D $(@D)/platform/redhat/rsyslog.conf \
>                 $(TARGET_DIR)/etc/rsyslog.conf
> +       # Fix invalid config file comment style
> +       $(SED) 's~\/\* ~#  ~g' $(TARGET_DIR)/etc/rsyslog.conf
> +       $(SED) 's~ \*\/~# ~g' $(TARGET_DIR)/etc/rsyslog.conf
> +       $(SED) 's~ \*~# ~g' $(TARGET_DIR)/etc/rsyslog.conf
Hum... this sed command are not really nice, I would prefer carrying
the upstream patch fixing this [1].

>         mkdir -p $(TARGET_DIR)/etc/rsyslog.d
>  endef
>
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

[1] https://github.com/rsyslog/rsyslog/commit/fe01c9ec4979c78b6a7caf045cab17ba52d4ad08

Regards,

-- 
Samuel

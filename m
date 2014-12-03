From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 3 Dec 2014 09:03:51 -0600
Subject: [Buildroot] [PATCH 1/2] rp-pppoe: install default conf file
In-Reply-To: <1417562463-26561-1-git-send-email-bluemrp9@gmail.com>
References: <1417562463-26561-1-git-send-email-bluemrp9@gmail.com>
Message-ID: <CANQCQpZrTOqGw4r0jU7T45fCwwJ7-pV36Sm9nXT5eDtNpczZ9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan,

On Tue, Dec 2, 2014 at 5:21 PM, Ryan Coe <bluemrp9@gmail.com> wrote:
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/rp-pppoe/rp-pppoe.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
> index 4e17f2d..70b4437 100644
> --- a/package/rp-pppoe/rp-pppoe.mk
> +++ b/package/rp-pppoe/rp-pppoe.mk
> @@ -18,6 +18,8 @@ RP_PPPOE_CONF_ENV = \
>         PPPD_H=$(PPPD_DIR)/pppd/pppd.h
>
>  define RP_PPPOE_INSTALL_TARGET_CMDS
> +       $(INSTALL) -D -m 0644 $(@D)/configs/pppoe.conf \
> +               $(TARGET_DIR)/etc/ppp/pppoe.conf

Acked-by: Matt Weber <matthew.weber@rockwellcollins.com>

>         for ff in $(RP_PPPOE_TARGET_FILES); do \
>                 $(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
>         done
> --
> 2.2.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.

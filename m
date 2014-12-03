From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 3 Dec 2014 09:05:32 -0600
Subject: [Buildroot] [PATCH 2/2] rp-pppoe: install helper scripts
In-Reply-To: <1417562463-26561-2-git-send-email-bluemrp9@gmail.com>
References: <1417562463-26561-1-git-send-email-bluemrp9@gmail.com>
 <1417562463-26561-2-git-send-email-bluemrp9@gmail.com>
Message-ID: <CANQCQpYsKCB+RCZ8+yER+mubsXeNxpY=jqaOmj6Q1pCo=iuDVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan,

On Tue, Dec 2, 2014 at 5:21 PM, Ryan Coe <bluemrp9@gmail.com> wrote:
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/rp-pppoe/rp-pppoe.mk | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
> index 70b4437..9c3e3e4 100644
> --- a/package/rp-pppoe/rp-pppoe.mk
> +++ b/package/rp-pppoe/rp-pppoe.mk
> @@ -11,6 +11,8 @@ RP_PPPOE_LICENSE_FILES = doc/LICENSE
>  RP_PPPOE_DEPENDENCIES = pppd
>  RP_PPPOE_SUBDIR = src
>  RP_PPPOE_TARGET_FILES = pppoe pppoe-server pppoe-relay pppoe-sniff
> +RP_PPPOE_TARGET_SCRIPTS = pppoe-connect pppoe-init pppoe-setup pppoe-start \
> +       pppoe-stop
>  RP_PPPOE_MAKE_OPTS = PLUGIN_DIR=/usr/lib/pppd/$(PPPD_VERSION)
>  RP_PPPOE_CONF_OPTS = --disable-debugging
>  RP_PPPOE_CONF_ENV = \
> @@ -23,6 +25,9 @@ define RP_PPPOE_INSTALL_TARGET_CMDS
>         for ff in $(RP_PPPOE_TARGET_FILES); do \
>                 $(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
>         done
> +       for ff in $(RP_PPPOE_TARGET_SCRIPTS); do \
> +               $(INSTALL) -m 0755 $(@D)/scripts/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
> +       done

Acked-by: Matt Weber <matthew.weber@rockwellcollins.com>

Thanks for submitting this, I was about to work on a similar patch set!

>  endef
>
>  $(eval $(autotools-package))
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

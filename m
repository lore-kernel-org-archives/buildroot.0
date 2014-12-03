From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Dec 2014 23:26:25 +0100
Subject: [Buildroot] [PATCH 2/2] rp-pppoe: install helper scripts
In-Reply-To: <1417562463-26561-2-git-send-email-bluemrp9@gmail.com>
References: <1417562463-26561-1-git-send-email-bluemrp9@gmail.com>
 <1417562463-26561-2-git-send-email-bluemrp9@gmail.com>
Message-ID: <20141203232625.0ce7b9a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Coe,

On Tue,  2 Dec 2014 15:21:03 -0800, Ryan Coe wrote:
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
> +	pppoe-stop

Any reason why we need a new variable instead of adding new values to
RP_PPPOE_TARGET_FILES ?

> @@ -23,6 +25,9 @@ define RP_PPPOE_INSTALL_TARGET_CMDS
>  	for ff in $(RP_PPPOE_TARGET_FILES); do \
>  		$(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
>  	done
> +	for ff in $(RP_PPPOE_TARGET_SCRIPTS); do \
> +		$(INSTALL) -m 0755 $(@D)/scripts/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
> +	done

Both variables do the same thing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

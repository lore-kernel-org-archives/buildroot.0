From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 10:50:22 +0100
Subject: [Buildroot] Iputils not setting suid root?
In-Reply-To: <CABhNV21G9hPsHpATOeXUnyPuCpT71XGhVsgXW_Uniq88WUuqSQ@mail.gmail.com>
References: <CABhNV21G9hPsHpATOeXUnyPuCpT71XGhVsgXW_Uniq88WUuqSQ@mail.gmail.com>
Message-ID: <20180112105022.6ef14d5c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jan 2018 10:29:35 +0100, Einar J?n wrote:

> I just changed my setup from using busybox to using iputils.
> Now I can't ping/traceroute6 anymore unless I use sudo. Is that normal?
> In my ubuntu the suid bit is set, so I just copied that behaviour, and
> that works.
> 
> I added the patch below to package/iputils/iputils.mk to set the permissions.
> Is there any reason why it's not done?
> 
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index b20cd12..13e3389 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -69,4 +69,9 @@ define IPUTILS_INSTALL_TARGET_CMDS
>         $(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
>  endef
> 
> +define IPUTILS_PERMISSIONS
> +       /bin/ping        f 4755 0 0 - - - - -
> +       /bin/traceroute6 f 4755 0 0 - - - - -
> +endef
> +
>  $(eval $(generic-package))

That's a bug. Could you submit a proper patch that fixes this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

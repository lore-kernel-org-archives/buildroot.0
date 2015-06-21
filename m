From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2015 13:50:56 +0200
Subject: [Buildroot] [PATCH] openvmtools: fix legal info
In-Reply-To: <1434885903-22713-1-git-send-email-gustavo@zacarias.com.ar>
References: <1434885903-22713-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150621115056.GB3625@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-06-21 08:25 -0300, Gustavo Zacarias spake thusly:
> In ab71dff0 it was moved to SUBDIR, but this was never reflected for the
> legal-info files, update this to fix:
> http://autobuild.buildroot.net/results/836/8363943cc9c967713f585209408ea087a052a12d/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openvmtools/openvmtools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
> index 9819640..e22153b 100644
> --- a/package/openvmtools/openvmtools.mk
> +++ b/package/openvmtools/openvmtools.mk
> @@ -7,7 +7,7 @@
>  OPENVMTOOLS_VERSION = stable-9.10.0
>  OPENVMTOOLS_SITE = $(call github,vmware,open-vm-tools,$(OPENVMTOOLS_VERSION))
>  OPENVMTOOLS_LICENSE = LGPLv2.1
> -OPENVMTOOLS_LICENSE_FILES = COPYING
> +OPENVMTOOLS_LICENSE_FILES = $(OPENVMTOOLS_SUBDIR)/COPYING

I know this has no impact in Makefiles, but I prefer when we define
variables before we use them, it's easier to understand. So, I'd prefer
we define OPENVMTOOLS_SUBDIR before we use it.

Otherwise:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  # Autoreconf needed or config/missing will run configure again at buildtime
>  OPENVMTOOLS_AUTORECONF = YES
>  OPENVMTOOLS_SUBDIR = open-vm-tools
> -- 
> 2.3.6
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

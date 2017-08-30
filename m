From: =?utf-8?Q?Alexandre=20Maumen=C3=A9?= <alexandre@maumene.org>
Date: Wed, 30 Aug 2017 14:29:24 +0800
Subject: [Buildroot] Error while build Xorg with nvidia-driver
In-Reply-To: <1504074056.2980358.1089439320.4C40BE81@webmail.messagingengine.com>
References: <1504074056.2980358.1089439320.4C40BE81@webmail.messagingengine.com>
Message-ID: <1504074564.2982046.1089445256.02D2BA69@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

According to this https://elrepo.org/tiki/kmod-nvidia (scroll to the
bottom of the page), glamor is conflicting with nvidia-driver.
It seems to build fine with:
ifeq
($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_NVIDIA_DRIVER),yyn)
instead of 
ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yy)

Regards,

On Wed, Aug 30, 2017, at 02:20 PM, Alexandre Maumen? wrote:
> Hi,
> 
> I'm trying to build Xorg (with nvidia-driver) and I have this error:
> [...]
> checking for GLAMOR... yes
> checking for GBM... no
> configure: error: Glamor for Xorg requires gbm >= 10.2.0
> 
> I'm not sure to understand if I the Nvidia proprietary drivers support
> gbm or not and if I actually need to build Xorg with glamor. I have
> found much examples on internet on how to build buildroot with Nvidia
> drivers. (but nouveau isn't really good for what I'm trying to build).
> 
> Any help would be appreciate !
> 
> Regards,
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

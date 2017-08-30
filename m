From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 10:30:27 +0200
Subject: [Buildroot] Error while build Xorg with nvidia-driver
In-Reply-To: <1504074564.2982046.1089445256.02D2BA69@webmail.messagingengine.com>
References: <1504074056.2980358.1089439320.4C40BE81@webmail.messagingengine.com>
 <1504074564.2982046.1089445256.02D2BA69@webmail.messagingengine.com>
Message-ID: <20170830103027.62676556@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Aug 2017 14:29:24 +0800, Alexandre Maumen? wrote:

> It seems to build fine with:
> ifeq
> ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_NVIDIA_DRIVER),yyn)

BR2_PACKAGE_NVIDIA_DRIVER will never be 'n', so it means the condition
will never be true.

What's written at https://elrepo.org/tiki/kmod-nvidia is that there is
a runtime issue, not a build time issue, so it's a bit surprising.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

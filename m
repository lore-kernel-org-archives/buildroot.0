From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Wed, 01 Oct 2014 09:55:24 -0700
Subject: [Buildroot] [PATCH v2 3/3] imx-usb-loader: new package
In-Reply-To: <20141001181626.64e6ef08@free-electrons.com>
References: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
 <1412175826-9010-4-git-send-email-luca@lucaceresoli.net>
 <20141001181626.64e6ef08@free-electrons.com>
Message-ID: <542C31FC.9050709@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 10/01/2014 09:16 AM, Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
> 
> On Wed,  1 Oct 2014 17:03:46 +0200, Luca Ceresoli wrote:
> 
> <snip>
>
>> +IMX_USB_LOADER_LICENSE_FILES = COPYING
>> +IMX_USB_LOADER_DEPENDENCIES = host-libusb
>> +
>> +define HOST_IMX_USB_LOADER_BUILD_CMDS
>> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
>> +endef
>> +
>> +define HOST_IMX_USB_LOADER_INSTALL_CMDS
>> +    $(INSTALL) -D -m 0755 $(@D)/imx_usb $(HOST_DIR)/usr/bin
>> +    $(INSTALL) -D -m 0755 $(@D)/imx_uart $(HOST_DIR)/usr/bin
> 
> Full path as the last argument.
> 
> Also: what about having this package enabled by default in the sabresd
> defconfigs, if it makes sense to have this host tool enabled for those
> configurations?
> 

Or all i.MX devices. This is known to work with i.MX5x and i.MX6x
boards, and I think I saw some comments from Vybrid users.

That said, it's a bit of an arcane tool that's useful when doing
U-Boot development or unbricking a board.

Regards,


Eric

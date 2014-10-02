From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 02 Oct 2014 11:17:15 +0200
Subject: [Buildroot] [PATCH v2 3/3] imx-usb-loader: new package
In-Reply-To: <542D1130.1050508@lucaceresoli.net>
References: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
 <1412175826-9010-4-git-send-email-luca@lucaceresoli.net>
 <20141001181626.64e6ef08@free-electrons.com>
 <542D1130.1050508@lucaceresoli.net>
Message-ID: <542D181B.3090505@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Luca Ceresoli wrote:
> Dear Thomas,
>
> Thomas Petazzoni wrote:
>> Dear Luca Ceresoli,
>>
>> On Wed,  1 Oct 2014 17:03:46 +0200, Luca Ceresoli wrote:
...
>>> --- /dev/null
>>> +++ b/package/imx-usb-loader/imx-usb-loader.mk
>>> @@ -0,0 +1,22 @@
>>> +################################################################################
>>>
>>> +#
>>> +# imx-uxb-loader
>>> +#
>>> +################################################################################
>>>
>>> +
>>> +IMX_USB_LOADER_VERSION = f96aee286ea17c832b7ec922dd76842deb5ce299
>>> +IMX_USB_LOADER_SITE = $(call
>>> github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
>>> +IMX_USB_LOADER_LICENSE = LGPLv2.1+, LGPL (getopt.*)
>>
>> LGPL with no version specified?
>>
>
> Yes. The only indication in getopt.[hc] is:
>
>    License: LGPL
>
> and nothing else. This means LGPL (ant version), it is the list of
> licenses documented on the BR manual.
>
> BTW, the LGPL license is declared in BR for pppd and tslib as well.

Looking at it a bit closer, getopt.* is not used to build on Linux,
only for Windows.

So I guess I could drop the LGPL part:

   IMX_USB_LOADER_LICENSE = LGPLv2.1+

-- 
Luca

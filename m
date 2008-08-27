From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 27 Aug 2008 23:00:10 +0200
Subject: [Buildroot] Adding new processors and boards to buildroot
References: <1CD05B980C94AC408B37C82BBABAA3E60D766F2A@mtsexchange.dc.multitech.prv>
Message-ID: <99D38741512D4DC7A26AFDE2909CD516@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> For some reason make 3.81 causes errors trying to compile uboot 1.3.3
> which is why they have not moved uboot from 1.2 to 1.3 in buildroot, as
> I understand it. We saw the same problem, but using make 3.80 instead of
> make 3.81, we were bale to compile uboot 1.3.3 without errors.
>
> Timothy Barr
> Hardware Development Engineer
> for Multi-Tech Systems, Inc.
> tbarr at multitech.com

No the reason for not moving on from 1.2.0 for the AT91 is that
it is very difficult to get patches accepted upstream.

As an example, The AT91RM9200EK is not supported in mainstream.
It is fairly similar to the AT91RM9200DK, but submitting
a board support package for the board is a real pain.

One would think that taking the existing DK board code and
modify the few lines needed to have proper support for the EK
would be OK.

No, the working parallel flash driver is not acceptable, instead the
CFI driver should be used, even though this does not support
properly the flash on that board, and the complete dataflash
support needs to be rewritten because someone did not like
that you can use dataflash with the same ease as a parallel flash.

The U-Boot-1.2.0 for the AT91 takes the Atmel patches
needed to support all AT91 boards, and adds a few nifty features of my own.

When I have more time, I will update the patches to the latest status
and hopefully merger with the vanilla u-boot which also exists in u-boot.


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

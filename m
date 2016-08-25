From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 23:47:15 +0200
Subject: [Buildroot] [PATCH v1 4/9] board / intel: Add SPI peripherals
 for Minnowboard MAX
In-Reply-To: <1472133887-34746-5-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1472133887-34746-5-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <20160825234715.1e500fc5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 17:04:42 +0300, Andy Shevchenko wrote:
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Add two SPI peripherals which can be connected to Minnowboard MAX low speed
> connector. First is Atmel AT25 compatible SPI EEPROM and second is M25P80
> compatible SPI serial flash.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  board/intel/minnowboard-max/acpi/at25.asl   | 58 +++++++++++++++++++++++++++++
>  board/intel/minnowboard-max/acpi/m25p80.asl | 52 ++++++++++++++++++++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 board/intel/minnowboard-max/acpi/at25.asl
>  create mode 100644 board/intel/minnowboard-max/acpi/m25p80.asl

Is there some upstream project for those ACPI tables? I wouldn't want
to have them all in Buildroot, I'd very much prefer to have a Buildroot
package download them, compile them using the acpica compiler, and
install them in the proper place.

It's fine to have them in Buildroot as a temporary solution, as long as
some upstream is being put in place. But if the long term idea is to
keep those ACPI tables source code in Buildroot, then I don't think
it's what we want to do.

This of course applies to patches 4/9 to 9/9.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

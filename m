From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 30 Apr 2015 09:33:50 -0500
Subject: [Buildroot] [PATCH 0/8] configs: defconfigs for Atmel boards
In-Reply-To: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <CAMQcK5JsC7TpJ5pdWmF-6m8zUa0_gXKYUBWQwWEA0-tx2uONQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre,

On Thu, Apr 30, 2015 at 7:51 AM, Alexandre Belloni
<alexandre.belloni@free-electrons.com> wrote:
> Hi,
>
> This series updates and adds defconfigs for the recent(ish) atmel boards. They
> use Atmel's u-boot and kernel tree and are meant to be flashed on the NAND
> flash.
>
> Alexandre Belloni (8):
>   configs: update at91sam9g45m10ek defconfig
>   configs: add defconfig for Atmel at91sam9rlek
>   configs: add defconfig for Atmel at91sam9x5ek
>   configs: add defconfig for Atmel sama5d3xek
>   configs: add defconfig for Atmel sama5d4ek
>   configs: add defconfig for Atmel sama4d4 Xplained Ultra
>   configs: add defconfig for Atmel sama5d3 Xplained
>   configs: rename atmel_xplained_defconfig
>
>  configs/at91sam9g45m10ek_defconfig                 | 19 +++++++++++++-----
>  configs/at91sam9rlek_defconfig                     | 18 +++++++++++++++++
>  configs/at91sam9x5ek_defconfig                     | 18 +++++++++++++++++
>  configs/atmel_sama5d3_xplained_defconfig           | 22 +++++++++++++++++++++
>  ...config => atmel_sama5d3_xplained_mmc_defconfig} |  0
>  configs/atmel_sama5d3xek_defconfig                 | 22 +++++++++++++++++++++
>  configs/atmel_sama5d4_xplained_defconfig           | 23 ++++++++++++++++++++++
>  configs/atmel_sama5d4ek_defconfig                  | 23 ++++++++++++++++++++++
>  8 files changed, 140 insertions(+), 5 deletions(-)
>  create mode 100644 configs/at91sam9rlek_defconfig
>  create mode 100644 configs/at91sam9x5ek_defconfig
>  create mode 100644 configs/atmel_sama5d3_xplained_defconfig
>  rename configs/{atmel_xplained_defconfig => atmel_sama5d3_xplained_mmc_defconfig} (100%)
>  create mode 100644 configs/atmel_sama5d3xek_defconfig
>  create mode 100644 configs/atmel_sama5d4_xplained_defconfig
>  create mode 100644 configs/atmel_sama5d4ek_defconfig

Since you are moving all of the Atmel boards to use NAND boot
configuration, it would be good to have a 'README' that explains how
to load the boards utilizing the SAM-BA tool (it appears all the NAND
configurations are using this). At minimum it would be to point to
Linux4SAM wiki for loading instructions.

Thoughts?

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com

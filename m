From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 16:33:45 +0200
Subject: [Buildroot] [PATCHv2] sgp30: New kernel module package
In-Reply-To: <20190803080911.26062-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 3 Aug 2019 10:09:11 +0200")
References: <20190803080911.26062-1-yann.morin.1998@free.fr>
Message-ID: <87tvayb9o6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: David De Grave <david@ledav.net>
 > Kernel module for the Sensirion sgp30 / sgpc2 chemical sensors.

 > Signed-off-by: David De Grave <david@ledav.net>
 > [yann.morin.1998 at free.fr:
 >   - fix coding style after check-package
 >   - enable required linux options
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > ---
 > Changes v1 -> v2 (Yann):
 >   - fix coding style with check-package
 >   - enable the required linux options
 > ---
 >  linux/linux.mk           |  3 +++
 >  package/Config.in        |  1 +
 >  package/sgp30/Config.in  | 13 +++++++++++++
 >  package/sgp30/sgp30.hash |  1 +
 >  package/sgp30/sgp30.mk   | 18 ++++++++++++++++++

A DEVELOPERS entry is missing.

I see the kernel now has a sgp30 driver since 5.1, is there any reason
to use this over the mainline driver?

Author: Andreas Brauchli <a.brauchli@elementarea.net>
Date:   Thu Dec 13 15:43:23 2018 +0100

    iio: chemical: sgp30: Support Sensirion SGP30/SGPC3 sensors

    Support Sensirion SGP30 and SGPC3 multi-pixel I2C gas sensors

    Supported Features:

    * Indoor Air Quality (IAQ) concentrations for
      - tVOC (in_concentration_voc_input)
      - CO2eq (in_concentration_co2_input) - SGP30 only

      IAQ concentrations are periodically read out by a background thread
      to allow the sensor to maintain its internal baseline.

    * Gas concentration signals
      - Ethanol (in_concentration_ethanol_raw)
      - H2 (in_concentration_h2_raw) - SGP30 only

    https://www.sensirion.com/file/datasheet_sgp30
    https://www.sensirion.com/file/datasheet_sgpc3

    Signed-off-by: Andreas Brauchli <andreas.brauchli@sensirion.com>
    Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
Bye, Peter Korsgaard

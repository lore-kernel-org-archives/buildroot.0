From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue, 30 Mar 2021 21:58:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: bump version to
 1.16.2
In-Reply-To: <20210330195156.GA24043@scaer>
References: <20210329184934.14690-1-petr.vorel@gmail.com>
 <20210330195156.GA24043@scaer>
Message-ID: <CAAP7ucJbn39MmCDtJkTj57cnv8F9QzG=M9SyNcnkWtZ_Ch0uSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

> On 2021-03-29 20:49 +0200, Petr Vorel spake thusly:
> > It requires libqmi >= 1.28.0
> >
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>
> Applied to master, thanks.
>
> > ---
> > Hi,
> >
> > RFC: should I add also --enable-plugin-qcom-soc ?
> > (there is qcom-db410c-firmware package)
>
> Maybe you could enable the plugin if the package is enabled:
>
>     ifeq ($(BR2_PACKAGE_QCOM_DB410_FIRMWARE),y)
>     MODEM_MANAGER_CONF_OPTS += --enable-plugin-qcom-soc
>     else
>     MODEM_MANAGER_CONF_OPTS += --disable-plugin-qcom-soc
>     endif
>

From a quick Google search, looks like there is no WWAN modem there:
"The DragonBoard 410c based on Qualcomm Snapdragon 410 processor is a
64-bit development board with Wi-Fi, Bluetooth, and GPS."

The qcom-soc plugin has been tested successfully on MSM8916 or MSM8974
SoCs, and there is some ongoing work to make it work on SDM845 and
similar platforms.

-- 
Aleksander
https://aleksander.es

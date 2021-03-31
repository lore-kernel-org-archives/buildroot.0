From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 31 Mar 2021 20:24:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: bump version to
 1.16.2
In-Reply-To: <CAAP7ucJbn39MmCDtJkTj57cnv8F9QzG=M9SyNcnkWtZ_Ch0uSg@mail.gmail.com>
References: <20210329184934.14690-1-petr.vorel@gmail.com>
 <20210330195156.GA24043@scaer>
 <CAAP7ucJbn39MmCDtJkTj57cnv8F9QzG=M9SyNcnkWtZ_Ch0uSg@mail.gmail.com>
Message-ID: <YGS+cAr0P67MDjFa@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aleksander,

> > > RFC: should I add also --enable-plugin-qcom-soc ?
> > > (there is qcom-db410c-firmware package)

> > Maybe you could enable the plugin if the package is enabled:

> >     ifeq ($(BR2_PACKAGE_QCOM_DB410_FIRMWARE),y)
> >     MODEM_MANAGER_CONF_OPTS += --enable-plugin-qcom-soc
> >     else
> >     MODEM_MANAGER_CONF_OPTS += --disable-plugin-qcom-soc
> >     endif


> From a quick Google search, looks like there is no WWAN modem there:
> "The DragonBoard 410c based on Qualcomm Snapdragon 410 processor is a
> 64-bit development board with Wi-Fi, Bluetooth, and GPS."

> The qcom-soc plugin has been tested successfully on MSM8916 or MSM8974
> SoCs, and there is some ongoing work to make it work on SDM845 and
> similar platforms.

I wonder if libqrtr-glib has other use than qcom-soc plugin.
Originally I thought there is more use and thus I add it to buildroot,
but if it's just for qcom-soc, it should be added:

ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
MODEM_MANAGER_CONF_OPTS += --enable-plugin-qcom-soc
else
MODEM_MANAGER_CONF_OPTS += --disable-plugin-qcom-soc
endif

Although it will not be useful until anybody tries to add some phone based
defconfigs into buildroot.

Kind regards,
Petr

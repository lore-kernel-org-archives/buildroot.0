From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 2 Apr 2021 07:05:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: bump version to
 1.16.2
In-Reply-To: <CAAP7ucLckJ0sBGKsPaxg9an=sENcq6vBo8MQFuFEtzaue9Ut8A@mail.gmail.com>
References: <20210329184934.14690-1-petr.vorel@gmail.com>
 <20210330195156.GA24043@scaer>
 <CAAP7ucJbn39MmCDtJkTj57cnv8F9QzG=M9SyNcnkWtZ_Ch0uSg@mail.gmail.com>
 <YGS+cAr0P67MDjFa@pevik>
 <CAAP7ucLckJ0sBGKsPaxg9an=sENcq6vBo8MQFuFEtzaue9Ut8A@mail.gmail.com>
Message-ID: <YGamC04wSaeJMgin@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Hey,

> > > > > RFC: should I add also --enable-plugin-qcom-soc ?
> > > > > (there is qcom-db410c-firmware package)

> > > > Maybe you could enable the plugin if the package is enabled:

> > > >     ifeq ($(BR2_PACKAGE_QCOM_DB410_FIRMWARE),y)
> > > >     MODEM_MANAGER_CONF_OPTS += --enable-plugin-qcom-soc
> > > >     else
> > > >     MODEM_MANAGER_CONF_OPTS += --disable-plugin-qcom-soc
> > > >     endif


> > > From a quick Google search, looks like there is no WWAN modem there:
> > > "The DragonBoard 410c based on Qualcomm Snapdragon 410 processor is a
> > > 64-bit development board with Wi-Fi, Bluetooth, and GPS."

> > > The qcom-soc plugin has been tested successfully on MSM8916 or MSM8974
> > > SoCs, and there is some ongoing work to make it work on SDM845 and
> > > similar platforms.

> > I wonder if libqrtr-glib has other use than qcom-soc plugin.
> > Originally I thought there is more use and thus I add it to buildroot,
> > but if it's just for qcom-soc, it should be added:

> > ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
> > MODEM_MANAGER_CONF_OPTS += --enable-plugin-qcom-soc
> > else
> > MODEM_MANAGER_CONF_OPTS += --disable-plugin-qcom-soc
> > endif


> So, in ModemManager, right now libqrtr-glib will indeed be exclusively
> for the qcom-soc plugin; it will be the only plugin making use of the
> QRTR nodes exposed by the kernel.

> > Although it will not be useful until anybody tries to add some phone based
> > defconfigs into buildroot.


> The QRTR protocol itself is not specific to WWAN. E.g. Qualcomm SoCs
> may expose access to control other features (e.g. thermal control) via
> this kind of nodes. That said, *right now*  it may make sense to make
> it specific to the MM usecase only.

Thanks for an explanation, I'll probably enable qcom-soc based on
BR2_PACKAGE_LIBQRTR_GLIB selection even it's not a direct use of that plugin
atm.

Kind regards,
Petr

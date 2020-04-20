From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 20 Apr 2020 11:11:45 +0200
Subject: [Buildroot] [PATCH] package/modem-manager: use libqmi and
 libmbim if they are selected
In-Reply-To: <20200419230056.7df2d309@windsurf.home>
References: <20191104124844.8112-1-unixmania@gmail.com>
 <20200419230056.7df2d309@windsurf.home>
Message-ID: <CAAP7ucJXDvXxAjDKYLxTiBhakitTv7ri4yi0b4sT8qZJg=LCaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas,

>
> However, I would suggest to take a simpler approach:
>
>  - Keep the BR2_PACKAGE_MODEM_MANAGER_LIBMBIM and
>    BR2_PACKAGE_MODEM_MANAGER_LIBQMI options.
>
>  - Change modem-manager.mk to test BR2_PACKAGE_LIBMBIM and
>    BR2_PACKAGE_QMI instead of BR2_PACKAGE_MODEM_MANAGER_LIBMBIM and
>    BR2_PACKAGE_MODEM_MANAGER_LIBQMI.
>

I'm not sure what you mean with the above paragraph. What do you mean
with e.g. "testing" BR2_PACKAGE_LIBMBIM instead of
BR2_PACKAGE_:MODEM_MANAGER_LIBMBIM?

> Also, as was pointed out during the discussion, it would be good to
> change the network-manager package to not force the modem-manager
> MBIM/QMI support when modem-manager support is enabled. I.e, remove the
> following lines:
>
>         select BR2_PACKAGE_MODEM_MANAGER_LIBMBIM
>         select BR2_PACKAGE_MODEM_MANAGER_LIBQMI
>
> from package/network-manager/Config.in
>

I agree with this change in NM, I'll send a patch for that. But is it
just removing those lines? Ideally, MBIM and QMI (and QMI over MBIM)
support should be "the default" when building MM, and the users can
disable them explicitly if not required. I'm not sure how to handle
that in buildroot, truth be told.

-- 
Aleksander
https://aleksander.es

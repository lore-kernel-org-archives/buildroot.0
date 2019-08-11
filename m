From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Aug 2019 13:24:34 +0200
Subject: [Buildroot] [PATCH v6 07/10] package/mesa3d: add a new option
 to enable GLX support
In-Reply-To: <92852gxeq6.ln2@ID-313208.user.individual.net>
References: <20190804185417.6562-1-bernd.kuhls@t-online.de>
 <20190804185417.6562-7-bernd.kuhls@t-online.de>
 <CAK4VdL2Vw4stKEJA6Tyg4mGT=uBJxt00qitwh=JZcDQo=cFYhg@mail.gmail.com>
 <3or42gxeq6.ln2@ID-313208.user.individual.net>
 <ff8c9c3b-6ddf-462c-51a8-c12270714c20@gmail.com>
 <92852gxeq6.ln2@ID-313208.user.individual.net>
Message-ID: <f0ce5c09-d773-a39d-30a0-48822398a942@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 11/08/2019 ? 12:42, Bernd Kuhls a ?crit?:
> Am Sun, 11 Aug 2019 12:02:37 +0200 schrieb Romain Naour:
> 
>> Indeed this patch trigger the issue, I think we need to replace
>> BR2_PACKAGE_XORG7 by BR2_PACKAGE_MESA3D_OPENGL_GLX before making mesa3d
>> a libgl provider:
>>
>> https://git.buildroot.net/buildroot/tree/package/mesa3d/mesa3d.mk#n174
> 
> Hi Romain,
> 
> done, sent v7 including bump to 19.1.4 and lima driver:
> http://patchwork.ozlabs.org/project/buildroot/list/?series=124414

Actually the Lima driver is not the only new driver in newer mesa3d release.
There is also panfrost driver.

Actually I already theses patches locally but since the mesa package version is
stuck due to autotools -> meson switch I didn't sent theses patches in this series.

Lima and panfrost are Gallium drivers that can be used as kmsro.

Best regards,
Romain

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

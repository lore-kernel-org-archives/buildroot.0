From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 21 Sep 2019 21:16:12 +0200
Subject: [Buildroot] [PATCH v14 0/8] package/{mesa3d,
 mesa3d-headers}: bump version to 19.1.7
In-Reply-To: <07d64d35-8eb7-2d43-d3e4-a66088884257@mind.be>
References: <20190921181053.8999-1-bernd.kuhls@t-online.de>
 <07d64d35-8eb7-2d43-d3e4-a66088884257@mind.be>
Message-ID: <b0529eb4-d4f0-30be-6b2a-f72deb725cb2@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 21/09/2019 ? 20:56, Arnout Vandecappelle a ?crit?:
> 
> 
> On 21/09/2019 20:10, Bernd Kuhls wrote:
>> Hi,
>>
>> changelog:
>>
>> v14: updated based on Arnout's review
>>      - python3-mako
>>        removed host-python-markupsafe dependency, not needed since 1.0.2
>>      - xvmc
>>        moved Config.in option to Gallium block, fixed comment dependency
>>      rebased
>> v13: bump version to 19.1.7
>>      rebased
>> v12: bump version to 19.1.6
>>      added "add support for gallium freedreno driver"
>>      rebased
>> v11: added "Gallium vdpau state tracker is only available..."
>>      rebased on branch 'master'
>> v10: bump version to 19.1.5
>>      rebased "rename OSMesa option" for branch 'next'
>> v9:  fixed x11 dependency for patch "add a new option to enable GLX
>>      support"
>>
>> Regards, Bernd
>>
>> Bernd Kuhls (5):
>>   package/mesa3d: switch build system to meson
>>   package/{mesa3d, mesa3d-headers}: bump version to 19.1.7
>>   package/mesa3d: add support for gallium lima driver
>>   package/mesa3d: add support for gallium panfrost driver
>>   package/mesa3d: add support for gallium freedreno driver
>>
>> Romain Naour (3):
>>   package/python3-mako: new package
>>   package/mesa3d: add xvmc option
>>   package/mesa3d: select kmsro for etnaviv
> 
>  Series applied to master, thanks. If my comment on patch 3 leads to a fixup,
> that can be done in a separate commit.
> 
>  Thank you Bernd and Romain for pushing this through 14 iterations!

Thank you Arnout for the final review on this series.
Thank you Bernd for the initial and final work to switch to meson.

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
>>
>>  package/mesa3d-headers/mesa3d-headers.mk      |   2 +-
>>  ...vert-order-for-wayland-scanner-check.patch |  51 -------
>>  ...d-scanner-provided-by-wayland-scanne.patch |  52 +++++++
>>  ...t-proper-value-for-LIBCLC_INCLUDEDIR.patch |  39 ++++++
>>  .../mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch   |  37 -----
>>  package/mesa3d/Config.in                      |  41 +++++-
>>  package/mesa3d/mesa3d.hash                    |  11 +-
>>  package/mesa3d/mesa3d.mk                      | 131 +++++++++---------
>>  package/python-mako/python-mako.mk            |   2 +
>>  package/python3-mako/python3-mako.hash        |   1 +
>>  package/python3-mako/python3-mako.mk          |  18 +++
>>  11 files changed, 226 insertions(+), 159 deletions(-)
>>  delete mode 100644 package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
>>  create mode 100644 package/mesa3d/0002-meson-use-wayland-scanner-provided-by-wayland-scanne.patch
>>  create mode 100644 package/mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
>>  delete mode 100644 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
>>  create mode 120000 package/python3-mako/python3-mako.hash
>>  create mode 100644 package/python3-mako/python3-mako.mk
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

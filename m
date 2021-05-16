From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 16:07:10 +0200
Subject: [Buildroot] [PATCH 0/6] Update Cage, wlroots, and wayland
In-Reply-To: <20210513163325.1775639-1-aperez@igalia.com>
References: <20210513163325.1775639-1-aperez@igalia.com>
Message-ID: <20210516140710.GI2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2021-05-13 19:33 +0300, Adrian Perez de Castro spake thusly:
> This patch set updates Cage to 0.1.3, which by itself does not have functional
> changes over the previous version, but it pulls in wlroots 0.13.0 which does
> include a good number of improvements. The latter also needs a bump to the
> wayland package, so that gets updated as well.
> 
> Last but not least, wlroots can now libseat to broker sessions, so three of
> the patches deal with adding a package for it, installing the daemon init
> scripts (if the daemon is enabled, as it is optional), and arranging for
> wlroots to use libseat when available. I reckon that these three patches
> dealing with libseat could be split in a separate patch set, but I opted
> for including them in the series for context. It looks like libseat is
> gaining momentum in the Wayland ecosystem and for example Weston can also
> use it since half a year ago [1]. At any rate, let me know if you would
> rather have the libseat patches in a separate submission, and I will be
> happy to make it happen :)

No, this is perfectly fine to have in this series. I had a few comments
about patches 2-onward, though, so I marked them changes-requested.
Patch 1 got applied to next. Thanks!

Regards,
Yann E. MORIN.

> Best regards,
> -Adrian
> 
> 
> [1] https://gitlab.freedesktop.org/wayland/weston/-/commit/6c4a993a999048a2054ec97e71d32839b312c642
> 
> Adrian Perez de Castro (6):
>   package/wayland: bump to version 1.19.0
>   package/wlroots: bump to version 0.13.0
>   package/seatd: new package
>   package/seatd: install init scripts
>   package/wlroots: use libseat when available
>   package/cage: bump to version 0.1.3
> 
>  package/Config.in                             |  1 +
>  package/cage/cage.hash                        |  2 +-
>  package/cage/cage.mk                          |  7 ++-
>  ...pport-building-builtin-without-seatd.patch | 37 ++++++++++++
>  package/seatd/Config.in                       | 48 ++++++++++++++++
>  package/seatd/S70seatd                        | 38 +++++++++++++
>  package/seatd/seatd.hash                      |  5 ++
>  package/seatd/seatd.mk                        | 52 +++++++++++++++++
>  ...01-build-add-option-to-disable-tests.patch | 25 ++++----
>  .../0002-meson-do-not-check-for-c.patch       | 29 ----------
>  ...002-meson-only-require-cpp-for-tests.patch | 57 +++++++++++++++++++
>  package/wayland/wayland.hash                  |  8 +--
>  package/wayland/wayland.mk                    |  2 +-
>  package/wlroots/wlroots.hash                  |  4 +-
>  package/wlroots/wlroots.mk                    | 12 ++--
>  15 files changed, 268 insertions(+), 59 deletions(-)
>  create mode 100644 package/seatd/0001-meson-Support-building-builtin-without-seatd.patch
>  create mode 100644 package/seatd/Config.in
>  create mode 100755 package/seatd/S70seatd
>  create mode 100644 package/seatd/seatd.hash
>  create mode 100644 package/seatd/seatd.mk
>  delete mode 100644 package/wayland/0002-meson-do-not-check-for-c.patch
>  create mode 100644 package/wayland/0002-meson-only-require-cpp-for-tests.patch
> 
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

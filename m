From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 14:29:07 +0200
Subject: [Buildroot] [PATCH v4 0/2] add gettext-tiny package
In-Reply-To: <20190327230831.31468-1-vadim4j@gmail.com>
References: <20190327230831.31468-1-vadim4j@gmail.com>
Message-ID: <20190331142907.5b459037@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Mar 2019 01:08:29 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> Vadim Kochan (2):
>   package/gettext: turn into virtual package
>   package/gettext-tiny: new package

Thanks, I've applied both patches!

A couple of notes/suggestions:

 - It would be nice if you could work with upstream gettext-tiny to
   make sure gettext-tiny provides everything we need, without the need
   to bring some files from gettext-gnu.

 - The ecryptfs-utils package can probably see its BR2_USE_WCHAR
   dependency removed. Indeed, when BR2_SYSTEM_ENABLE_NLS is disabled,
   we use gettext-tiny, and wchar is no longer needed. And
   BR2_SYSTEM_ENABLE_NLS depends on wchar.

 - I have sent a patch for utils/genrandconfig that randomly sets BR2_SYSTEM_ENABLE_NLS=y in the autobuilder configurations, in order to test this situation.

> 
>  DEVELOPERS                                         |   1 +
>  package/Config.in                                  |   2 +
>  .../0001-error_print_progname.patch                |   0
>  .../0002-Update-after-gnulib-changed.patch         |   0
>  package/gettext-gnu/Config.in                      |  24 +++++
>  .../gettext.hash => gettext-gnu/gettext-gnu.hash}  |   0
>  package/gettext-gnu/gettext-gnu.mk                 | 103 +++++++++++++++++++
>  ...-format-not-a-string-literal-error-for-gc.patch |  55 ++++++++++
>  package/gettext-tiny/Config.in                     |  18 ++++
>  package/gettext-tiny/gettext-tiny.hash             |   5 +
>  package/gettext-tiny/gettext-tiny.mk               | 114 +++++++++++++++++++++
>  package/gettext-tiny/gettext-wrapper               |  24 +++++
>  package/gettext/Config.in                          |  25 ++---
>  package/gettext/gettext.mk                         |  96 +----------------
>  14 files changed, 357 insertions(+), 110 deletions(-)
>  rename package/{gettext => gettext-gnu}/0001-error_print_progname.patch (100%)
>  rename package/{gettext => gettext-gnu}/0002-Update-after-gnulib-changed.patch (100%)
>  create mode 100644 package/gettext-gnu/Config.in
>  rename package/{gettext/gettext.hash => gettext-gnu/gettext-gnu.hash} (100%)
>  create mode 100644 package/gettext-gnu/gettext-gnu.mk
>  create mode 100644 package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
>  create mode 100644 package/gettext-tiny/Config.in
>  create mode 100644 package/gettext-tiny/gettext-tiny.hash
>  create mode 100644 package/gettext-tiny/gettext-tiny.mk
>  create mode 100644 package/gettext-tiny/gettext-wrapper
> 



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Oct 2012 22:29:50 +0200
Subject: [Buildroot] [PATCH] New package liblog4c-localtime
In-Reply-To: <1349679414-2967-1-git-send-email-fenixk19@mail.ru>
References: <1349679414-2967-1-git-send-email-fenixk19@mail.ru>
Message-ID: <5074893E.2030600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  [Alexander, your mail server refuses mail from me, so I'm sending my
comments only to the list; I already sent them last Friday, but
obviously you didn't see them.]

  [List: sorry for the double posting...]

On 04/10/12 11:08, Alexander Varnin wrote:

  Add a Signed-off-by line for yourself.  This is a short way for you to
assert that you are entitled to contribute the patch under buildroot's
GPL license.  See  http://kerneltrap.org/files/Jeremy/DCO.txt for more
details.

> ---
>   package/Config.in                                |    1 +
>   package/liblog4c-localtime/Config.in             |    9 +++++++++
>   package/liblog4c-localtime/liblog4c-localtime.mk |   11 +++++++++++
>   3 files changed, 21 insertions(+), 0 deletions(-)
>   create mode 100644 package/liblog4c-localtime/Config.in
>   create mode 100644 package/liblog4c-localtime/liblog4c-localtime.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 8a7c9c4..25752e5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -387,6 +387,7 @@ source "package/lttng-libust/Config.in"
>   source "package/orc/Config.in"
>   source "package/poco/Config.in"
>   source "package/startup-notification/Config.in"
> +source "package/liblog4c-localtime/Config.in"
>   endmenu
>
>   menu "Text and terminal handling"
> diff --git a/package/liblog4c-localtime/Config.in b/package/liblog4c-localtime/Config.in
> new file mode 100644
> index 0000000..58797be
> --- /dev/null
> +++ b/package/liblog4c-localtime/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBLOG4C
> +    bool "liblog4c-localtime"
> +    help
> +      Log4c is a library of C for flexible logging to files, syslog
> +      and other destinations.
> +      This version is with localtime patch, to make lib show times in
> +      local timezone.
> +
> +      https://github.com/rcmadruga/log4c-localtime

  Add the upstream URL as well: http://log4c.sourceforge.net/

> diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
> new file mode 100644
> index 0000000..f0599c3
> --- /dev/null
> +++ b/package/liblog4c-localtime/liblog4c-localtime.mk
> @@ -0,0 +1,11 @@
> + #############################################################
> + #
> + # liblog4c
> + #
> + #############################################################
> + LIBLOG4C_VERSION = 1.2.1
> + LIBLOG4C_SITE = git://github.com/rcmadruga/log4c-localtime.git

  There's also a tarball:
LIBLOG4C_LOCALTIME_VERSION = v1.0
LIBLOG4C_LOCALTIME_SITE    = https://github.com/rcmadruga/log4c-localtime/tarball/v$(LIBLOG4C_LOCALTIME_VERSION)

> + LIBLOG4C_INSTALL_STAGING = YES
> +
> + $(eval $(call AUTOTARGETS))
> +

  Spurious newline at the end.


  It looks like it requires expat, so you need "select BR2_PACKAGE_EXPAT"
to Config.in, and "LIBLOG4C_LOCALTIME_DEPENDENCIES = expat" in .mk.  You'll
probably also need --disable-expattest for cross-compilation.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

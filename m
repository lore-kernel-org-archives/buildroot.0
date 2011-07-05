From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jul 2011 11:03:28 +0200
Subject: [Buildroot] [PATCH] Add package fribidi
In-Reply-To: <BANLkTinpAtwa0MsVbvyR7cTrbewGt5Jc6A@mail.gmail.com> (Murat
 Demirten's message of "Mon, 13 Jun 2011 12:40:54 +0300")
References: <BANLkTinpAtwa0MsVbvyR7cTrbewGt5Jc6A@mail.gmail.com>
Message-ID: <87zkktw13z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Murat" == Murat Demirten <mdemirten@yh.com.tr> writes:

 Murat> Hi,
 Murat> I'm sending the patch for the new package fribidi.

 Murat> Fribidi is a free implementation of the Unicode BiDi algorithm for Hebrew and/
 Murat> or Arabic languages.?
 Murat> It is required mostly by the applications which have I18n support.

Thanks. Could you perhaps use git format-patch -s / git send-email in
the future to make it easier to commit?

 Murat> [master 7d6b6b6] GNU fribidi package added
 Murat> ?3 files changed, 24 insertions(+), 0 deletions(-)
 Murat> ?create mode 100644 package/fribidi/Config.in
 Murat> ?create mode 100644 package/fribidi/fribidi.mk
 Murat> ---

 Murat> ?package/Config.in ? ? ? ? ?| ? ?1 +
 Murat> ?package/fribidi/Config.in ?| ? ?6 ++++++
 Murat> ?package/fribidi/fribidi.mk | ? 17 +++++++++++++++++
 Murat> ?3 files changed, 24 insertions(+), 0 deletions(-)
 Murat> ?create mode 100644 package/fribidi/Config.in
 Murat> ?create mode 100644 package/fribidi/fribidi.mk

 Murat> diff --git a/package/Config.in b/package/Config.in
 Murat> index 10d435c..81701d8 100644
 Murat> --- a/package/Config.in
 Murat> +++ b/package/Config.in
 Murat> @@ -344,6 +344,7 @@ endmenu
 Murat> ?
 Murat> ?menu "Text and terminal handling"
 Murat> ?source "package/enchant/Config.in"
 Murat> +source "package/fribidi/Config.in"
 Murat> ?source "package/icu/Config.in"
 Murat> ?source "package/libiconv/Config.in"
 Murat> ?source "package/ncurses/Config.in"
 Murat> diff --git a/package/fribidi/Config.in b/package/fribidi/Config.in
 Murat> new file mode 100644
 Murat> index 0000000..f8f4bc1
 Murat> --- /dev/null
 Murat> +++ b/package/fribidi/Config.in
 Murat> @@ -0,0 +1,6 @@
 Murat> +config BR2_PACKAGE_FRIBIDI
 Murat> + ? ? ? bool "fribidi"

Doesn't this need wide characters or localization support in the
toolchain?

 Murat> + ? ? ? help
 Murat> + ? ? ? ? Free Implementation of the Unicode BiDi algorithm for Hebrew and/or

Please keep help text lines < 70 chars.

 Murat> Arabic languages.
 Murat> +
 Murat> + ? ? ? ? http://fribidi.org/download

Drop /download

 Murat> diff --git a/package/fribidi/fribidi.mk b/package/fribidi/fribidi.mk
 Murat> new file mode 100644
 Murat> index 0000000..532d648
 Murat> --- /dev/null
 Murat> +++ b/package/fribidi/fribidi.mk
 Murat> @@ -0,0 +1,17 @@
 Murat> +#############################################################
 Murat> +#
 Murat> +# fribidi
 Murat> +#
 Murat> +#############################################################
 Murat> +FRIBIDI_VERSION = 0.10.9
 Murat> +FRIBIDI_SOURCE = fribidi-$(FRIBIDI_VERSION).tar.gz
 Murat> +FRIBIDI_SITE = http://fribidi.org/download
 Murat> +FRIBIDI_INSTALL_STAGING = YES
 Murat> +FRIBIDI_INSTALL_TARGET = YES
 Murat> +
 Murat> +define FRIBIDI_INSTALL_TARGET_CMDS
 Murat> + ? ? ? mkdir -p $(TARGET_DIR)/usr/lib
 Murat> + ? ? ? cp -dpf $(@D)/.libs/libfribidi.so* $(TARGET_DIR)/usr/lib/
 Murat> +endef

Why do you need a custom install step?


-- 
Bye, Peter Korsgaard

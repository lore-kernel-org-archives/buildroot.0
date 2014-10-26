From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 18:15:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: alsamixer
 optionally depends on gettext
In-Reply-To: <1413729905-12035-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413729905-12035-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141026181522.4ccb8ace@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 19 Oct 2014 16:45:05 +0200, Bernd Kuhls wrote:
> To get a reproducable build add optional gettext dependency.
> 
> - Configure log without gettext
> 
> checking for GNU gettext in libc... no
> checking for iconv... yes
> checking for working iconv... guessing yes
> checking for GNU gettext in libintl... no
> checking whether to use NLS... no
> 
> - Configure log with gettext built before alsa-utils
> 
> checking for GNU gettext in libc... no
> checking for iconv... yes
> checking for working iconv... guessing yes
> checking for GNU gettext in libintl... yes
> checking whether to use NLS... yes
> checking where the gettext function comes from... external libintl
> checking how to link with libintl... -lintl
> 
> Tested using this defconfig
> 
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_PACKAGE_ALSA_UTILS=y
> BR2_PACKAGE_ALSA_UTILS_ALSACONF=y
> BR2_PACKAGE_ALSA_UTILS_AMIDI=y
> BR2_PACKAGE_ALSA_UTILS_AMIXER=y
> BR2_PACKAGE_ALSA_UTILS_APLAY=y
> BR2_PACKAGE_ALSA_UTILS_IECSET=y
> BR2_PACKAGE_ALSA_UTILS_ACONNECT=y
> BR2_PACKAGE_ALSA_UTILS_APLAYMIDI=y
> BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI=y
> BR2_PACKAGE_ALSA_UTILS_ASEQDUMP=y
> BR2_PACKAGE_ALSA_UTILS_ASEQNET=y
> BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST=y
> BR2_PACKAGE_NCURSES_WCHAR=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/alsa-utils/Config.in     |    1 +
>  package/alsa-utils/alsa-utils.mk |    6 +++++-
>  2 files changed, 6 insertions(+), 1 deletion(-)

I've applied this, but I've done some changes because I didn't agree
with your solution:

    [Thomas:
     - it's not only alsamixer, but also several other alsa-utils
       utilities, like aplay or arecord, which optionally depend on
       gettext. Therefore, the patch was changed to have the optional
       gettext dependency apply to the entire package.
     - in addition, we don't need gettext when locales are enabled:
       alsa-utils builds perfectly fine with a toolchain having locales
       enabled even without gettext. So all we really want is to have
       gettext built before alsa-utils, if gettext is enabled.]

Of course, if you disagree, do not hesitate to comment.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

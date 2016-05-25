From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 25 May 2016 21:31:28 +0200
Subject: [Buildroot] [PATCH v2 2/3] add support for odroid mali GL in
	kodi
References: <20160525174632.7086-1-daggs@gmx.com>
 <20160525174632.7086-2-daggs@gmx.com>
Message-ID: <g5bh1dxoh3.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Wed, 25 May 2016 20:46:31 +0300 schrieb Dagg:

> add GL support to the odroid c2 boards
> 
> Signed-off-by: Dagg <daggs@gmx.com>
> ---
>  package/kodi/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index ff2e75c..7b26abf 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in

the subject of the patch has nothing to do with the content ;)

> -	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
> +	default y if (BR2_arm || BR2_aarch64 || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \

Kodi 16.x-Jarvis will not compile on aarch64, this arch will be
supported with the upcoming 17.x-Krypton release:
https://github.com/xbmc/xbmc/commit/487da7934b6bbcaa3b5d8350bcb44dd48c9027f7

Regards, Bernd

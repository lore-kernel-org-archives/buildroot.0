From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:56:48 +0200
Subject: [Buildroot] [PATCH 14/69] fwup: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-15-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
 <1467498098-23731-15-git-send-email-julien.floret@6wind.com>
Message-ID: <20160703085648.01301ba4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 00:20:43 +0200, Julien Floret wrote:
> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> ---
>  package/fwup/fwup.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
> index 0a23856048b3..ae8571690d9b 100644
> --- a/package/fwup/fwup.mk
> +++ b/package/fwup/fwup.mk
> @@ -9,6 +9,7 @@ FWUP_SITE = $(call github,fhunleth,fwup,$(FWUP_VERSION))
>  FWUP_LICENSE = Apache-2.0
>  FWUP_LICENSE_FILES = LICENSE
>  FWUP_DEPENDENCIES = libconfuse libarchive libsodium
> +HOST_FWUP_DEPENDENCIES = host-libconfuse host-libarchive host-libsodium
>  FWUP_AUTORECONF = YES
>  FWUP_CONF_ENV = ac_cv_path_HELP2MAN=""

Unrelated to your patch, but I'm wondering why we pass
ac_cv_path_HELP2MAN="" for the target variant (which was needed to fix
some build failures), and not to the host variant. I'm adding Baruch in
Cc since he fixed this problem.

I've applied your patch, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

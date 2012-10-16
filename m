From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Oct 2012 20:55:19 +0200
Subject: [Buildroot] [PATCH] macchanger: new package
In-Reply-To: <1350412488-17233-1-git-send-email-spdawson@gmail.com>
References: <1350412488-17233-1-git-send-email-spdawson@gmail.com>
Message-ID: <507DAD97.6090003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/12 20:34, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>
[snip]
> diff --git a/package/macchanger/Config.in b/package/macchanger/Config.in
> new file mode 100644
> index 0000000..e26faa7
> --- /dev/null
> +++ b/package/macchanger/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_MACCHANGER
> +	bool "macchanger"
> +	help
> +	  A GNU/Linux utility for viewing/manipulating the MAC address of
> +	  network interfaces
> +
> +	  http://www.alobbs.com/macchanger

  Just for my info, what does this do that 'ip link set address xx:xx:xx:xx:xx:xx'
doesn't?

> diff --git a/package/macchanger/macchanger.mk b/package/macchanger/macchanger.mk
> new file mode 100644
> index 0000000..b1b9fff
> --- /dev/null
> +++ b/package/macchanger/macchanger.mk
> @@ -0,0 +1,11 @@
> +#############################################################
> +#
> +# macchanger
> +#
> +#############################################################
> +MACCHANGER_VERSION = 1.5.0
> +MACCHANGER_SITE = ftp://ftp.gnu.org/gnu/macchanger

MACCHANGER_SITE = $(BR2_GNU_MIRROR)/macchanger

  With this amendment:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (build-test with a WCHAR-only internal powerpc toolchain)

> +MACCHANGER_LICENSE = GPLv2
> +MACCHANGER_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

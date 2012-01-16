From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Jan 2012 18:45:50 +0100
Subject: [Buildroot] [PATCH 2/2] New package: kmod
In-Reply-To: <1326726276-8442-2-git-send-email-yegorslists@googlemail.com>
References: <1326726276-8442-1-git-send-email-yegorslists@googlemail.com>
 <1326726276-8442-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <201201161845.51186.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 16 January 2012 16:04:36 yegorslists at googlemail.com wrote:
> diff --git a/package/kmod/Config.in b/package/kmod/Config.in
> new file mode 100644
> index 0000000..f83237e
> --- /dev/null
> +++ b/package/kmod/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_KMOD
> +	bool "kmod"
> +	help
> +	  handle kernel modules
> +
> +	  http://git.profusion.mobi/cgit.cgi/kmod.git/

 It would be nice if there was a config option to disable installing
the tools, in case you want to use it as a library (which is probably
the primary intention).

 That option should set
KMOD_INSTALL_STAGING = NO
KMOD_CONF_OPT += --disable-tools


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

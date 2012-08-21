From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Aug 2012 00:25:20 +0200
Subject: [Buildroot] [PATCH] valgrind: valgrind/valgrind.h missing if
 --disable-tls enabled
In-Reply-To: <1344801370-14582-2-git-send-email-stefan.froberg@petroprogram.com>
References: <1344801370-14582-1-git-send-email-stefan.froberg@petroprogram.com>
 <1344801370-14582-2-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <50340AD0.501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/12/12 21:56, Stefan Froberg wrote:
> +ifeq ($(BR2_GCC_ENABLE_TLS),y)
> +	VALGRIND_CONF_OPT = --enable-tls
> +else
> +	VALGRIND_CONF_OPT = --disable-tls
> +endif

  This will only work for buildroot toolchains, not for crosstool-NG or external
toolchains...



  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

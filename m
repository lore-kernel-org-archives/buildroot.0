From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Sep 2012 00:04:15 +0200
Subject: [Buildroot] [PATCH 2/9] firefox: valgrind dependency needs
 --enable-tls for debug build
In-Reply-To: <1346855344-15081-3-git-send-email-stefan.froberg@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-3-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <504FB55F.60408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/05/12 16:28, Stefan Fr?berg wrote:
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)&&  ($(BR2_GCC_ENABLE_TLS),y)
> +VALGRIND_CONF_OPT = --enable-tls
> +else
>   VALGRIND_CONF_OPT = --disable-tls
> +endif

  I don't like this because it only works for internal toolchains.

  Is it possible to remove the --en/disable-tls and let configure discover it by
itself?  I tried a few configs and it seems to work correctly...  The
--disable-tls was introduced by a version bump 7 years ago, without any
comment why it is needed.  It may have caused runtime problems, but those
may have disappeared by now too.  So I'd risk removing it completely.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

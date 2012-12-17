From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Dec 2012 00:10:24 +0100
Subject: [Buildroot] [PATCH] sg3-utils new package.
In-Reply-To: <1355776546-25189-1-git-send-email-marek.belisko@open-nandra.com>
References: <1355776546-25189-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <50CFA660.4030007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 21:35, Marek Belisko wrote:
> Signed-off-by: Marek Belisko<marek.belisko@open-nandra.com>
[snip]
> diff --git a/package/sg3_utils/Config.in b/package/sg3_utils/Config.in
> new file mode 100644
> index 0000000..1d2ab2a
> --- /dev/null
> +++ b/package/sg3_utils/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_SG3_UTILS
> +	bool "sg3_utils"

  depends on BR2_LARGEFILE
  depends on BR2_TOOLCHAIN_HAS_THREADS
  (actually only sgp_dd needs threads so that could be patched out in the 
Makefile).

  Not sure about IPv6.


  Otherwise, looks good.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

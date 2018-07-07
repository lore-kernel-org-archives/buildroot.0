From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Jul 2018 23:43:52 +0200
Subject: [Buildroot] [PATCH 1/1] pigz: update to more stable download URL
In-Reply-To: <20180705081004.12623-1-thomas.de_schampheleire@nokia.com>
References: <20180705081004.12623-1-thomas.de_schampheleire@nokia.com>
Message-ID: <f59ff25f-8a09-7026-3886-4565a80c5902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-18 10:10, Thomas De Schampheleire wrote:
> From: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
> 
> The pigz website seems to only host the latest release tarball.
> Chances are that the 2.4 tarball will disappear when 2.5 comes out.
> 
> Instead, use the Github tarballs provided by the developer. Comparison
> between the 2.4 / v2.4 tarballs shows that only the .gitignore file is
> added.
> 
> Suggested-by: Alfredo Alvarez Fernandez <alfredo.alvarez_fernandez@nokia.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/pigz/pigz.hash | 4 ++--
>  package/pigz/pigz.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
> index 850e94f079..843fd4fba8 100644
> --- a/package/pigz/pigz.hash
> +++ b/package/pigz/pigz.hash
> @@ -1,3 +1,3 @@
> -# From https://zlib.net/pigz/
> -sha256  a4f816222a7b4269bd232680590b579ccc72591f1bb5adafcd7208ca77e14f73  pigz-2.4.tar.gz
> +# Locally calculated
> +sha256  e228e7d18b34c4ece8d596eb6eee97bde533c6beedbb728d07d3abe90b4b1b52  pigz-v2.4.tar.gz
>  sha256	dc8f78258cdb4478b5922f4c00eb63d3cbac06c171dc829648fd414bb0cf4493  README
> diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
> index 82f3049519..ac4f94027c 100644
> --- a/package/pigz/pigz.mk
> +++ b/package/pigz/pigz.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -PIGZ_VERSION = 2.4
> -PIGZ_SITE = http://www.zlib.net/pigz
> +PIGZ_VERSION = v2.4
> +PIGZ_SITE = $(call github,madler,pigz,$(PIGZ_VERSION))
>  PIGZ_DEPENDENCIES = zlib
>  PIGZ_LICENSE = Zlib
>  PIGZ_LICENSE_FILES = README
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 10:00:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/tar: bump version to 1.30
In-Reply-To: <20180709224218.32080-1-bernd.kuhls@t-online.de>
References: <20180709224218.32080-1-bernd.kuhls@t-online.de>
Message-ID: <5afaa00d-083c-2b0d-8375-938f854371a6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Bernd,

 Have you seen b8fa273d500b4?

    check-host-tar.sh: blacklist tar 1.30+

    Tar 1.30 changed the --numeric-owner output for filenames > 100 characters,
    leading to hash mismatches for the tar archives we create ourselves from
    git.  This is really a fix for a bug in earlier tar versions regarding
    deterministic output, so it is unlikely to be reverted in later versions.

    For more details, see:
    http://lists.busybox.net/pipermail/buildroot/2018-January/211222.html

    To work around this issue, blacklist tar 1.30+ similar to how we do it for
    pre-1.17 versions so Buildroot falls back to building host-tar.


 Marked as Rejected...


 Regards,
 Arnout

On 10-07-18 00:42, Bernd Kuhls wrote:
> Added license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tar/tar.hash | 5 +++--
>  package/tar/tar.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tar/tar.hash b/package/tar/tar.hash
> index e5634566e0..efa7bb3520 100644
> --- a/package/tar/tar.hash
> +++ b/package/tar/tar.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated after checking signature
> -sha256	402dcfd0022fd7a1f2c5611f5c61af1cd84910a760a44a688e18ddbff4e9f024	tar-1.29.tar.xz
> -sha256	9173f222464dd3676118408840da5990527062b5c7daf6487bed7c396c45bfb1	tar-1.29.cpio.gz
> +sha256 f1bf92dbb1e1ab27911a861ea8dde8208ee774866c46c0bb6ead41f4d1f4d2d3  tar-1.30.tar.xz
> +sha256 29a12eebde6bda10b74ede856a159cb6cf8739fdc4d1b48354c9e79c4f658ee3  tar-1.30.cpio.gz
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> index 6f609d7a02..227475dd3f 100644
> --- a/package/tar/tar.mk
> +++ b/package/tar/tar.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TAR_VERSION = 1.29
> +TAR_VERSION = 1.30
>  TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
>  TAR_SITE = $(BR2_GNU_MIRROR)/tar
>  # busybox installs in /bin, so we need tar to install as well in /bin
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

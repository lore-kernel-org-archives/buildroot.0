From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 08 Apr 2015 22:11:10 +0200
Subject: [Buildroot] [PATCH 1/1 v2] libvpx: bump version to 1.4.0
In-Reply-To: <1428447211-24428-1-git-send-email-sagaert.johan@proximus.be>
References: <1428447211-24428-1-git-send-email-sagaert.johan@proximus.be>
Message-ID: <55258B5E.3010304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/15 00:53, Sagaert Johan wrote:
> Use tar.bz2 instead of git.
> Also added the hash file.
> Changes: https://chromium.googlesource.com/webm/libvpx/+/0080aca235e2d677e49ff46c3e8e77d9dd15858c/CHANGELOG
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>

Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (build test, including check that ffmpeg links against it)

> ---
> V1->V2
> 	Use tar.bz2 and add hash.
> ---
>  package/libvpx/libvpx.hash | 2 ++
>  package/libvpx/libvpx.mk   | 9 ++++-----
>  2 files changed, 6 insertions(+), 5 deletions(-)
>  create mode 100644 package/libvpx/libvpx.hash
> 
> diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
> new file mode 100644
> index 0000000..44cd994
> --- /dev/null
> +++ b/package/libvpx/libvpx.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  f582d9b2d60a592a4a3d8c32965ca2d2167e9ade38c6c30bac8801ff66a118e4  libvpx-1.4.0.tar.bz2
> diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
> index 7624835..a6a6d83 100644
> --- a/package/libvpx/libvpx.mk
> +++ b/package/libvpx/libvpx.mk
> @@ -4,13 +4,12 @@
>  #
>  ################################################################################
>  
> -LIBVPX_VERSION = v1.3.0
> -LIBVPX_SITE = http://git.chromium.org/webm/libvpx.git
> -LIBVPX_SITE_METHOD = git
> -
> +LIBVPX_VERSION_MAJOR = 1.4
> +LIBVPX_VERSION = $(LIBVPX_VERSION_MAJOR).0

 There is no need to introduce the LIBVPX_VERSION_MAJOR symbol. Just define the
version as 1.4.0.


 Regards,
 Arnout

> +LIBVPX_SOURCE = libvpx-$(LIBVPX_VERSION).tar.bz2
> +LIBVPX_SITE = http://storage.googleapis.com/downloads.webmproject.org/releases/webm
>  LIBVPX_LICENSE = BSD-3c
>  LIBVPX_LICENSE_FILES = LICENSE PATENTS
> -
>  LIBVPX_INSTALL_STAGING = YES
>  
>  # ld is being used with cc options. therefore, pretend ld is cc.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

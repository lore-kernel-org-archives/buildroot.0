From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Oct 2015 12:57:00 +0100
Subject: [Buildroot] [PATCH v1 2/3] media-ctl: remove package
In-Reply-To: <1444165338-19896-2-git-send-email-ps.report@gmx.net>
References: <1444165338-19896-1-git-send-email-ps.report@gmx.net>
 <1444165338-19896-2-git-send-email-ps.report@gmx.net>
Message-ID: <5615088C.60004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06-10-15 22:02, Peter Seiderer wrote:
> Package media-ctl is out-dated, source (and developement) have been moved
> to v4l-utils since June 2014. Up-to-date version is available in
> the libv4l package (BR2_PACKAGE_LIBV4L/BR2_PACKAGE_LIBV4L_UTILS).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  Config.in.legacy                                   |   7 +
>  package/Config.in                                  |   1 -
>  ...ers-for-compatibility-with-old-toolchains.patch | 303 ---------------------
>  package/media-ctl/Config.in                        |   9 -
>  package/media-ctl/media-ctl.mk                     |  17 --
>  5 files changed, 7 insertions(+), 330 deletions(-)
>  delete mode 100644 package/media-ctl/0001-add-kernel-headers-for-compatibility-with-old-toolchains.patch
>  delete mode 100644 package/media-ctl/Config.in
>  delete mode 100644 package/media-ctl/media-ctl.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 3c7fe36..4b7e201 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -107,6 +107,13 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2015.11"
>  
> +config BR2_PACKAGE_MEDIA_CTL
> +	bool "media-ctl package has been removed"
> +	help
> +	  media-ctl source and developement have been moved to
> +	  v4l-utils since June 2014. For an up-to-date media-ctl
> +	  version select BR2_PACKAGE_LIBV4L and BR2_PACKAGE_LIBV4L_UTILS.

 These two options should be selected automatically. See e.g.
BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI

 You should also select BR2_LEGACY.

> +
>  config BR2_PACKAGE_SCHIFRA
>  	bool "schifra package has been removed"

 Oops, here BR2_LEGACY is not selected... And in a couple of other places as well...

 Regards,
 Arnout

>  	help

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Aug 2016 17:06:37 +0200
Subject: [Buildroot] [PATCH] gcc: rename option for ARC gcc
In-Reply-To: <1470921938-11550-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470921938-11550-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <e62252e4-5ab1-4b26-1f2a-bd505f158641@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11-08-16 15:25, Thomas Petazzoni wrote:
> The ARC gcc version is now based on gcc 6.x and no longer gcc 4.8.x,
> which makes the option BR2_GCC_VERSION_4_8_ARC a bit irrelevant, as is
> the prompt of this option.
> 
> This commit therefore renames this option to BR2_GCC_VERSION_ARC, and
> adjust its prompt as well.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Config.in.legacy                       |  7 +++++++
>  package/gcc/Config.in.host             | 10 +++++-----
>  package/gcc/gcc-initial/gcc-initial.mk |  2 +-
>  3 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 746b80a..892a836 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,13 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2016.08"
>  
> +config BR2_GCC_VERSION_4_8_ARC
> +	bool "gcc arc option renamed"
> +	select BR2_LEGACY

 You forgot to select BR2_GCC_VERSION_ARC.

 Otherwise: Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> +	help
> +	  The option is select the gcc version for the ARC
> +	  architecture has been renamed to BR2_GCC_VERSION_ARC.
> +
>  config BR2_PACKAGE_SYSTEMD_COMPAT
>  	bool "systemd compatibility libraries have been removed"
>  	select BR2_LEGACY

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

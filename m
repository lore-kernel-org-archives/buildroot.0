From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 7 Jan 2021 13:52:39 -0600
Subject: [Buildroot] [PATCH 02/10 v3] core/pkg-infra: allow per
 site-method sub-version strings
In-Reply-To: <56c06f0c54667a42f32932601926032636a71f8a.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
 <56c06f0c54667a42f32932601926032636a71f8a.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <3304ba67-0c11-2f62-72e5-74b7e3066b65@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/29/20 5:01 AM, Yann E. MORIN wrote:
> When we want to change the format of an archive we generate (e.g. those
> we generate from git trees), the hashes of those archives will change.
> 
> To avoid any issue (e.g. an older Buildroot using newer archives, or the
> other way around) that would conclude that the hashes do not match, we
> want to change the filenames of the generated archives whenever we
> change their format.
> 
> Introduce a new internal variable, specific to each site method, that we
> can set to include a "format version" for the archives generated from
> that site method.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> ---
>   package/pkg-generic.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 6a9389f1b5..8db79dc74a 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -514,7 +514,7 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
>   $(2)_VERSION = custom
>   endif
>   
> -$(2)_SOURCE_EXT = .tar.gz
> +$(2)_SOURCE_EXT = $$(BR_FMT_VERSION_$$($(2)_SITE_METHOD)).tar.gz
>   ifndef $(2)_SOURCE
>    ifdef $(3)_SOURCE
>     $(2)_SOURCE = $$($(3)_SOURCE)
> 

Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com

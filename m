From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 10:30:51 +0200
Subject: [Buildroot] [PATCH 04/13] pkg-generic: make PKG_DL_DIR equal to
 DL_DIR
In-Reply-To: <20170704162211.13238-5-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-5-maxime.hadjinlian@gmail.com>
Message-ID: <1faba3ef-a7bd-0709-d1e8-c09c1f834a63@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 18:22, Maxime Hadjinlian wrote:
> This variable is currently not used by anyone.
> The value is changed to match the path to DL_DIR.
> 
> The next patch will introduce the use of PKG_DL_DIR for packages that
> use specific EXTRACT_CMDS.
> 
> And then we will be able to change the value of PKG_DL_DIR to create a
> new directory structure in DL_DIR with a subdirectory for each package.

 Funny, you will later change it to almost the same as what it is now...

> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(doesn't depend on the earlier patches in the series).

 Regards,
 Arnout

> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 79bea906e2..c1cd41fda5 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -434,7 +434,7 @@ endif
>  
>  $(2)_BASE_NAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
>  $(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
> -$(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
> +$(2)_DL_DIR	=  $$(DL_DIR)
>  $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
>  
>  ifndef $(2)_SUBDIR
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

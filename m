From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 21:42:53 +0200
Subject: [Buildroot] [PATCH 08/13] pkg-generic: add a subdirectory to
 the DL_DIR
In-Reply-To: <20170704162211.13238-9-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
 <20170704162211.13238-9-maxime.hadjinlian@gmail.com>
Message-ID: <ccef83e0-d47e-8f78-59b6-5d20c49c264a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-07-17 18:22, Maxime Hadjinlian wrote:
> With all the previous changes, we are now ready to add a subdirectory to
> the DL_DIR.
> The structure will now be DL_DIR/PKG_NAME/{FILE1,FILE2}
> 
> This is needed for multiple reasons:
>     - Avoid patches with name like SHA1.patch laying flat in DL_DIR,
                           names

>     which makes it hard to know to which packages they apply
>     - Avoid possible collisions if two releases have the same name
>     (e.g: v01.tar)
>     - Allow the possibility to handle a git cache per package in the
>     newly created subdirectory.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 5d169b20d6..7364551471 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -434,7 +434,7 @@ endif
>  
>  $(2)_BASE_NAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
>  $(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
> -$(2)_DL_DIR	=  $$(DL_DIR)
> +$(2)_DL_DIR 	=  $$(DL_DIR)/$$($(2)_RAWNAME)
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

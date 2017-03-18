From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Mar 2017 18:47:04 +0100
Subject: [Buildroot] [PATCH v5 19/19] infra-libtool: no longer force
 sys_lib_search_path
In-Reply-To: <1482241596-31688-20-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-20-git-send-email-jezz@sysmic.org>
Message-ID: <e3a0c099-41e5-07b0-338b-74cfad1d2bfa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-12-16 14:46, J?r?me Pouiller wrote:
> Commit 6246704008 forced $sys_lib_search_path_spec to be empty. Commit log said
> that it was filled with native paths. However, recent tests show that
> $sys_lib_search_path_spec is correctly filled with result of
> `$CC -print-search-dirs' as it should.

 I guess that that's due to passing --with-sysroot, no?

> 
> So this patch remove this workaround.
                      ^s

> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>


Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(tested on a static arm musl build with about 20 packages)


 Regards,
 Arnout

> ---
>  package/Makefile.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 6a341f2..ee43985 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -354,7 +354,6 @@ TARGET_CONFIGURE_ARGS = \
>  	ac_cv_func_malloc_0_nonnull=yes \
>  	ac_cv_func_calloc_0_nonnull=yes \
>  	ac_cv_func_realloc_0_nonnull=yes \
> -	lt_cv_sys_lib_search_path_spec="" \
>  	lt_cv_sys_lib_dlsearch_path_spec="/lib /usr/lib $(STAGING_DIR)/lib $(STAGING_DIR)/usr/lib" \
>  	$(BR2_AC_CV_C_BIGENDIAN) \
>  	$(BR2_GT_CV_FUNC_GNUGETTEXT_LIBC)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

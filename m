From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Aug 2016 19:58:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/elfutils: set program-prefix to
 default ("eu-")
In-Reply-To: <1471515467-21065-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1471515467-21065-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <af0fbe66-40fb-ad62-ff49-81b46552c7dc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-08-16 12:17, Marcin Nowakowski wrote:
> Elfutils program names collide with binutils' binaries. By default
> applications provided by elfutils are prefixed with "eu-", but in
> Buildroot that setting is overridden by pkg-autotools.
> The option in pkg-autotools rules was added to avoid including a target
> triple in some packages as a prefix, so restore elfutils default
> behaviour by adding a "eu-" program-prefix.
> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>

 I didn't test, but looks sane to me.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Probably for -next though.

 A comment in the .mk file would have been nice, but myself, I generally consult
the log when in doubt so it's OK for me.

 Regards,
 Arnout

> ---
>  package/elfutils/elfutils.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
> index b999d0f..0aa11a6 100644
> --- a/package/elfutils/elfutils.mk
> +++ b/package/elfutils/elfutils.mk
> @@ -14,7 +14,9 @@ ELFUTILS_DEPENDENCIES = zlib
>  
>  # We patch configure.ac
>  ELFUTILS_AUTORECONF = YES
> -ELFUTILS_CONF_OPTS += --disable-werror
> +ELFUTILS_CONF_OPTS += \
> +	--disable-werror \
> +	--program-prefix="eu-"
>  
>  # elfutils gets confused when lfs mode is forced, so don't
>  ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

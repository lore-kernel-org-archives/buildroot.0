From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Feb 2016 01:07:46 +0100
Subject: [Buildroot] [PATCH 06/32] package/systemd: add
 --enable/disable-libcurl
In-Reply-To: <1456437341-19025-7-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-7-git-send-email-gabe@hashrabbit.co>
Message-ID: <56CF9752.3050509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/16 22:55, Gabe Evans wrote:
> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Again, for master, including the help text update this time but then it will
have to be merged manually.

 Regards,
 Arnout

> ---
>  package/systemd/Config.in  | 1 +
>  package/systemd/systemd.mk | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 9de6e11..6edfba1 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -58,6 +58,7 @@ config BR2_PACKAGE_SYSTEMD
>  	  - acl package will add support for multi-seat.
>  	  - xz and/or lz4 packages will add compression support in journal
>  	    and coredump.
> +	  - libcurl package will add support for systemd-journal-upload.
>  	  - libgcrypt package will add support for journal sealing and resolved
>  	    DNSSEC verification.
>  
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 29c764e..18e0c5c 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -104,6 +104,13 @@ else
>  SYSTEMD_CONF_OPTS += --disable-zlib
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> +SYSTEMD_DEPENDENCIES += libcurl
> +SYSTEMD_CONF_OPTS += --enable-libcurl
> +else
> +SYSTEMD_CONF_OPTS += --disable-libcurl
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  SYSTEMD_DEPENDENCIES += libgcrypt
>  SYSTEMD_CONF_OPTS += \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 21:07:53 +0100
Subject: [Buildroot] [PATCH 1/1] swig: use a relative path for the host
 swig2.0 symlink's target
In-Reply-To: <1447669504-10777-1-git-send-email-phil@zankapfel.net>
References: <1447669504-10777-1-git-send-email-phil@zankapfel.net>
Message-ID: <564A3799.4010407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-11-15 11:25, Phil Eichinger wrote:
> An absolute path isn't really necessary and breaks relocating
> 
> Signed-off-by: Phil Eichinger <phil@zankapfel.net>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (untested)

 Regards,
 Arnout

> ---
>  package/swig/swig.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/swig/swig.mk b/package/swig/swig.mk
> index 3f3ab2f..6b9b8ae 100644
> --- a/package/swig/swig.mk
> +++ b/package/swig/swig.mk
> @@ -25,7 +25,7 @@ SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
>  # swig, so that our swig always gets used.
>  
>  define HOST_SWIG_INSTALL_SYMLINK
> -	ln -fs $(HOST_DIR)/usr/bin/swig $(HOST_DIR)/usr/bin/swig$(SWIG_VERSION_MAJOR)
> +	ln -fs swig $(HOST_DIR)/usr/bin/swig$(SWIG_VERSION_MAJOR)
>  endef
>  
>  HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

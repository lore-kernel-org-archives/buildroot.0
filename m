From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jul 2016 22:04:25 +0200
Subject: [Buildroot] [RFC 1/3] zip: add explicit dependencies for host
	variant
In-Reply-To: <1467485315-28264-2-git-send-email-julien.floret@6wind.com>
References: <1467485315-28264-1-git-send-email-julien.floret@6wind.com>
 <1467485315-28264-2-git-send-email-julien.floret@6wind.com>
Message-ID: <a87cf40d-7deb-254a-ff4f-b5167abca4e8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-07-16 20:48, Julien Floret wrote:
> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> ---
>  package/zip/zip.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/zip/zip.mk b/package/zip/zip.mk
> index 5338f881663d..f56ac5a4804d 100644
> --- a/package/zip/zip.mk
> +++ b/package/zip/zip.mk
> @@ -12,6 +12,7 @@ ZIP_LICENSE_FILES = LICENSE
>  
>  ifeq ($(BR2_PACKAGE_BZIP2),y)
>  ZIP_DEPENDENCIES += bzip2
> +HOST_ZIP_DEPENDENCIES += host-bzip2

 Nack. This is another example why the automatic derivation is not good.
host-zip should either depend on host-bzip2 unconditionally, or never depend on
it, or depend on it based on BR2_PACKAGE_HOST_BZIP2.

 In this specific case, it should not depend on host-bzip2 IMHO. So the correct
thing to do with the automatic derivation would be

HOST_ZIP_DEPENDENCIES =


 Regards,
 Arnout

>  endif
>  
>  # Infozip's default CFLAGS.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

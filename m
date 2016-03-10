From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Mar 2016 01:15:25 +0100
Subject: [Buildroot] [PATCH v7 14/18] support/scripts/check-host-rpath:
 silent find command
In-Reply-To: <1457564339-27294-15-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-15-git-send-email-s.martin49@gmail.com>
Message-ID: <56E0BC9D.9020602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/09/16 23:58, Samuel Martin wrote:
> Silent find command when HOST_DIR/usr/sbin does not exist.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Can this be applied right away, maybe?

  Regards,
  Arnout

>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ---
> changes v6->v7:
> - new patch
> ---
>   support/scripts/check-host-rpath | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index 0bbac30..2d3ddec 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath
> @@ -45,7 +45,7 @@ main() {
>                   "${pkg}"
>           fi
>           printf "***   %s\n" "${file}"
> -    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -print |
> +    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -print 2>/dev/null |
>                     readelf.filter_elf_executable )
>
>       return ${ret}
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

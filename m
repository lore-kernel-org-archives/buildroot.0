From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Mar 2016 01:16:46 +0100
Subject: [Buildroot] [PATCH v7 15/18] support/scripts/check-host-rpath:
 also check HOST_DIR/{bin, sbin}
In-Reply-To: <1457564339-27294-16-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-16-git-send-email-s.martin49@gmail.com>
Message-ID: <56E0BCEE.3000501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/09/16 23:58, Samuel Martin wrote:
> At least syslinux is installing stuff in HOST_DIR/sbin.
>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

  Hold on with this one, I'll post a series that removes the usr/ part (or at 
least, makes it a symlink to .), so this won't be needed anymore.


  Regards,
  Arnout

>
> ---
> changes v6->v7:
> - new patch
> ---
>   support/scripts/check-host-rpath | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index 2d3ddec..f5f16ff 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath
> @@ -45,7 +45,7 @@ main() {
>                   "${pkg}"
>           fi
>           printf "***   %s\n" "${file}"
> -    done < <( find "${hostdir}"/usr/{bin,sbin} -type f -print 2>/dev/null |
> +    done < <( find "${hostdir}"/{,usr/}{bin,sbin} -type f -print 2>/dev/null |
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

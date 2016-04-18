From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:37:19 +0200
Subject: [Buildroot] [PATCH v8 10/14] support/scripts/check-host-rpath:
 also check HOST_DIR/{bin, sbin}
In-Reply-To: <1460929111-15615-11-git-send-email-s.martin49@gmail.com>
References: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
 <1460929111-15615-11-git-send-email-s.martin49@gmail.com>
Message-ID: <20160418213719.7139ead4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Apr 2016 23:38:27 +0200, Samuel Martin wrote:
> At least syslinux is installing stuff in HOST_DIR/sbin.
> 
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v7->v8:
> - none
> 
> changes v6->v7:
> - new patch
> ---
>  support/scripts/check-host-rpath | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index 3df70bd..022f01b 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath
> @@ -45,7 +45,7 @@ main() {
>                  "${pkg}"
>          fi
>          printf "***   %s\n" "${file}"
> -    done < <(find "${hostdir}"/usr/{bin,sbin} -type f -print 2>/dev/null |
> +    done < <(find "${hostdir}"/{,usr/}{bin,sbin} -type f -print 2>/dev/null |
>                    readelf.filter_elf_executable)

Please put this patch as PATCH 01 in your series, so that we can apply
it right now as a preparation fix. This way, you reduce the size of
your patch series, and things move forward.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

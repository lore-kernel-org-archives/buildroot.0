From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Apr 2018 19:39:18 +0200
Subject: [Buildroot] [PATCH] support/download/dl-wrapper: pass the
 correct -N option
In-Reply-To: <20180411081024.15097-1-thomas.petazzoni@bootlin.com>
References: <20180411081024.15097-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180411173918.GC2328@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-04-11 10:10 +0200, Thomas Petazzoni spake thusly:
> ${raw_name} is never defined in dl-wrapper, and therefore the value
> passed to the -N option is always empty. This causes a problem for the
> 'cvs' backend, which uses the value of this option as the CVS module
> to be downloaded.
> 
> If the name of the CVS module is omitted, all the CVS modules from
> that CVS repository are downloaded, which creates a tarball with a lot
> more contents, and the actual useful contents in a sub-directory,
> obviously breaking patches that should be applied, and the entire
> build process that follows.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/fcee0e3d7eeeb373313b1794092c729b1b052348/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

When can we eventually drop this cvs backend for good, now? ;-)

Regards,
Yann E. MORIN.

> ---
>  support/download/dl-wrapper | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 3d2118a4ef..8d6365e08d 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -125,7 +125,7 @@ main() {
>                  -c "${cset}" \
>                  -d "${dl_dir}" \
>                  -n "${raw_base_name}" \
> -                -N "${raw_name}" \
> +                -N "${base_name}" \
>                  -f "${filename}" \
>                  -u "${uri}" \
>                  -o "${tmpf}" \
> -- 
> 2.14.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

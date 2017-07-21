From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Jul 2017 23:13:48 +0200
Subject: [Buildroot] [PATCH v9 3/3] support/scripts/fix-rpath: typo fix
 and unneeded "; " removed
In-Reply-To: <1500642853-5565-4-git-send-email-wg@grandegger.com>
References: <1500642853-5565-1-git-send-email-wg@grandegger.com>
 <1500642853-5565-4-git-send-email-wg@grandegger.com>
Message-ID: <390f1289-3b37-fb16-9abe-a7f440329253@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-07-17 15:14, Wolfgang Grandegger wrote:
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  support/scripts/fix-rpath | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
> index 9272d2d..5a30207 100755
> --- a/support/scripts/fix-rpath
> +++ b/support/scripts/fix-rpath
> @@ -27,7 +27,7 @@ Description:
>  
>      Sanitization behaves the same whatever the kind of the processed tree,
>      but the resulting RPATH differs. The rpath sanitization is done using
> -    "patchelf --make-rpath-relazive".
> +    "patchelf --make-rpath-relative".
>  
>  Arguments:
>  
> @@ -81,7 +81,7 @@ main() {
>                  find_args+=( "-path" "${TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR}" "-prune" "-o" )
>  
>              for excludepath in ${HOST_EXCLUDEPATHS}; do
> -                find_args+=( "-path" "${HOST_DIR}""${excludepath}" "-prune" "-o" );
> +                find_args+=( "-path" "${HOST_DIR}""${excludepath}" "-prune" "-o" )
>              done
>  
>              # do not process the patchelf binary but a copy to work-around "file in use"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

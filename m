From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 05 Nov 2013 19:51:38 +0100
Subject: [Buildroot] [PATCH] scripts: apply-patches: don't stop if no
 patch is found for a package
In-Reply-To: <1383656430-29160-1-git-send-email-andi@etezian.org>
References: <1383656430-29160-1-git-send-email-andi@etezian.org>
Message-ID: <52793E3A.5060802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/11/13 14:00, Andi Shyti wrote:
> If no patch is available for a specific package it doesn't mean
> that is necessarily an error, perhaps there is no need to apply
> any patches. Therefore, don't stop the build by returning '1',
> but go ahead.

  This is in fact intentional, because it indicates that there is 
something wrong with the configuration. When you specify in your 
configuration that some specific patch directory should be used, but that 
directory doesn't exist, then it probably means you made a mistake in 
your configuration.

  Can you give an example of a specific situation where you had a problem 
with this check?

  Regards,
  Arnout

>
> Signed-off-by: Andi Shyti <andi@etezian.org>
> ---
>   support/scripts/apply-patches.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index ff72b45..aabab4f 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -43,7 +43,7 @@ if [ ! -d "${builddir}" ] ; then
>   fi
>   if [ ! -d "${patchdir}" ] ; then
>       echo "Aborting.  '${patchdir}' is not a directory."
> -    exit 1
> +    exit
>   fi
>
>   # Remove any rejects present BEFORE patching - Because if there are
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

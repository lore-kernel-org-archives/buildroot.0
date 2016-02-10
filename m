From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 23:37:27 +0100
Subject: [Buildroot] [PATCH v2 4/5] docs/manual: add section about patch
	licensing
In-Reply-To: <1454365196-26319-5-git-send-email-luca@lucaceresoli.net>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
 <1454365196-26319-5-git-send-email-luca@lucaceresoli.net>
Message-ID: <56BBBBA7.9050105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-02-16 23:19, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v1 -> v2:
> - "they modify" -> "they apply to" (Thomas).
> ---
>  docs/manual/legal-notice.txt | 16 ++++++++++++++--
>  docs/manual/patch-policy.txt |  2 +-
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
> index 5895224..49c4965 100644
> --- a/docs/manual/legal-notice.txt
> +++ b/docs/manual/legal-notice.txt
> @@ -131,11 +131,13 @@ Buildroot, with the name used in the manifest files:
>    http://apache.org/licenses/LICENSE-2.0.html[
>    Apache License, version 2.0];
>  
> +[[legal-info-buildroot]]
>  === Complying with the Buildroot license
>  
>  Buildroot itself is an open source software, released under the
> -http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General Public
> -License, version 2] or (at your option) any later version.
> +http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General
> +Public License, version 2] or (at your option) any later version, with
> +the exception of the package patches detailed below.
>  However, being a build system, it is not normally part of the end product:
>  if you develop the root filesystem, kernel, bootloader or toolchain for a
>  device, the code of Buildroot is only present on the development machine, not
> @@ -156,3 +158,13 @@ material that must be redistributed.
>  
>  Keep in mind that this is only the Buildroot developers' opinion, and you
>  should consult your legal department or lawyer in case of any doubt.
> +
> +==== Patches to packages
> +
> +Buildroot is bundled with a set of patches that it applies to packages
> +to fix cross-compilation or other issues. See xref:patch-policy[] for
> +the technical details.
> +
> +These patches are effectively a derived work of the upstream package,
> +and they are released under the same license as the software they
> +apply to. They are not distributed under the Buildroot license.
> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> index d50c971..fe432a7 100644
> --- a/docs/manual/patch-policy.txt
> +++ b/docs/manual/patch-policy.txt
> @@ -91,7 +91,7 @@ If something goes wrong in the steps _3_ or _4_, then the build fails.
>  === Format and licensing of the package patches
>  
>  Patches are released under the same license as the software they apply
> -to.
> +to. (see xref:legal-info-buildroot[]).

 Small nit: the (see ) part should come before the period. So

+to (see xref:legal-info-buildroot[]).


 With that:
 Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

>  
>  A message explaining what the patch does, and why it is needed, should
>  be added in the header commentary of the patch.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

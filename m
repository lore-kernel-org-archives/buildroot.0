From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Feb 2016 00:34:30 +0100
Subject: [Buildroot] [PATCH v2 4/5] docs/manual: add section about patch
	licensing
In-Reply-To: <1454365196-26319-5-git-send-email-luca@lucaceresoli.net>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
 <1454365196-26319-5-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160203233430.GC3428@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-02-01 23:19 +0100, Luca Ceresoli spake thusly:
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

As previously said, we have to clarify this. However, since yout patch
does not change it, and merely wraps lines:

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

... that are applied to...

> +to fix cross-compilation or other issues. See xref:patch-policy[] for
> +the technical details.
> +
> +These patches are effectively a derived work of the upstream package,

... a derived work of the package they are applied to...

> +and they are released under the same license as the software they

and so are released...

> +apply to.

So, we still have the problem of patches that are applied to packages
that can be had under a non-public license, like e.g. Qt, polarssl...
for which there exists a proprietary alternative?

In my opinion, the patches we carry are only available under the FLOSS
license we can get them:

  - if we cherry-picked them from upstream, then the only license we
    ever had for those patches is the FLOSS license, not the proprietary
    one; so they can't be applied to the proprietary version of the
    package (but a licensee may get those patches from the licensor, and
    replace our patches with the ones it got from the licensor);

  - if we wrote them, the only solution we have is to make them public
    domain, or they could not be applied either (we don't know the
    licensing terms for that proprietary version, so we can't license
    them under those terms);

  - if we got them from somewhere else (e.g. openwrt, gentoo,
    alpine...), then we'd have to get the licensing terms from those
    providers, and I guess most of them either don't know (most
    probable) or would only provide them under the usual FLOSS license
    of that package (not knowing better than us in points 1 and 2 above).

So, this situation is really complex, and we can't deal with that in
such a simple way.

> They are not distributed under the Buildroot license.

Well, what of a patch to a GPLv2 package? It is the same license as
Buidlroot's license... What I mean, is that some patches might be
covered by the same licensing terms, but that it's not because of
Buildroot, but because of the package they are applied to. I'd like we
make that clearer...

But as I explained above, it is far from trivial. We need to think a bit
more about it...

So NAK on my part.

Regards,
Yann E. MORIN.

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
>  
>  A message explaining what the patch does, and why it is needed, should
>  be added in the header commentary of the patch.
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

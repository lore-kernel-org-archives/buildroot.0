From: James Knight <james.d.knight@live.com>
Date: Sat, 25 Jun 2016 00:11:55 -0400
Subject: [Buildroot] [PATCH 3/4 v3] libamcodec: New Package
In-Reply-To: <20160624182256.11909-3-daggs@gmx.com>
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-3-daggs@gmx.com>
Message-ID: <CALAjcgXpqh74h_6gc+Z8rjZwa_VW4=Wzw5fLDvpjodvM2n+Qmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dagg,

On Fri, Jun 24, 2016 at 2:22 PM, Dagg Stompler <daggs@gmx.com> wrote:
> v2 -> v3:
>  - fix sum256 value.
>  - fix patch.

While I don't believe it's required, I recommending leaving old change
version information in new patches as well. This helps reviewers who
jump in late so understand your patch changes easier. For example,
patch 613857 [2].

> +Subject: [PATCH] libamcodec: fix makefiles to allow cross compilation.
> +
> +fix makefiles so it will be possible to cross compile the package
> +
> +Signed-off-by: Dagg Stompler <daggs@gmx.com>

Out of curiosity, have you also tried submitting these changes
upstream? I don't see any forks or pull requests on
"mdrjr/c2_aml_libs" [2] (if they even handle community patches that
way). I might help the long term maintenance of this package in
Buildroot by fixing issues in the root projects (instead of having to
update patches every version/hash bump).

> +LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))

I haven't really dug into the origin of the libamcodec package, but is
there a reason why "mdrjr/c2_aml_libs" [2] is being used over (which
may be the official) "Stane1983/amlogic-libplayer" repository?

> +LIBAMCODEC_LICENSE = Unclear

Providing "unclear" is not an acceptable license choice. You need to
find the exact license for this package before anyone would submit it
into Buildroot (although, I'm not maintainer, so I couldn't stop them
if they wanted to add it anyways :D).

[1]: https://patchwork.ozlabs.org/patch/613857/
[2]: https://github.com/mdrjr/c2_aml_libs
[3]: https://github.com/Stane1983/amlogic-libplayer

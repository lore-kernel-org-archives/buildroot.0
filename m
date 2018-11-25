From: Carlos Santos <casantos@datacom.com.br>
Date: Sat, 24 Nov 2018 23:16:33 -0200 (BRST)
Subject: [Buildroot] [PATCH] docs/manual: standardize a bit more the
 formatting of commit titles
In-Reply-To: <20181124101903.18138-1-thomas.petazzoni@bootlin.com>
References: <20181124101903.18138-1-thomas.petazzoni@bootlin.com>
Message-ID: <1442786873.3545705.1543108593942.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "buildroot" <buildroot@buildroot.org>
> Cc: "Thomas De Schampheleire" <thomas.de_schampheleire@nokia.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> Sent: S?bado, 24 de novembro de 2018 8:19:03
> Subject: [Buildroot] [PATCH] docs/manual: standardize a bit more the formatting of commit titles

> Currently, our commit titles are not very well standardized, and it
> would be great to standardize them a little bit more. A number of
> people use "<pkg>: " as prefix, others use "package/<pkg>: ". Some
> people start the rest of the commit title (after the prefix) with an
> upper-case letter, some with a lower-case letter.
> 
> In an attempt to standardize this, this commit updates the manual with
> some examples of good commit titles.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> docs/manual/contribute.txt | 21 ++++++++++++++++++---
> 1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 60bfb961f0..5530ce1546 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -194,14 +194,29 @@ bisect+ to locate the origin of a problem.
> 
> First of all, it is essential that the patch has a good commit
> message. The commit message should start with a separate line with a
> -brief summary of the change, starting with the name of the affected
> -package. The body of the commit message should describe _why_ this
> +brief summary of the change, prefixed by the area touched by the
> +patch. A few examples of good commit titles:
> +
> +* +package/linuxptp: bump version to 2.0+

Looks good, but isn't "package/" a bit superfluous, since Most of the
commits are for packages? It also goes against the tradition:

$ git log --oneline origin/master | grep -i '^.......... [^ /]*: bump' |wc -l
7644
$ git log --oneline origin/master | grep -i '^.......... [^ ]*/[^ ]*: bump' |wc -l
2296

BTW, I want the bike shed red.

> +
> +* +configs/imx23evk: bump Linux version to 4.19+
> +
> +* +package/pkg-generic: postpone evaluation of dependency conditions+
> +
> +* +boot/uboot: needs host-{flex,bison}+
> +
> +* +support/testing: add python-ubjson tests+
> +
> +The description that follows the prefix should start with a lower case
> +letter (i.e "bump", "needs", "postpone", "add" in the above examples).
> +
> +Second, the body of the commit message should describe _why_ this
> change is needed, and if necessary also give details about _how_ it
> was done. When writing the commit message, think of how the reviewers
> will read it, but also think about how you will read it when you look
> at this change again a few years down the line.
> 
> -Second, the patch itself should do only one change, but do it
> +Third, the patch itself should do only one change, but do it
> completely. Two unrelated or weakly related changes should usually be
> done in two separate patches. This usually means that a patch affects
> only a single package. If several changes are related, it is often
> --
> 2.19.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Reviewed-by: Carlos Santos <casantos@datacom.com.br>

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer

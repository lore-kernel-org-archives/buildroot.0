From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Nov 2018 17:17:22 +0100
Subject: [Buildroot] [PATCH] docs/manual: standardize a bit more the
 formatting of commit titles
In-Reply-To: <20181124101903.18138-1-thomas.petazzoni@bootlin.com>
References: <20181124101903.18138-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181125161722.GC28830@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-24 11:19 +0100, Thomas Petazzoni spake thusly:
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
>  docs/manual/contribute.txt | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> index 60bfb961f0..5530ce1546 100644
> --- a/docs/manual/contribute.txt
> +++ b/docs/manual/contribute.txt
> @@ -194,14 +194,29 @@ bisect+ to locate the origin of a problem.
>  
>  First of all, it is essential that the patch has a good commit
>  message. The commit message should start with a separate line with a
> -brief summary of the change, starting with the name of the affected
> -package. The body of the commit message should describe _why_ this
> +brief summary of the change, prefixed by the area touched by the
> +patch. A few examples of good commit titles:
> +
> +* +package/linuxptp: bump version to 2.0+

Aha, so you finally saw the light! ;-)

When I add 'package/' as a prefix, it is not because it is in the
package subdirectory, but because it is touching a package, as opposed
to something else, like core stuff or package infrastructures.

The prefix is a 'semantic' prefix, not a path prefix. A path prefix
serves no purpose in and of itself.

> +* +configs/imx23evk: bump Linux version to 4.19+
> +
> +* +package/pkg-generic: postpone evaluation of dependency conditions+

There, I would have sued 'infra/' as a prefix, because it is touching
the pkg0generic infrastructure, not a package.

> +* +boot/uboot: needs host-{flex,bison}+

And there, I would have used 'package'/'.

> +* +support/testing: add python-ubjson tests+

Yes.

> +The description that follows the prefix should start with a lower case
> +letter (i.e "bump", "needs", "postpone", "add" in the above examples).

    The description that follows the prefix should be all in lower case,
    and start with a verb, if possible in the imperative form ("add",
    "postpone", "bump"), or in the third person of the present ("needs",
    "should be")

Otherwise, OK.

Oh, by the way, the shed ought to be blue. ;-)

Regards,
Yann E. MORIN.

> +Second, the body of the commit message should describe _why_ this
>  change is needed, and if necessary also give details about _how_ it
>  was done. When writing the commit message, think of how the reviewers
>  will read it, but also think about how you will read it when you look
>  at this change again a few years down the line.
>  
> -Second, the patch itself should do only one change, but do it
> +Third, the patch itself should do only one change, but do it
>  completely. Two unrelated or weakly related changes should usually be
>  done in two separate patches. This usually means that a patch affects
>  only a single package. If several changes are related, it is often
> -- 
> 2.19.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

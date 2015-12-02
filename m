From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 2 Dec 2015 06:34:14 +0200
Subject: [Buildroot] [PATCH] manual: clarify policy when updating a
 package patch
In-Reply-To: <1449002515-27302-1-git-send-email-arnout@mind.be>
References: <1449002515-27302-1-git-send-email-arnout@mind.be>
Message-ID: <20151202043414.GI2193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Dec 01, 2015 at 09:41:55PM +0100, Arnout Vandecappelle (Essensium/Mind) wrote:
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Renaud AUBIN <root@renaud.io>
> ---
>  docs/manual/patch-policy.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> index 6e27e71..bb859bd 100644
> --- a/docs/manual/patch-policy.txt
> +++ b/docs/manual/patch-policy.txt
> @@ -106,6 +106,10 @@ upstream SCM software to generate the patch set.
>  Otherwise, concatenate the header with the output of the
>  +diff -purN package-version.orig/ package-version/+ command.
>  
> +If you update an existing patch (e.g. when bumping the package version),
> +make sure the original author and existing Signed-off-by tags are not
> +removed.

Since not all patches we carry have an author (From:) header this text might 
be a little confusing. Maybe:

   ... make sure the original author (the 'From:' header, when the patch has 
   one) and existing Signed-off-by ...

It maybe also be worth a mention that not all existing patches have a sign-off 
tag.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

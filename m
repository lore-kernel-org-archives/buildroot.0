From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Wed, 26 Jun 2013 21:03:58 +0200
Subject: [Buildroot] Update documentation [was] Re: [PATCH]
 package/libmicrohttpd: minor fixes and additions
In-Reply-To: <51CA0AD2.7030006@mind.be>
References: <1372187313-15042-1-git-send-email-c.schoenert@gmail.com>
 <51CA0AD2.7030006@mind.be>
Message-ID: <51CB3B1E.90605@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello again,

Am 25.06.2013 23:25, schrieb Arnout Vandecappelle:
>  I would write "LGPLv2.1+ or eCos license" to make the choice more
> explicit, else it looks as if both licenses apply.

I have a take a look into the documenation and this part is missing that
kind of info. I have tried to wrote some informative, what do you think?

> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index faf70b1..f31e069 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -328,6 +328,24 @@ information is (assuming the package name is +libfoo+) :
>    ambiguous names such as +BSD+ which actually name a family of licenses.
>    This variable is optional. If it is not defined, +unknown+ will appear in
>    the +license+ field of the manifest file for this package.
> +  If the package is licensed with more than one license just write all
> +  licenses into that line and make clear how the usage of the licenses are
> +  interact.
> +
> +For example the package could licensed under LGPLv2.1+ or MIT:
> +
> +---------------------------------
> +LIBFOO_LICENSE = LGPLv2.1+ or MIT
> +---------------------------------
> +
> +Some packages may need two licenses at the same time, that would be the
> +opposite of the above example. Then you have to combine the two licenses
> +(don't forget to check if there are two, or more, fields in
> ++LIBFOO_LICENSE_FILES+ needed):
> +
> +--------------------------------------
> +LIBFOO_LICENSE = Special1 and Special2
> +--------------------------------------
> 
>  * +LIBFOO_LICENSE_FILES+ is a space-separated list of files in the package
>    tarball that contain the license(s) under which the package is released.

Regards
Carsten

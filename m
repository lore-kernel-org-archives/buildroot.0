From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 21 Sep 2012 00:22:55 +0200
Subject: [Buildroot] [PATCH v2 2/2] Add FAQ entry how to properly add
 package from github.
In-Reply-To: <1348174101-13388-2-git-send-email-marek.belisko@open-nandra.com>
References: <1348174101-13388-1-git-send-email-marek.belisko@open-nandra.com>
 <1348174101-13388-2-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <CAHXCMMJE-C26hrKW9DYH_JMp7a47SFJQOyEHxRqK+Wy6zDSvbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marek, all,

2012/9/20 Marek Belisko <marek.belisko@open-nandra.com>:
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>  docs/manual/faq.txt |   21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/docs/manual/faq.txt b/docs/manual/faq.txt
> index 575d019..97a754b 100644
> --- a/docs/manual/faq.txt
> +++ b/docs/manual/faq.txt
> @@ -36,3 +36,24 @@ then probably you are running a Fedora (or similar) distribution, and
>  you should install the +glibc-static+ package. This is because the
>  +module-init-tools+ build process wants to link statically against the
>  C library.
> +
> +How to add package from github
> +------------------------------
> +
> +If the package has no release version, or its version cannot be
> +identified using tag, then the sha1 of the particular commit should be
> +used to identify the version (the first 7 characters of the sha1 are
> +enough):
> +
> +------------------------
> +FOO_VERSION = 1234567
> +FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
> +------------------------

Note that <package> must match the name of the package in Buildroot.
Otherwise, FOO_SOURCE should be set.

> +
> +If the package version matches a tag, then this tag should be used to
> +identify the version:
> +
> +------------------------
> +FOO_VERSION = v1.0
> +FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
> +------------------------
> --
> 1.7.9.5
>

Regards,


-- 
Sam

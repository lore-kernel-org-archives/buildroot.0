From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Sep 2012 13:05:28 +0200
Subject: [Buildroot] [PATCH v2 2/2] Add FAQ entry how to properly add
 package from github.
In-Reply-To: <1347746247-12033-2-git-send-email-marek.belisko@open-nandra.com>
References: <1347746247-12033-1-git-send-email-marek.belisko@open-nandra.com>
 <1347746247-12033-2-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <CAHXCMMKwnKtzBhZ9585kBQw+Ar=cCbqyT5rbqWLzN+mDv9eacg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marek,

2012/9/15 Marek Belisko <marek.belisko@open-nandra.com>:
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>  docs/manual/faq.txt |   20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/docs/manual/faq.txt b/docs/manual/faq.txt
> index 575d019..abb499f 100644
> --- a/docs/manual/faq.txt
> +++ b/docs/manual/faq.txt
> @@ -36,3 +36,23 @@ then probably you are running a Fedora (or similar) distribution, and
>  you should install the +glibc-static+ package. This is because the
>  +module-init-tools+ build process wants to link statically against the
>  C library.
> +
> +How to add package from github
> +------------------------------
> +
> +If package don't have version number and want to use SHA1
> +(it's enough to use first 7 characters from SHA1):
> +
> +------------------------
> +FOO_VERSION = 1234567
> +FOO_SOURCE = user-package-$(FOO_VERSION).tar.gz
To be consistent with the rest of the doc, I'd prefer:
FOO_SOURCE = <user>-<package>-$(FOO_VERSION).tar.gz

> +FOO_SITE = http://github.com/user/package/tarball/master
I think this should be:
FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>

Though most of the time, 'master' will be the branch name, some people
could have a branch per release or keep a 'stable' branch, so we
should not restrict this to 'master'


> +------------------------
> +
> +If package have version number use:
> +
> +------------------------
> +FOO_VERSION = v1.0
> +FOO_SOURCE = user-package-$(FOO_VERSION).tar.gz
> +FOO_SITE = http://github.com/user/package/tarball/$(FOO_VERSION)
> +------------------------

Ditto (about the user and package fields).


Cheers,

-- 
Sam

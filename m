From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 27 Nov 2012 22:04:32 +0100
Subject: [Buildroot] [PATCHv2 for-2012.11 2/5] manual: various fixes
In-Reply-To: <1354046527-13132-2-git-send-email-arnout@mind.be>
References: <1354046527-13132-1-git-send-email-arnout@mind.be>
 <1354046527-13132-2-git-send-email-arnout@mind.be>
Message-ID: <CAHXCMMJqkV-M2k8d9Xo1v1YQ8E5oEQobpJHUrSbg=6fUWi4pmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

2012/11/27 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>
> Various consistency and correctness improvements.
>
> Also removing some sentences that are not or no longer relevant.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[...]
>  * Use a +depends on+ type of dependency when the user really needs to
>    be aware of the dependency. Typically, Buildroot uses this type of
>    dependency for dependencies on toolchain options (target
>    architecture, MMU support, C library, C++ support, large file
>    support, thread support, RPC support, IPV6 support, WCHAR support),
> -  or for dependencies on "big" things, such as the X.org system. In
> -  some cases, especially dependency on toolchain options, it is
> -  recommended to add a +comment+ displayed when the option is not
> +  or for dependencies on "big" things, such as the X.org system. For
> +  dependencies on toolchain options,there should be a +comment+ that
s/options,there/options, there/

> +  is displayed when the option is not
>    enabled, so that the user knows why the package is not available.
>    The +depends on+ keyword express the dependency with a forward
>    semantic.
>
>  .Note
> @@ -158,11 +159,11 @@ Note that such dependencies will ensure that the dependency option
>  is also enabled, but not necessarily built before your package. To do
>  so, the dependency also needs to be expressed in the +.mk+ file of the
>  package.
>
>  Further formatting details: see xref:writing-rules-config-in[the
> -writing rules].
> +coding style].
>
>  The +.mk+ file
>  ^^^^^^^^^^^^^^
>
>  Finally, here's the hardest part. Create a file named +libfoo.mk+. It
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index ee96bc1..7025320 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -149,15 +149,15 @@ information is (assuming the package name is +libfoo+) :
>    Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
>
>  * +LIBFOO_PATCH+ may contain the name of a patch, that will be
>    downloaded from the same location as the tarball indicated in
>    +LIBFOO_SOURCE+. If +HOST_LIBFOO_PATCH+ is not specified, it
> -  defaults to +LIBFOO_PATCH+. Also note that another mechanism is
> -  available to patch a package: all files of the form
> -  +packagename-packageversion-description.patch+ present in the
> +  defaults to +LIBFOO_PATCH+. Note that patches that are included
> +  in Buildroot itself use a different mechanism: all files of the
> +  form +packagename-packageversion-description.patch+ present in the
Well, actually the pattern is "packagename-*.patch" in the following
directories:
- package/<packagename>/<packagename-packageversion>/ if this
subdirectory exists;
- package/<packagename>/ otherwise.

>    package directory inside Buildroot will be applied to the package
> -  after extraction.
> +  after extraction (see xref:patch-policy[patching a package]).
>
[...]
>  [[github-download-url]]
>  How to add a package from github
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> -If the package has no release version, or its version cannot be
> -identified using tag, then the sha1 of the particular commit should be
> -used to identify the version (the first 7 characters of the sha1 are
> -enough):
> -
> -------------------------
> -FOO_VERSION = 1234567
> -FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
> -------------------------
> +Packages on github often don't have a download area with release tarballs.
> +However, it is possible to download tarballs directly from the repository
> +on github.
>
>  If the package version matches a tag, then this tag should be used to
>  identify the version:
>
>  ------------------------
>  FOO_VERSION = v1.0
>  FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
>  ------------------------
> +
> +If the package has no release version, or its version cannot be
> +identified using tag, then the SHA1 of the particular commit should be
> +used to identify the version (the first 7 characters of the SHA1 are
> +enough):
> +
> +------------------------
> +FOO_VERSION = 1234567
> +FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
> +------------------------
> +
> +Note that the name of the name of the tarball is the default
s/the name of the name of/the name of/

> ++foo-1234567.tar.gz+ so it is not necessary to specify it in the +.mk+
> +file.
[...]

Regards,

-- 
Samuel

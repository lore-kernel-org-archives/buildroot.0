From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 27 Nov 2012 22:04:04 +0100
Subject: [Buildroot] [PATCHv2 for-2012.11 1/5] manual: trivial fixes
In-Reply-To: <1354046527-13132-1-git-send-email-arnout@mind.be>
References: <1354046527-13132-1-git-send-email-arnout@mind.be>
Message-ID: <CAHXCMMLr9SVK7S=4k2TmtZ8+HuZecpL-Xqw5ST+kNduY4iO-Aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

2012/11/27 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[...]
> diff --git a/docs/manual/adding-packages-conclusion.txt b/docs/manual/adding-packages-conclusion.txt
> index 42f1c8f..137b7c3 100644
> --- a/docs/manual/adding-packages-conclusion.txt
> +++ b/docs/manual/adding-packages-conclusion.txt
> @@ -6,7 +6,7 @@ Conclusion
>  As you can see, adding a software package to Buildroot is simply a
>  matter of writing a Makefile using an existing example and modifying it
>  according to the compilation process required by the package.
>
>  If you package software that might be useful for other people, don't
> -forget to send a patch to Buildroot developers!
> +forget to send a patch to the Buildroot mailing list!
You could add a cross-ref to the section "Contributing to Buildroot" here ;)

>
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index c8f41ff..88a4645 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -5,11 +5,11 @@ Package directory
>
>  First of all, create a directory under the +package+ directory for
>  your software, for example +libfoo+.
>
>  Some packages have been grouped by topic in a sub-directory:
> -+multimedia+, +java+, +x11r7+, and +games+. If your package fits in
> ++multimedia+, +x11r7+, +efl+ and +matchbox+. If your package fits in
>  one of these categories, then create your package directory in these.
>
>
>  +Config.in+ file
>  ^^^^^^^^^^^^^^^^
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index b05043a..ee96bc1 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -173,12 +173,12 @@ information is (assuming the package name is +libfoo+) :
>    If +HOST_LIBFOO_SITE+ is not specified, it defaults to
>    +LIBFOO_SITE+.
>    Examples: +
>      +LIBFOO_SITE=http://www.libfoosoftware.org/libfoo+ +
>      +LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/+ +
> -    +LIBFOO_SITE=git://github.com/kergoth/tslib.git+
> -    +LIBFOO_SITE=/opt/software/libfoo.tar.gz+
> +    +LIBFOO_SITE=git://github.com/kergoth/tslib.git+ +
> +    +LIBFOO_SITE=/opt/software/libfoo.tar.gz+ +
>      +LIBFOO_SITE=$(TOPDIR)/../src/libfoo/+
Well, clearly in the whole section, the example html rendering is not
so nice and should be reworked.
Something for the todo list ;)

>
>  * +LIBFOO_SITE_METHOD+ determines the method used to fetch or copy the
>    package source code. In many cases, Buildroot guesses the method
>    from the contents of +LIBFOO_SITE+ and setting +LIBFOO_SITE_METHOD+
> @@ -219,11 +219,11 @@ information is (assuming the package name is +libfoo+) :
[...]
>
>  [[legal-info-list-licenses]]
> +License abbreviations
> +---------------------
> +
>  Here is a list of the licenses that are most widely used by packages in
>  Buildroot, with the name used in the manifest file:
>
>  * +GPLv2+:
>    http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[
> @@ -84,10 +88,17 @@ Buildroot, with the name used in the manifest file:
>    GNU General Public License, version 3]
>    or (at your option) any later version;
>  * +GPL+:
>    http://www.gnu.org/licenses/gpl.html[
>    GNU General Public License] (any version);
> +* +LGPLv2+:
> +  http://www.gnu.org/licenses/old-licenses/lgpl-2.0.html[
> +  GNU Library General Public License, version 2];
> +* +LGPLv2++:
You may need to use `...` instead of +...+ here.

> +  http://www.gnu.org/licenses/old-licenses/lgpl-2.0.html[
> +  GNU Library General Public License, version 2.1]
> +  or (at your option) any later version;
>  * +LGPLv2.1+:
>    http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html[
>    GNU Lesser General Public License, version 2.1];
>  * +LGPLv2.1++:
ditto

Regards,

-- 
Samuel

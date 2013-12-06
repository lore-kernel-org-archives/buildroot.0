From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Dec 2013 09:07:31 +0100
Subject: [Buildroot] [PATCH 02/16] docs: document the new github helper
	function
In-Reply-To: <1386264059-14057-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386264059-14057-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LW50zmZe=wY0f2gtzerPSGHwtxUe-8i1cEr2AuPHCAsKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 5, 2013 at 6:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> From: Mischa Jonker <Mischa.Jonker@synopsys.com>
>
> [Thomas: splitted from Mischa original commit]
>
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/adding-packages-generic.txt | 5 +++--
>  docs/manual/adding-packages-tips.txt    | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index fb7a9e5..d82ab61 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -230,7 +230,9 @@ information is (assuming the package name is +libfoo+) :
>    URL or a local filesystem path. HTTP, FTP and SCP are supported URL
>    types for retrieving package tarballs. Git, Subversion, Mercurial,
>    and Bazaar are supported URL types for retrieving packages directly
> -  from source code management systems. A filesystem path may be used
> +  from source code management systems. There is a helper function to make
> +  it easier to download source tarballs from github (refer to
> +  xref:github-download-url[] for details). A filesystem path may be used
>    to specify either a tarball or a directory containing the package
>    source code. See +LIBFOO_SITE_METHOD+ below for more details on how
>    retrieval works. +
> @@ -244,7 +246,6 @@ information is (assuming the package name is +libfoo+) :
>    Examples: +
>      +LIBFOO_SITE=http://www.libfoosoftware.org/libfoo+ +
>      +LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/+ +
> -    +LIBFOO_SITE=git://github.com/kergoth/tslib.git+ +
>      +LIBFOO_SITE=/opt/software/libfoo.tar.gz+ +
>      +LIBFOO_SITE=$(TOPDIR)/../src/libfoo/+
>
> diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
> index 00244fe..73c25be 100644
> --- a/docs/manual/adding-packages-tips.txt
> +++ b/docs/manual/adding-packages-tips.txt
> @@ -41,11 +41,12 @@ How to add a package from github
>
>  Packages on github often don't have a download area with release tarballs.
>  However, it is possible to download tarballs directly from the repository
> -on github.
> +on github. As github is known to have changed download mechanisms in the
> +past, the 'github' helper function should be used as shown below.
>
>  ------------------------
>  FOO_VERSION = v1.0 # tag or full commit ID
> -FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
> +FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
>  ------------------------
>
>  .Notes

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

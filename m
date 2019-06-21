From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 20 Jun 2019 23:15:10 -0300
Subject: [Buildroot] [PATCH 3/4] package: remove non-conventional
 prefix/suffix from github-fetched packages
In-Reply-To: <20190612064209.23619-4-victor.huesca@bootlin.com>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612064209.23619-4-victor.huesca@bootlin.com>
Message-ID: <CAJ4jsac44dgGTkq1QZB2xqKpFutHFisBSgxu3H0pV0JMiTsPUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 12, 2019 at 3:43 AM Victor Huesca <victor.huesca@bootlin.com> wrote:
>
> On Github, a large number of projects name their tag
> <some-prefix>-0.3-<some-suffix> (i.e release-3.0, poco-0.1-release,
> etc.). In fact majority of the cased adressed in this commit concerns
> prefixes.
>
> In most packages, we encode those prefix/suffix in the <pkg>_VERSION
> variable.
>
> The problem with this approach is that when used in conjunction with
> release-monitoring.org, it doesn't work very well, because
> release-monitoring.org has the concept of "version prefix/suffix" and
> using that they drop the prefix/suffix to really get the version. For
> example on https://release-monitoring.org/project/5418/ the latest
> release of "poco" is "1.8.1", not "poco-1.8.1-release".
>
> Therefore, a number of packages in Buildroot have a version that
> doesn't match with release-monitoring.org.
>
> Since really the version number of 1.8.1, is makes sense to update our
> packages to drop these prefixes/suffixes.
>
> This commit addreses the case of github-fetched packages with
> non-conventional prefixes/suffixes.
>
> Note that these changes modify the name of the files stored in DL_DIR,
> which means that this will force a re-download of those package source
> code for all users, and requires a change to their .hash file.
>
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
[...]
> index aa96d5127b..7283447f9d 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -POCO_VERSION = poco-1.8.1-release
> -POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
> +POCO_VERSION = 1.8.1
> +POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
>  POCO_LICENSE = BSL-1.0
>  POCO_LICENSE_FILES = LICENSE
>  POCO_INSTALL_STAGING = YES

\o/ [https://patchwork.ozlabs.org/patch/726836/]

-- 
Carlos Santos <unixmania@gmail.com>

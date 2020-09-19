From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:58:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/popt: fix build without wchar
In-Reply-To: <20200919170741.532642-1-fontaine.fabrice@gmail.com>
References: <20200919170741.532642-1-fontaine.fabrice@gmail.com>
Message-ID: <20200919215828.6fb1788b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 19 Sep 2020 19:07:41 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 82442b54b640fd4fbd5677e02690346a59f6cf13 removed
> 0001-no-wchar.patch but without importing an upstream patch that
> "should" have been equivalent to our patch but resulted in a build
> failure on toolchains with wchar but without mbsrtowcs
> 
> So add a bunch of upstream patches and a new patch to fix this build
> failure
> 
> While at it, also put back 0003-glob-detection.patch which, again, has
> been upstreamed but is not in version 1.18 ...
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/27f184af35468941173628e5e847a284c0b80d73
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/popt/0002-Detect-glob_pattern_p.patch | 53 +++++++++++++
>  ...-configure-replace-deprecated-macros.patch | 76 +++++++++++++++++++
>  .../popt/0004-fix-build-without-wchar.patch   | 53 +++++++++++++
>  .../0005-fix-build-without-mbstate_t.patch    | 68 +++++++++++++++++
>  package/popt/popt.mk                          |  2 +
>  5 files changed, 252 insertions(+)
>  create mode 100644 package/popt/0002-Detect-glob_pattern_p.patch
>  create mode 100644 package/popt/0003-configure-replace-deprecated-macros.patch
>  create mode 100644 package/popt/0004-fix-build-without-wchar.patch
>  create mode 100644 package/popt/0005-fix-build-without-mbstate_t.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

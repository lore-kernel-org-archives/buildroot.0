From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 18:23:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/cups: bump to version 2.2.11
 and add gzip fix
In-Reply-To: <b2b6ccb8327f40de1bdaaf1e07b11183af5f6e92.1560836325.git.sbobroff@linux.ibm.com>
References: <b2b6ccb8327f40de1bdaaf1e07b11183af5f6e92.1560836325.git.sbobroff@linux.ibm.com>
Message-ID: <20190620182345.61c30d6a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

On Tue, 18 Jun 2019 15:38:52 +1000
Sam Bobroff <sbobroff@linux.ibm.com> wrote:

> This patch bumps cups to version 2.2.11 so that an upstream fix will
> apply cleanly.
> 
> The upstream fix corrects a build failure when GZIP is set in the
> build environment, as it is for buildroot's reproducible builds, as
> shown below:
> 
> gzip: /bin/gzip.gz: Permission denied
> gzip: /bin/gzip.gz: Permission denied
> Makefile:114: recipe for target 'install-data' failed
> 
> The patch will be included upstream in version 2.2.12.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/c4e0f6a3c79c9cb083a08f811b7d4838efef50f9/
> 
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>

I've applied, but there was an issue in the patch formatting, see below.

> diff --git a/package/cups/0005-Use-GZIPPROG-instead-of-GZIP-to-avoid-install-issues.patch b/package/cups/0005-Use-GZIPPROG-instead-of-GZIP-to-avoid-install-issues.patch
> new file mode 100644
> index 0000000000..cee4292eca
> --- /dev/null
> +++ b/package/cups/0005-Use-GZIPPROG-instead-of-GZIP-to-avoid-install-issues.patch
> @@ -0,0 +1,294 @@
> +Backported from upstream (with a slight edit to drop a changelog hunk).
> +This can be dropped after the next cups release (2.2.12).
> +
> +commit 3676fc318a458f71df76620a7e66f5c5807cf9b1
> +Author: Michael R Sweet <michael.r.sweet@gmail.com>
> +Date:   Wed Jun 12 08:37:06 2019 -0400
> +
> +    Use GZIPPROG instead of GZIP to avoid install issues (Issue #5595)
> +
> +Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>

This patch is not properly formatted: it is not formatted with "git
format-patch". In addition, putting a comment before the patch (even if
it's formatted with git format-patch) makes it impossible to apply the
patch with "git am".

The canonical way of generating such patch is:

	git cherry-pick -x 3676fc318a458f71df76620a7e66f5c5807cf9b1
	add your Signed-off-by in the commit log + any comment
	git format-patch HEAD^

I fixed it up when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

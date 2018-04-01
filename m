From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:02:45 +0200
Subject: [Buildroot] [PATCH v2 01/37] check-package: prepare to extend
 to other directories
In-Reply-To: <20180401050850.5701-2-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-2-ricardo.martincoski@gmail.com>
Message-ID: <20180401080245.1e7988a7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:14 -0300, Ricardo Martincoski wrote:
> Currently the script only checks files inside the package/ directory.
> Upcoming patches will enable it for other directories.
> 
> In order to reliably test for file names, i.e. the Config.in in the base
> directory, normalize the path of files to check to a relative path to
> the base directory.
> 
> Rename the variable that holds the compiled regexp to better represent
> its content and rearrange how it is declared to make easy to later add
> new directories to check. As a consequence the files that declare
> package infra types would not be ignored anymore, so create a new
> variable to list the files intree to be ignored during the check. The
> same variable will be used by upcoming patches to ignore other files.
> Ignore pkg-*.mk and doc-asciidoc.mk since they are package infra files.
> 
> In order to not produce weird results when used for files outside the
> tree (i.e. in a private br2-external) add an explicit command line
> option (-b) that bypasses any checks that would make a file be ignored
> by the path that contains it.
> When in this out-of-tree mode, the user is responsible for providing a
> list of files to check that do not contain files the script does not
> understand, e.g. package infra files.
> 
> As a result of this patch, besides the known use:
> $ ./utils/check-package package/new-package/*
> someone with the utils/ directory in the path can now also run:
> $ cd package/new-package/
> $ check-package *
> or
> $ check-package -b /path/to/br2-ext-tree/package/staging-package/*
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  utils/check-package | 32 +++++++++++++++++++++++++++-----
>  1 file changed, 27 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 May 2018 15:26:57 +0200
Subject: [Buildroot] [PATCH v3] core/pkg-generic: only save latest
 package list
In-Reply-To: <20180501122841.13818-1-john@metanate.com>
References: <20180501132629.4a4831bb.john@metanate.com>
 <20180501122841.13818-1-john@metanate.com>
Message-ID: <20180501152657.13c7014f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 May 2018 13:28:41 +0100, John Keeping wrote:
> When rebuilding a package, simply appending the package's file list to
> the global list means that the package list grows for every rebuild, as
> does the time taken to check for files installed by multiple packages.
> Furthermore, we get false positives where a file is reported as being
> installed by multiple copies of the same package.
> 
> With this approach we may end up with orphaned files in the target
> filesystem if a package that has been updated and rebuilt no longer
> installs the same set of files, but we know that only a clean build will
> produce reliable results.  In fact it may be helpful to identify these
> orphaned files as evidence that the build is not clean.
> 
> Signed-off-by: John Keeping <john@metanate.com>
> ---
> Changes in v3:
> - Use touch instead of redirect to avoid truncating the file

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

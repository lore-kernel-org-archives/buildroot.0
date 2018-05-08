From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:04:10 +0200
Subject: [Buildroot] [PATCH v2] busybox: S01mdev: fix module autoloading
In-Reply-To: <20180507183501.13778-1-peter@korsgaard.com>
References: <20180507183501.13778-1-peter@korsgaard.com>
Message-ID: <20180508150410.6fe1470a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 May 2018 20:35:01 +0200, Peter Korsgaard wrote:
> Commit b4fc5a180c (package/busybox: support spaces in module aliases in
> mdev) changed the mdev coldplugging to handle sysfs path elements and
> modalias values containing spaces.  This unfortunately doesn't work as was
> recently reported:
> 
> http://lists.busybox.net/pipermail/buildroot/2018-May/220903.html
> 
> The problem is that sort -z also expects the fields of the input files to be
> zero terminated, which is not the case for modalias sysfs entries.
> 
> So drop the -z option to sort.  Spaces in modalias entries could be handled
> with the xargs -d '\n' option, but that is unfortunately not supported by
> the busybox applet.  Instead, use tr to convert newlines to zeros so we can
> use xargs -0.
> 
> Reported-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/busybox/S10mdev | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

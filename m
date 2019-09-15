From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 14:56:31 +0200
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run:
 calculate dldir as an absolute path
In-Reply-To: <20190914133518.19604-1-thomas.petazzoni@bootlin.com>
References: <20190914133518.19604-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190915145631.24eb1801@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Sep 2019 15:35:18 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Right now, self.dldir is a relative path, equal to
> "instance-X/dl". Then, the Buildroot build is executed with
> BR2_DL_DIR=self.dldir, which means that self.dldir is interpreted
> relatively to the Buildroot source directory.
> 
> Due to this, we get the following directory organization:
> 
>  instance-0
>   + buildroot
>     + instance-0
>       + dl
>   + instance.log
>   + output
> 
> Instead of the excepted organization:
> 
>  instance-0
>  + buildroot
>  + dl
>  + instance.log
>  + output
> 
> We fix this issue (which was introduced when the Builder class was
> created) by making self.dldir an absolute path.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  scripts/autobuild-run | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to buildroot-test.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

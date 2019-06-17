From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 20:06:09 +0200
Subject: [Buildroot] [PATCH v5 1/4] autobuild-run: move creation of
 result directory to run_instance()
In-Reply-To: <20190617093456.6110-1-itsatharva@gmail.com>
References: <20190617093456.6110-1-itsatharva@gmail.com>
Message-ID: <20190617200609.4276a61a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jun 2019 15:04:53 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> We need the result directory to be present when the check_reproducibility()
> function (implemented in the next patch) executes. As of now the results
> directory is created in the send_results() function which executes after
> check_reproducibility() will.
> 
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> ---
> Changes v4: Add new patch to series
> ---
>  scripts/autobuild-run | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

I have applied the series to buildroot-test, thanks!

One thing I was not a big fan of was PATCH 1/4, perhaps the
check_reproducibility() should have stored its result in some other
place, and keep the send_result() function to collect all the result
artifacts into the results/ folder. But since it's a minor detail and
we want to move forward with this, I applied as-is.

I have just restarted the Bootlin autobuilder machine with this new
version of autobuild-run, we'll see what happens :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

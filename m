From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 23:35:13 +0100
Subject: [Buildroot] [PATCH] package/pkg-python: use _CONFIGURE_OPTS for
 build env
In-Reply-To: <20191205231103.27778-1-ryan.barnett@rockwellcollins.com>
References: <20191205231103.27778-1-ryan.barnett@rockwellcollins.com>
Message-ID: <20191206233513.5f6260d7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Dec 2019 17:11:02 -0600
Ryan Barnett <ryan.barnett@rockwellcollins.com> wrote:

> When building host or target python packages, we need to ensure that
> the build environment utilize {HOST|TARGET}_CONFIGURE_OPTS. This
> ensures that the correct linker and compiler environment variables are
> set to compile utilizing either the host or target folders.
> 
> It was discovered that when compiling a host-python package, it was
> using linking against the build machines library folder instead of the
> host folder because LDFLAGS was not properly set and was improperly
> detecting whether or not a shared or static library was present in the
> host folder.
> 
> CC: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> 
> ---
> Changes v1 -> v2:
>   - Merged HOST/TARGET_CONFIGURE_OPTS to single commit (suggested by
>       Arnout)
>   - Added HOST/TARGET_CONFIGURE_OPTS to env for setuptools (suggested
>       by Arnout)
> ---
>  package/pkg-python.mk | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

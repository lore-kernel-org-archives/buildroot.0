From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:58:53 +0200
Subject: [Buildroot] [PATCH v3 1/2] ccache: change default cache
 directory path to match config setting
In-Reply-To: <1398909907-1847-1-git-send-email-danomimanchego123@gmail.com>
References: <1398909907-1847-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140614195853.35c35d29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Wed, 30 Apr 2014 22:05:06 -0400, Danomi Manchego wrote:
> Commit 433290761fceb476b095548eec10adf72405e050 changed the hard-coded
> ccache directory location to use BR_CACHE_DIR (then BUILDROOT_CACHE_DIR),
> which is exported by Makefile based on the BR2_CCACHE_DIR config option.
> This allowed the cache location to be changed on-the-fly by setting a
> "make" command line variable, but left the default location of ccache's
> normal default at "$HOME/.ccache".  Since this location does not match the
> default for BR2_CCACHE_DIR, it is basically almost never correct, so
> direct invocation of ccache outside of the buildroot Makefile, such as for
> increasing the cache size, becomes cumbersome.
> 
> This patch changes the last-ditch cache location from "$HOME/.ccache" to
> the BR_CCACHE_DIR value defined when host-ccache is configured.  Note that
> the ability to later override the cache location by using a BR_CACHE_DIR
> command line variable is left intact.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

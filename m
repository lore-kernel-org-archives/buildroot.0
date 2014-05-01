From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 01 May 2014 07:52:47 +0200
Subject: [Buildroot] [PATCH v3 1/2] ccache: change default cache
	directory	path to match config setting
In-Reply-To: <1398909907-1847-1-git-send-email-danomimanchego123@gmail.com>
References: <1398909907-1847-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <e257628d-8ab3-488b-9f07-be3c5c829e85@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi Manchego <danomimanchego123@gmail.com> schreef:
>Commit 433290761fceb476b095548eec10adf72405e050 changed the hard-coded
>ccache directory location to use BR_CACHE_DIR (then BUILDROOT_CACHE_DIR),
>which is exported by Makefile based on the BR2_CCACHE_DIR config option.
>This allowed the cache location to be changed on-the-fly by setting a
>"make" command line variable, but left the default location of ccache's
>normal default at "$HOME/.ccache".  Since this location does not match the
>default for BR2_CCACHE_DIR, it is basically almost never correct, so
>direct invocation of ccache outside of the buildroot Makefile, such as for
>increasing the cache size, becomes cumbersome.
>
>This patch changes the last-ditch cache location from "$HOME/.ccache" to
>the BR_CCACHE_DIR value defined when host-ccache is configured.  Note that
>the ability to later override the cache location by using a BR_CACHE_DIR
>command line variable is left intact.
>
>Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

You  should have pasted my review and test tags here...

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by : Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

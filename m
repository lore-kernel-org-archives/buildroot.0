From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Aug 2016 23:55:20 +0200
Subject: [Buildroot] [PATCHv2] Revert "Added local directory as source
	of kernel code"
In-Reply-To: <1472338984-3588-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 28 Aug 2016 01:03:04 +0200")
References: <1472338984-3588-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87eg588son.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This reverts commit 73da2ff6f718f2889e3c5024d899f8d58f502863.
 > The reason for adding support for a local location was to be able to do
 > development on the Linux kernel source tree on a local directory rather
 > than have to clone it for every build.

 > We already have a mechanism for that, it's called override-srcdir. It's
 > been available since September 2011, more than a year before this patch
 > was committed.

 > Otherwise, we're going to be adding support for local sources in other
 > packages. First was U-Boot as submitted by Adam. But what next? We can't
 > have such support for all packages, especially since override-srcdir
 > does the job.

 > Besides, using a local source tree makes the build non-reproducible, so
 > we don't really want to have this in a .config (or defconfig).

 > We only handle the boolean option in legacy, as there is nothing we can
 > do with the directory path.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Rafal Fabich <rafal.fabich@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Adam Duskett <aduskett@gmail.com>

 > ---
 > Changes v1 -> v2:
 >   - add legacy handling  (Thomas)
 >   - don't change the local tarball version handling in linux.mk
 >     (Thomas)

 > ---
 > Rafal, if your use-case was just to use a local tree for development
 > purposes, please see to using the override-srcdir mechanism instead.
 > If you had another use-case that requires using a local source tree,
 > could you explain it, please? Thanks!
 > ---
 >  Config.in.legacy | 12 ++++++++++++
 >  linux/Config.in  | 13 -------------
 >  linux/linux.mk   |  3 ---
 >  3 files changed, 12 insertions(+), 16 deletions(-)

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 746b80a..dafaf40 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -143,6 +143,18 @@ comment "----------------------------------------------------"
 >  endif
 
 >  ###############################################################################
 > +comment "Legacy options removed in 2016.11"
 > +
 > +config BR2_LINUX_KERNEL_CUSTOM_LOCAL
 > +	bool "Linux kernel local directory option removed"
 > +	help
 > +	  The option to select a local ditrectory as the source of the Linux

s/ditrectory/directory/

Committed to next with that fixed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 

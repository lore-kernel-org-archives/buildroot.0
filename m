From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 15:57:02 +0100
Subject: [Buildroot] [git commit] libffi: switch to using a Git version,
	brings Microblaze and Xtensa support
Message-ID: <20130205150055.C510A9A987@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddd69b5609cc9bd954afcfc2f91831d64b9cfff7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We already had backported patches for the Blackfin and AArch64
support, and now we would have needed to also backport the Xtensa
support and the Microblaze support. This starts to get crazy.

Let's switch to using a Git version from Github, until libffi finally
releases a new stable version.

In order to achieve this, we also need to:

 * autoreconf the package, so that a libffi.pc file gets generated

 * manually install the libffi.pc file, because it doesn't get
   installed by libffi Makefile, for some reason

 * remove the part of the target post install hook that was messing
   with libffi.pc, since it was modifying the one in STAGING_DIR
   (which is odd for a target post install hook), and the libffi.pc
   file is anyway not installed to the target anymore.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libffi-0001-Add-support-for-Blackfin.patch     | 1044 ---------
 ...fi-0002-Add-aarch64-support-from-upstream.patch | 2326 --------------------
 package/libffi/libffi.mk                           |   29 +-
 3 files changed, 23 insertions(+), 3376 deletions(-)

Patch is too large, so refusing to show it

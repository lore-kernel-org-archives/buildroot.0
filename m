From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Fri, 9 Mar 2012 10:07:29 -0300
Subject: [Buildroot] [RFC] Request for comment for branch
	for-2012.05/misc-cleanups
In-Reply-To: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <CAAAP30GZZM5F=f_iHZwUs+rgDGvHUgvFLm_Wdo7DLc4J1yQX3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I think the pkg-* makefiles could be moved from the packages directory
as they are used by the kernel and bootloaders as well.
Maybe move them to the support directory.

On Wed, Mar 7, 2012 at 4:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Here is a set of proposal that cleanup/re-organize a few parts of our
> main Makefiles. This is just the beginning of a cleanup of Makefile,
> package/Makefile.in and some other core parts of the
> infrastructure. Before going further, I'd like to see if the direction
> I'm taking is something that is considered to be useful and
> interesting.
>
> This set of patches is at the Request For Comment state, they are not
> yet intended to be committed, I need to do some further testing. The
> purpose is really to get some early feedback about them.
>
> Thanks,
>
> Thomas
>
> The following changes since commit b50f7a832de2801aeee33146ff5a81945f4078c2:
>
> ?barebox: fix 2012.03 typo (2012-03-07 16:26:50 +0100)
>
> are available in the git repository at:
> ?git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/misc-cleanups
>
> Thomas Petazzoni (13):
> ? ? ?Remove the DATE variable
> ? ? ?Remove cc-option: not used anywhere
> ? ? ?Remove filename extension crap for OS compatibility
> ? ? ?kconfig: do not use HOST_LOADLIBES anymore
> ? ? ?Rename Makefile.autotools.in to pkg-autotargets.mk
> ? ? ?Rename Makefile.cmake.in to pkg-cmaketargets.mk
> ? ? ?Split Makefile.package.in in pkg-download.mk, pkg-utils.mk and pkg-gentargets.mk
> ? ? ?pkg-*.mk: add some comments, update some existing comments
> ? ? ?Remove unused .fakeroot.* mechanism
> ? ? ?Move the manual build infrastructure to docs/manual/manual.mk
> ? ? ?cmake: move creation of toolchain file to package/pkg-cmaketargets.mk
> ? ? ?package: remove unused STRIP_DISCARD_ALL variable
> ? ? ?package: move autotools specific stuff to pkg-autotargets.mk
>
> ?Makefile ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? | ?108 +---
> ?boot/uboot/uboot.mk ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? ?1 -
> ?docs/manual/manual.mk ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? 48 ++
> ?fs/common.mk ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? | ? ?2 -
> ?fs/iso9660/iso9660.mk ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? ?2 -
> ?package/Makefile.in ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ? 83 +--
> ?package/Makefile.package.in ? ? ? ? ? ? ? ? ? ? ? ?| ?746 --------------------
> ?.../{Makefile.autotools.in => pkg-autotargets.mk} ?| ? 74 ++-
> ?package/{Makefile.cmake.in => pkg-cmaketargets.mk} | ? 22 +
> ?package/pkg-download.mk ? ? ? ? ? ? ? ? ? ? ? ? ? ?| ?221 ++++++
> ?package/pkg-gentargets.mk ? ? ? ? ? ? ? ? ? ? ? ? ?| ?456 ++++++++++++
> ?package/pkg-utils.mk ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? | ? 85 +++
> ?support/kconfig/Makefile.br ? ? ? ? ? ? ? ? ? ? ? ?| ? ?4 +-
> ?support/kconfig/patches/10-br-build-system.patch ? | ? 12 +-
> ?14 files changed, 917 insertions(+), 947 deletions(-)
> ?create mode 100644 docs/manual/manual.mk
> ?delete mode 100644 package/Makefile.package.in
> ?rename package/{Makefile.autotools.in => pkg-autotargets.mk} (85%)
> ?rename package/{Makefile.cmake.in => pkg-cmaketargets.mk} (86%)
> ?create mode 100644 package/pkg-download.mk
> ?create mode 100644 package/pkg-gentargets.mk
> ?create mode 100644 package/pkg-utils.mk
>
> Thanks,
> --
> Thomas Petazzoni
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

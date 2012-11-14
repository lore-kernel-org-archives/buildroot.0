From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:58:17 +0100
Subject: [Buildroot] [git commit] libtirpc: add patches to fix a number of
	issues
Message-ID: <20121114220320.8968099FD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18828103cdc8b929b29f5cbc27cd771ab1a26326
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libtirpc-0005-rpcent-mark-getrpcbyname-name-argument-as-const-char.patch
fixes build failures like
http://autobuild.buildroot.org/results/7a3a751fe02c639ca75c575ca7fe20a72372b8d6/build-end.log.

libtirpc-0006-rpcent-remove-prototypes-of-reentrant-variants.patch
ensures that functions not implemented by libtirpc are not described
in a header file. It also allows to remove those prototypes that were
not matching the functions available in glibc or uClibc, causing
mismatch in prototypes.

libtirpc-0007-doc-Makefile.am-fix-out-of-tree-installation.patch is a
minor fix.

The following patches (8 to 9) allow libtirpc to provide sufficient
things to be able to build rpcbind on top of it.

All these patches have been submitted upstream on the libtirpc-devel@
mailing list.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-getrpcbyname-name-argument-as-const-char.patch |   43 +
 ...t-remove-prototypes-of-reentrant-variants.patch |   33 +
 ...-Makefile.am-fix-out-of-tree-installation.patch |   24 +
 ...Add-rpcgen-program-from-nfs-utils-sources.patch | 6504 ++++++++++++++++++++
 ...ly-generate-XDR-header-files-from-.x-sour.patch |  999 +++
 ...R-files-needed-to-build-rpcbind-on-top-of.patch | 1649 +++++
 6 files changed, 9252 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it

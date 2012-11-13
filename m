From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 07:47:41 +0100
Subject: [Buildroot] [PATCH 03/11] libtirpc: add patches to fix a number
 of issues
In-Reply-To: <56daf58a13bf6cc3b2e2f696c961c9f3a8de21ce.1352583641.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352583641.git.thomas.petazzoni@free-electrons.com>
 <56daf58a13bf6cc3b2e2f696c961c9f3a8de21ce.1352583641.git.thomas.petazzoni@free-electrons.com>
Message-ID: <50A1ED0D.5020104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/11/12 22:42, Thomas Petazzoni wrote:
> libtirpc-0005-rpcent-mark-getrpcbyname-name-argument-as-const-char.patch
> fixes build failures like
> http://autobuild.buildroot.org/results/7a3a751fe02c639ca75c575ca7fe20a72372b8d6/build-end.log.
>
> libtirpc-0006-rpcent-remove-prototypes-of-reentrant-variants.patch
> ensures that functions not implemented by libtirpc are not described
> in a header file. It also allows to remove those prototypes that were
> not matching the functions available in glibc or uClibc, causing
> mismatch in prototypes.
>
> libtirpc-0007-doc-Makefile.am-fix-out-of-tree-installation.patch is a
> minor fix.
>
> The following patches (8 to 9) allow libtirpc to provide sufficient
> things to be able to build rpcbind on top of it.
>
> All these patches have been submitted upstream on the libtirpc-devel@
> mailing list.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

  After a quick browse:
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested)

  I would have split up the rpcbind things as a separate commit, but that's
a minor detail.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

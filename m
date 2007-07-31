From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Tue, 31 Jul 2007 22:24:53 +0200 (CEST)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
 target/device/Atmel targe etc...
In-Reply-To: <20070731161525.GB9378@aon.at>
References: <20070731145959.C5111A4595@busybox.net>
	<20070731161525.GB9378@aon.at>
Message-ID: <0707312219520.11633@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 Jul 2007, Bernhard Fischer wrote:

> You broke using snapshots.
>
> []
> bzcat /tmp/buildroot_trunk/.down/uClibc-snapshot.tar.bz2 | tar -C /tmp/buildroot_trunk/toolchain_build_i386   -xf -
> toolchain/patch-kernel.sh /tmp/buildroot_trunk/toolchain_build_i386/uClibc  uClibc.\*.patch
> Aborting.  'uClibc.*.patch' is not a directory.

Even non-snapshots are broken :(  This seems to be the place where it
happens:

,----
| ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
| 	toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) uClibc-$(UCLIBC_OFFICIAL_VERSION)-\*.patch
| else
| 	toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) uClibc.\*.patch
| endif
`----

Reversing $(UCLIBC_PATCH_DIR) to toolchain/uClibc/ unbreaks it.


Cheers,

-- 
Cristian

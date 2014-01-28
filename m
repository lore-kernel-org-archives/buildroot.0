From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 22:56:52 +0100
Subject: [Buildroot] [PATCH 3/5] linux: ensure buildroot_defconfig is
	writable
In-Reply-To: <f5a33ad538e2632b1a6517d7f2fa5e3a35909713.1390939719.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 28 Jan 2014 21:11:23 +0100")
References: <cover.1390939719.git.yann.morin.1998@free.fr>
 <f5a33ad538e2632b1a6517d7f2fa5e3a35909713.1390939719.git.yann.morin.1998@free.fr>
Message-ID: <8738k722jf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > If $(KERNEL_SOURCE_CONFIG) is read-only (eg. because Buildroot's source
 > dir is), the rm of $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig will
 > either fail, or prompt the user, both of which we want to avoid.

 > Make it writable by using $(INSTALL).

 > Fixes: #4363
 > Signed-off-by: Nathan Lynch <ntl@pobox.com>
 > [yann.morin.1998 at free.fr: use $(INSTALL) instead of cp, don't 'rm -f']
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard

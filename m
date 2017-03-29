From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Mar 2017 06:41:21 +0200
Subject: [Buildroot] [PATCH 4/5] package/mesa3d: explicitely disable asm
References: <20170326162853.3022-1-romain.naour@gmail.com>
 <20170326162853.3022-4-romain.naour@gmail.com>
Message-ID: <hgqrqdxivc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 26 Mar 2017 18:28:52 +0200 schrieb Romain Naour:

> assembly are enabled by default on supported plaforms even while
> crosscompiling if host == target:
> 
> checking whether to enable assembly... yes, x86_64
> 
> It was also disabled in the mesa package in Fedora since 7.6 [1].
> 
> [1] http://pkgs.fedoraproject.org/cgit/rpms/mesa.git/commit/?id=629c8726

Hi,

I am unsure about this patch, why shouldn't we use asm code when 
crosscompiling for host == target CPU?
Fedora disabled it due to problems with selinux, Gentoo did something 
similar: https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/mesa/
mesa-17.0.2.ebuild#n302.
Debian disabled asm only for x32: https://anonscm.debian.org/git/pkg-xorg/
lib/mesa.git/tree/debian/rules?h=debian-experimental#n111

Regards, Bernd

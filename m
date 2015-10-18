From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 21:05:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/libdcadec: Add -fPIC to static
 build, enable shared build
In-Reply-To: <1445184515-6049-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445184515-6049-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151018210520.0c6971da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 18 Oct 2015 18:08:35 +0200, Bernd Kuhls wrote:
> Adding -fPIC fixes
> http://autobuild.buildroot.net/results/a19/a19023e094cbed491444665d6839a9e65a8eee6c/
> http://autobuild.buildroot.net/results/98d/98dde028d1d6199f05c904b498bc39bbaa112aa6/
> http://autobuild.buildroot.net/results/4ff/4ffcae6cae419df35e8ca29d429ee178bcf31882/
> http://autobuild.buildroot.net/results/8ce/8ced16874255ace4923f6b8888c3fca07f28b804/

None of these configurations have BR2_STATIC_LIBS=y, so I fail to see
why adding -fPIC when BR2_STATIC_LIBS=y would fix those issues.

Moreover, using -fPIC for statically linked configurations generally
doesn't make sense: the point of PIC code is to be Position
Independent, which is needed for shared libraries. But not for
statically linked programs.

> The upstream Makefile also allows building a shared library if
> CONFIG_SHARED=1 is added to _BUILD_CMDS.

This probably fixes the problem however.

So, can you explain the addition of -fPIC for BR2_STATIC_LIBS=y
configurations?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

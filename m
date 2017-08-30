From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:49:10 +0200
Subject: [Buildroot] [PATCH 3/7] package/mesa3d: fix build issue with
 glibc >= 2.26
In-Reply-To: <20170827173606.13144-4-romain.naour@gmail.com>
References: <20170827173606.13144-1-romain.naour@gmail.com>
 <20170827173606.13144-4-romain.naour@gmail.com>
Message-ID: <20170830224910.048d0e59@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Aug 2017 19:36:02 +0200, Romain Naour wrote:

> ++/* This workaround is not necessary since Glibc 2.26
> ++ * https://sourceware.org/git/?p=glibc.git;a=commit;h=2072f5c34ede81dde9e0d953d57a0690a66b0f12
> ++ */
> ++#if (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 25)

How does this behaves with uClibc and musl? I guess with uClibc it
should be fine, because it pretends to be glibc 2.2.

However, musl doesn't define __GLIBC__, so it means that this code,
that used to be defined for musl, we no longer be defined. Can check if
mesa3d still builds fine with musl after this change ? Or perhaps musl
didn't had the original issue ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

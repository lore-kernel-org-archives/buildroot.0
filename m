From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:43:53 +0200
Subject: [Buildroot] [PATCH] Revert "package/parted: disable on uclibc"
In-Reply-To: <20200527095058.wdnaekjl46vzmrny@waldemar-brodkorb.de>
References: <20200527095058.wdnaekjl46vzmrny@waldemar-brodkorb.de>
Message-ID: <20200829214353.4d522418@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 May 2020 11:50:58 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> This reverts commit 25b1dc4613326b1b2674ab07484993991ab90886.
> 
> This is fixed in uClibc-ng 1.0.34.

In fact, it was fixed in uClibc-ng 1.0.33, not 1.0.34.

I was initially a bit puzzled because both Buildroot 2019.11 and
Buildroot 2020.02 are using uClibc-ng 1.0.32, and parted was failing to
build with a Buildroot 2019.11 toolchain, but not a 2020.02 toolchain.
Turned out we had backported the fix in 2020.02 on top of uClibc-ng
1.0.32.

Anyway, I've applied your patch to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

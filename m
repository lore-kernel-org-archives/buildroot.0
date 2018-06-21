From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jun 2018 14:45:43 +0200
Subject: [Buildroot] [RFC PATCH v4 8/9] lld: new package
In-Reply-To: <CAMWSM7hzA-hz5sAcpanoYQKYmX_eu-bro6zZDm0GEgDC=nNQjw@mail.gmail.com>
References: <20180610205417.13963-1-joseph.kogut@gmail.com>
 <20180614224820.27126-1-joseph.kogut@gmail.com>
 <20180614224820.27126-9-joseph.kogut@gmail.com>
 <20180615230106.0bebcbb3@windsurf>
 <CAMWSM7hzA-hz5sAcpanoYQKYmX_eu-bro6zZDm0GEgDC=nNQjw@mail.gmail.com>
Message-ID: <20180621144543.681def58@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Jun 2018 12:14:25 -0700, Joseph Kogut wrote:

> After looking over this package again, I'm thinking it should be host
> only. Without a compiler on the target, a linker really doesn't have
> any utility.

Indeed, I missed this obvious aspect when reviewing the package.

> Also, the LLVM project claims drop-in compatibility and much better
> performance with LLD compared to GNU ld/gold, so I'm curious how using
> LLD as the default linker would affect build times. I'll do some
> experiments.

Having support for using llvm/clang/lld as a toolchain replacement was
discussed, and it was on Valentin's radar. It would definitely be
interesting to see some progress in this area, even though I believe it
will be tricky as I'm sure a large number of packages will not build
nicely with clang, the Linux kernel being an important package falling
into this category.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

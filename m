From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:55:33 +0100
Subject: [Buildroot] [PATCH] perl-cross: bump to version 0.9.4
In-Reply-To: <1415986289-22531-1-git-send-email-francois.perrad@gadz.org>
References: <1415986289-22531-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20141118235533.141fba60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Fri, 14 Nov 2014 18:31:29 +0100, Francois Perrad wrote:
> this release fixes the build when BR2_PREFER_STATIC_LIB
> see http://autobuild.buildroot.net/results/057/057a4b9976fd6b9c5cddd117a3f29de51efe719f/build-end.log
> see https://github.com/arsv/perl-cross/issues/11
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

I tested, it indeed fixes this problem. However, specifically with this
toolchain, it fails down the road when linking the final perl
executable due to the uClibc bug where some symbols such as setregid()
and others are defined in both libc.a and libpthread.a. This issue has
nothing to do with perl and should be solved separately.

Therefore, since your patch fixes (partly) an autobuilder issue, I've
applied it to the master branch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

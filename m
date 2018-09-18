From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 11:20:55 +0200
Subject: [Buildroot] [PATCH] libaio: Fix library creation for ARC with
 -Os
In-Reply-To: <20180918111506.0648d78c@windsurf>
References: <20180917204329.15787-1-abrodkin@synopsys.com>
 <20180918093604.0b421d5c@windsurf>
 <c9ec03f9f05e251fd8e7b99c0ffb06593db32b1c.camel@synopsys.com>
 <20180918111506.0648d78c@windsurf>
Message-ID: <20180918112055.66612b12@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Sep 2018 11:15:06 +0200, Thomas Petazzoni wrote:

> And I believe the reason is because -nostdlib -nostartfiles are used.
> Why is libaio using those flags? Is there a good reason ?

BTW: https://patchwork.openembedded.org/patch/106979/. It is still
there in their tree:

  https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-extended/libaio/libaio/system-linkage.patch

In Debian:

  https://sources.debian.org/patches/libaio/0.3.111-1/01_link_libs.patch/

In Gentoo:

  https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-libs/libaio/files/libaio-0.3.110-link-stdlib.patch

Perhaps we should use the same solution, and submit it upstream :-)

I looked at the Git history of libaio, and the first import of libaio
already had those flags, so there is no useful Git commit information
to explain those flags.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

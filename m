From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 15:57:39 +0200
Subject: [Buildroot] [PATCH] ltp-testsuite: Fix uClibc build with
 disabled fts.h support
In-Reply-To: <20190417135458.15505-1-Nikita.Sobolev@synopsys.com>
References: <20190417135458.15505-1-Nikita.Sobolev@synopsys.com>
Message-ID: <20190417155739.7d8ee316@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nikita,

On Wed, 17 Apr 2019 16:54:58 +0300
Nikita Sobolev <Nikita.Sobolev@synopsys.com> wrote:

> Add patch, that fixes build on uClibc with disabled fts.h support
> and MUSL, which does not have fts.h at all.

Then shouldn't the patch also remove the:

	depends on !BR2_TOOLCHAIN_USES_MUSL

from package/ltp-testsuite/Config.in ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

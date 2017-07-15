From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 15 Jul 2017 00:07:53 -0300
Subject: [Buildroot] [PATCH 2/2] support/testing: add test of BR2_CCACHE
 with an external toolchain
References: <20170710204007.8402-2-arnout@mind.be>
Message-ID: <59698709710e0_a573fd7a88dac88568f3@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Jul 10, 2017 at 05:40 PM, Arnout Vandecappelle (Essensium/Mind) wrote:

> We reuse TestExternalToolchainBuildrootuClibc and add ccache to its
> configuration.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[snip]
> +        self.config = self.config + self.extraconfig.format(builddir = self.builddir)

3 nits:
- why not += ?
- usually there are no spaces around parameter equals
- line is too long (not that much)
from these I suggest to change to:
        self.config += self.extraconfig.format(builddir=self.builddir)

> +
> -- 

nit: This empty line at end of file is not needed.

with the 4 nits fixed
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

[the test passes, host-ccache is built either with or without ccache
 pre-installed in the host machine, the ccache dir is created inside the
 builddir and has valid data inside:
 $ cd ${builddir} && host/bin/ccache -s
 ...
 cache size                          13.1 MB
 max cache size                       5.0 GB]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo

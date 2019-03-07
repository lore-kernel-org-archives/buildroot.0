From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 21:24:37 +0100
Subject: [Buildroot] [PATCH] package/python3: require util-linux'
 <uuid.h>
In-Reply-To: <e5b1510a81bda096dacc133276f1ff2643131dcc.1551975775.git.jan.kundrat@cesnet.cz>
References: <e5b1510a81bda096dacc133276f1ff2643131dcc.1551975775.git.jan.kundrat@cesnet.cz>
Message-ID: <20190307212437.22ce6f91@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan,

On Thu, 7 Mar 2019 17:23:36 +0100
Jan Kundr?t <jan.kundrat@cesnet.cz> wrote:

> Without this dependency, a top level parallel build fails for me (-j24):

Is this with the per-package directory patch set applied, or top-level
parallel build with the Buildroot master (which is a totally
unsupported configuration) ?

> I *suspect* that this is due to host-uboot-tools which provide
> /usr/include/uuid.h and which gets accidentally picked by python3.

I think we need a better understanding of why this would be needed.
host-python3 builds just fine in minimal chroot that does not have
libuuid-dev installed, otherwise the autobuilders would be full of
host-python3 build failures.

So we need more research and a more convincing explanation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

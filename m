From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 12:30:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: crypto support needs
 linux-headers
In-Reply-To: <20200811091917.1545019-1-fontaine.fabrice@gmail.com>
References: <20200811091917.1545019-1-fontaine.fabrice@gmail.com>
Message-ID: <20200811123010.4355db2a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 11 Aug 2020 11:19:17 +0200
Fabrice Fontaine via buildroot <buildroot@busybox.net> wrote:

> crypto support needs linux-headers as it includes <linux/hash_info.h>
> since version 2.1.2 and
> https://github.com/sigma-star/mtd-utils/commit/a739b59efe7996e3bdcbe8b17743dc05ac7c110a
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/dbaeed9e9e2af191166808d2d6d6d3c2e5051c2c

You can't do that, as linux-headers is only used for the internal
toolchain backend. Also the kernel headers are already present in all
toolchains, so how could this change anything ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

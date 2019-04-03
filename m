From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 09:31:14 +0200
Subject: [Buildroot] [PATCH v4 1/2] arch: add support for Andes
 32-bit(nds32)
In-Reply-To: <20190402072340.17989-2-nylon7@andestech.com>
References: <20190402072340.17989-1-nylon7@andestech.com>
 <20190402072340.17989-2-nylon7@andestech.com>
Message-ID: <20190403093114.6f6b3108@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nylon,

Thanks for this contribution!

On Tue, 2 Apr 2019 15:23:39 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> This commit provides basic support for the Andes 32-bit(nds32) architecture.
> 
> Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
> Signed-off-by: Greentime Hu <greentime@andestech.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>

If we are adding a new architecture, we will need to test it in our
autobuilders (http://autobuild.buildroot.org). Are you ready to spend
some time to look at the build failures, and fix the ones that are
related to the nds32 architecture ?

To make such testing happen, we will need to add a toolchain
configuration in support/config-fragments/autobuild/, and add it in
support/config-fragments/autobuild/toolchain-configs.csv.

This toolchain configuration can directly point to the pre-built
toolchain you are using in PATCH 2/2.

Or, perhaps better, this pre-built toolchain can be added as a proper
package in toolchain/toolchain-external/, and then both the defconfig
and the autobuilder configuration can use it.

What do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

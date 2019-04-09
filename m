From: Nylon Chen <nylon7@andestech.com>
Date: Tue, 9 Apr 2019 17:26:56 +0800
Subject: [Buildroot] [PATCH v4 1/2] arch: add support for Andes
 32-bit(nds32)
In-Reply-To: <20190403093114.6f6b3108@windsurf>
References: <20190402072340.17989-1-nylon7@andestech.com>
 <20190402072340.17989-2-nylon7@andestech.com>
 <20190403093114.6f6b3108@windsurf>
Message-ID: <20190409092655.GA31353@app09>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 03, 2019 at 03:31:14PM +0800, Thomas Petazzoni wrote:
Hello Thomas, all
> Hello Nylon,
> 
> Thanks for this contribution!
> 
> On Tue, 2 Apr 2019 15:23:39 +0800
> Nylon Chen <nylon7@andestech.com> wrote:
> 
> > This commit provides basic support for the Andes 32-bit(nds32) architecture.
> > 
> > Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
> > Signed-off-by: Greentime Hu <greentime@andestech.com>
> > Signed-off-by: Nylon Chen <nylon7@andestech.com>
> 
> If we are adding a new architecture, we will need to test it in our
> autobuilders (http://autobuild.buildroot.org). Are you ready to spend
> some time to look at the build failures, and fix the ones that are
> related to the nds32 architecture ?
> 
no problem, I'll help as mush as i can
> To make such testing happen, we will need to add a toolchain
> configuration in support/config-fragments/autobuild/, and add it in
> support/config-fragments/autobuild/toolchain-configs.csv.
> 
> This toolchain configuration can directly point to the pre-built
> toolchain you are using in PATCH 2/2.
> 
> Or, perhaps better, this pre-built toolchain can be added as a proper
> package in toolchain/toolchain-external/, and then both the defconfig
> and the autobuilder configuration can use it.
> 
> What do you think ?
>
Thank you for your comment.
 
We prefer add toolchain/toolchain-external/toolchain-external-andes-nds32....

So we will submit these items in the next patch(v5).

1.add toolchain/toolchain-external/toolchain-external-andes-nds32
							+-- Config.in
							+-- Config.in.options
							+-- toolchain-external-andes-nds32.hash
							+-- toolchain-external-andes-nds32.mk
2.add support/config-fragments/autobuild
				+--toolchain-configs.csv
				+--andes-nds32.config
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

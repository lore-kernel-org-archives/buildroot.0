From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 21:19:49 +0200
Subject: [Buildroot] Can we update NodeJS package to 0.12.*
In-Reply-To: <B9FA34E87D998B44A9DFD1535DEAC39C4870891C@BBYEXM01.pmc-sierra.internal>
References: <B9FA34E87D998B44A9DFD1535DEAC39C4870891C@BBYEXM01.pmc-sierra.internal>
Message-ID: <20150413211949.34856da8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear George Chen,

On Mon, 13 Apr 2015 16:05:59 +0000, George Chen wrote:
> Current 2015.03 buildroot contains NodeJS 0.10.36
> 
> Is there a way to customly configure the package to 0.11.* or 0.12.*?

Well, just adjust nodejs.mk. And then, send a patch to the Buildroot
mailing list, so that we can integrate this update in the official
Buildroot.

> The reason for the newer NodeJS version is that IPv6 is not fully supported in 0.10.*
> 
> I tried to change Config.mk

I guess you meant nodejs.mk here.

> 
> - NODEJS_VERSION = 0.10.36 
> + NODEJS_VERSION = 0.12.0
> 
> However, I am getting the make error:
> 
> ../deps/v8/src/base/atomicops_internals_arm_gcc.h:258:4: error: #error "Your CPU's ARM architecture is not supported yet"

For which ARM target are you trying to build?

> Is my only option to add NodeJS 0.12.0 as a custom package?

Why would you want to add another package? Just improve the existing
nodejs package.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 15 Apr 2015 10:02:09 +0200
Subject: [Buildroot] Can we update NodeJS package to 0.12.*
In-Reply-To: <20150413211949.34856da8@free-electrons.com>
References: <B9FA34E87D998B44A9DFD1535DEAC39C4870891C@BBYEXM01.pmc-sierra.internal>
 <20150413211949.34856da8@free-electrons.com>
Message-ID: <1429084929.2051.4.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello George, Thomas,

On Mo, 2015-04-13 at 21:19 +0200, Thomas Petazzoni wrote:
> Dear George Chen,
> 
> On Mon, 13 Apr 2015 16:05:59 +0000, George Chen wrote:
> > Current 2015.03 buildroot contains NodeJS 0.10.36
> > 
> > Is there a way to customly configure the package to 0.11.* or 
> > 0.12.*?
> 
> Well, just adjust nodejs.mk. And then, send a patch to the Buildroot
> mailing list, so that we can integrate this update in the official
> Buildroot.
> 
> > The reason for the newer NodeJS version is that IPv6 is not fully 
> > supported in 0.10.*
> > 
> > I tried to change Config.mk
> 
> I guess you meant nodejs.mk here.
> 
> > 
> > - NODEJS_VERSION = 0.10.36 
> > + NODEJS_VERSION = 0.12.0
> > 
> > However, I am getting the make error:
> > 
> > ../deps/v8/src/base/atomicops_internals_arm_gcc.h:258:4: error: 
> > #error "Your CPU's ARM architecture is not supported yet"
> 
> For which ARM target are you trying to build?

The V8 version used in Node.js dropped support for ARMv5. That's why I
stick to Node.js 0.10.

> > Is my only option to add NodeJS 0.12.0 as a custom package?
> 
> Why would you want to add another package? Just improve the existing
> nodejs package.

Maybe we can support v0.10 (Maintance) and v0.12 (Stable) in Buildroot?

Best regards
J?rg Krause

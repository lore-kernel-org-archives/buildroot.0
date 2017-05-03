From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed, 3 May 2017 12:29:22 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-04-29
In-Reply-To: <20170430062822.F06D82097E@mail.free-electrons.com>
References: <20170430062822.F06D82097E@mail.free-electrons.com>
Message-ID: <20170503102922.GB26389@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Apr 30, 2017 at 08:28:22AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2017-04-29, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Build failures related to your packages:
> 
>          arm |      toolchain-external-custom | http://autobuild.buildroot.net/results/39888c188c0d13219a8419897a833275fcc81597
> 

It seems that this is an invalid configuration:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABI=y
BR2_ARM_INSTRUCTIONS_THUMB2=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_EXTERNAL=y


With STATIC_LIBS set, there is no downloadable external toolchain.
As such, Buildroot falls back to a preinstalled one and sets the toolchain
location to /path/to/toolchain, which does not exist.

However, I don't find this toolchain config in the list at:
http://autobuild.buildroot.net/toolchains/configs/

The build was submitted by Richard Braun, could it be that he is using toolchain
configs that are not in this list?

Thanks,
Thomas

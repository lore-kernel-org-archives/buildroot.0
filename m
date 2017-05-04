From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 09:37:17 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-04-29
In-Reply-To: <223d1087-7158-2bce-b145-774a871f1911@mind.be>
References: <20170430062822.F06D82097E@mail.free-electrons.com>
 <20170503102922.GB26389@argentina>
 <20170503142939.3fc6a470@free-electrons.com>
 <20170503124713.GA17301@shattrath>
 <20170503150243.72d66fb9@free-electrons.com>
 <223d1087-7158-2bce-b145-774a871f1911@mind.be>
Message-ID: <20170504093717.7513c27e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 May 2017 08:55:47 +0200, Arnout Vandecappelle wrote:

>  The problem is that that defconfig file (sourcery-arm-thumb2.config) doesn't
> specify which toolchain to use:
> 
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_ARM_EABI=y
> BR2_ARM_INSTRUCTIONS_THUMB2=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TARGET_OPTIMIZATION=""
> 
> It just relies on the default external toolchain.
> 
>  Obviously this isn't very robust to begin with: when the external toolchains
> change, this could implicitly change this toolchain defconfig. E.g. imagine that
> Linaro would grow a Thumb2 option, then suddenly this sourcery-arm-thumb2.config
> would build using a Linaro toolchain...

Aaah, yes.

>  So I think the solution is to explicitly add the predefined external toolchain
> to use to all the toolchain configs. I'll try to send a patch for that.

OK. Thanks.

>  BTW, I notice now that we don't have configs for the Codescape toolchains. Any
> reason for that?

Nope, just nobody has suggested one. Or maybe at the time I was a bit
annoyed by having too many MIPS related configurations.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

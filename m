From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Dec 2020 22:42:00 +0100
Subject: [Buildroot] [PATCH] toolchain-buildroot: glibc: Remove the
 default choice of built-in SunRPC
In-Reply-To: <e66a9d79-f300-c853-64da-b5859ae72209@mind.be>
References: <20201211121255.17309-1-kremneva@synopsys.com>
 <e66a9d79-f300-c853-64da-b5859ae72209@mind.be>
Message-ID: <20201215224200.6146dbff@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Dec 2020 22:24:12 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  As you see from this comment, we *do* enable rpc support in our glibc build.
> 
>  However, this feature is removed in glibc 2.32. In Buildroot, we are still
> using glibc 2.31 - except for ARC and RISCV-32. So I guess you're using one of
> those. Well, based on your e-mail, probably ARC :-). Please note in the commit
> message that it is really removed in glibc 2.32.
> 
>  I think this obsolete RPC was a transitory measure for when some versions of
> glibc still had RPC bundled. Now, I indeed think we can remove it.
> 
>  In addition to this, we should also remove the --enable-obsolete-rpc flag from
> glibc.mk. And maybe also check if nsswitch.conf needs to be adapted as well.
> 
>  Romain, can you think of anything else that has to change?
> 
>  Ideally we should be able to remove BR2_TOOLCHAIN_HAS_NATIVE_RPC completely,
> but there are external toolchains that still have it bundled, so we can't do
> that yet.
> 
>  Thomas, the script that generates the external bootlin toolchain
> Config.in.options files will need to be adapted as well.

Actually, Romain has already sent patches doing that, and I made some
comments. He then sent some patches to fixup the config fragments
provided by toolchains.bootlin.com, and used by the script.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

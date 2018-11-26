From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 11:41:17 +0100
Subject: [Buildroot] [PATCH] package/msgpack: disable building tests
In-Reply-To: <20181126080607.31231-1-thomas.petazzoni@bootlin.com>
References: <20181126080607.31231-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181126114117.5bad3b0e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Nov 2018 09:06:07 +0100, Thomas Petazzoni wrote:
> The msgpack tests of msgpack 2.1.5 currently don't build with gcc 8.1
> due to new gcc warnings. While this has been fixed in upstream commit
> a05d92ae85024d0648f69f95307a1d3e8e51109c ("Fix
> -Werror=class-memaccess"), we generally don't build tests in
> Buildroot, so let's disable them.
> 
> It is worth mentioning that tests are automatically built when zlib,
> gtest and thread support is found. msgpack.mk currently doesn't
> express any optional dependency on zlib and gtest, but since these are
> only used when building tests, and we are now disabling them, there is
> no point in adding those packages as optional dependencies.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/7d7aa9723f02f9bc78dbf6248674be4d402199bf/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Ignore this patch, Fabrice already sent a similar patch before:
https://patchwork.ozlabs.org/patch/1002781/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

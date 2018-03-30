From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Mar 2018 11:07:53 +0200
Subject: [Buildroot] [PATCH v4 08/11] package/clang: enable target
 variant
In-Reply-To: <20180329113346.10367-9-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-9-valentin.korenblit@smile.fr>
Message-ID: <20180330110753.2c1d1415@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Mar 2018 13:33:43 +0200, Valentin Korenblit wrote:
> This patch provides Clang for the target, tools and libraries.
> 
> In this package we have to deal with the same kind of problem we encountered
> when building mesa3d with llvm support: llvm-config (host-version) had to be
> copied to STAGING_DIR/usr/bin. In this case, we need llvm-tblgen from host
> to be installed in STAGING_DIR/usr/bin for cross-compiling clang.
> 
> We need libclang for the target because it is used by all OpenCL implementations.
> In this series, Clover is provided.

I'm not sure to understand why you need Clang on the target, and what
Clover is. Maybe I missed it, but I don't see where the target Clang is
used in the rest of your series.

In addition, we don't support gcc on the target, so having clang on the
target raises a red flag for me.

Could you explain a bit more why this is needed/useful ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

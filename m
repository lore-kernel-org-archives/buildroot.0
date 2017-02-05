From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 23:13:53 +0100
Subject: [Buildroot] [PATCH 1/1] secilc: new package
In-Reply-To: <20170201153423.13611-1-Adamduskett@outlook.com>
References: <20170201153423.13611-1-Adamduskett@outlook.com>
Message-ID: <20170205231353.0363ae97@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Feb 2017 10:34:23 -0500, Adam Duskett wrote:
> The SELinux CIL Compiler is a compiler that converts the CIL language as
> described on the CIL design wiki into a kernel binary policy file.
> http://github.com/SELinuxProject/cil/wiki/
> 
> In addition, the default makefile always tries to build the man pages
> and there is no way to not build them.  If we try to build them, it would
> require the dependency xmlto.  As such, I have included a small patch that
> removes the man page building step from the makefile.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

I am not very familiar with SELinux. However, should this compiler
really be a target package? Does it make sense to use it on the target?
In the context of an embedded system, wouldn't be the policy be
compiled on the host, and installed "pre-compiled" on the target? If
that's the case, then secilc should be a host package, not a target
package.

Could you clarify how secilc is meant to be used, and why you've chosen
to implement it as a target package?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

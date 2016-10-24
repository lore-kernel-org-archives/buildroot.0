From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 23:40:44 +0200
Subject: [Buildroot] [PATCH 1/1] firejail: new package
In-Reply-To: <1476986053-11910-1-git-send-email-cdf123@cdf123.net>
References: <1476986053-11910-1-git-send-email-cdf123@cdf123.net>
Message-ID: <20161024234044.2749e6a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution!

On Thu, 20 Oct 2016 12:54:13 -0500, Chris Frederick wrote:
> Firejail Security Sandbox
> https://firejail.wordpress.com/
> 
> Lightweight application sandboxing system using seccomp and kernel
> namespaces.
> 
> Signed-off-by: Chris Frederick <cdf123@cdf123.net>

This package does not cross-compile properly: building for an ARM
target, it produces a host binary (x86-64) in my case:

$ file output/target/usr/bin/firejail 
output/target/usr/bin/firejail: setuid ELF 64-bit LSB shared object, x86-64 [...]

In addition, it's using fork(), so you need a BR2_USE_MMU dependency,
it uses pthread so you need a BR2_TOOLCHAIN_HAS_THREADS dependency.

Also, the license is GPLv2+ apparently, not GPLv2.

Finally, please include in the same patch series a patch updating the
DEVELOPERS file for this new package addition.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

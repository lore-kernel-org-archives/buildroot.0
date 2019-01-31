From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Jan 2019 22:34:05 +0100
Subject: [Buildroot] [PATCH 3/3] arch/mips: add (Marvell) Octeon III
 processor
In-Reply-To: <20190130201224.6555-3-patrickdepinguin@gmail.com>
References: <20190130201224.6555-1-patrickdepinguin@gmail.com>
 <20190130201224.6555-3-patrickdepinguin@gmail.com>
Message-ID: <3e257345-6455-2584-b2b9-fc61fd51809e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/01/2019 21:12, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The compiler recognizes a specific 'march' value for Octeon III processors,
> so create a 'Target Architecture Variant' entry for it in the target menu.
> 
> Note: support for '-march=octeon3' was added in gcc 5.x. However, the
> official compiler provided by Marvell (Cavium Networks) uses gcc 4.7.x (and
> supports -march=octeon3 via their own modifications). For this reason, no
> line 'select BR2_ARCH_NEEDS_GCC_AT_LEAST_5' is added.

 Actually, I wonder if we should not just remove the GCC_AT_LEAST dependencies
in the custom external toolchain. It's kind of a "you know what you're doing"
situation.

 Perhaps it would make more sense to extend check_unusable_toolchain with a
configure-style compile-and-link test of a simple main(){} program to check if
all the arch et al options that we pass in the wrapper are supported, and error
out at that time.

 Regards,
 Arnout

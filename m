From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Feb 2013 00:32:38 +0100
Subject: [Buildroot] Insufficient RPC options for crosstool-ng toolchain
In-Reply-To: <511037F4.8090906@gmail.com>
References: <511037F4.8090906@gmail.com>
Message-ID: <20130205003238.2ec5aa65@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Shawn J. Goff,

On Mon, 04 Feb 2013 17:36:36 -0500, Shawn J. Goff wrote:
> I'm getting an error about a missing rpc_msg.h while building 
> conntrack-tools. That package selects libtirpc if 
> !BR2_TOOLCHAIN_HAS_NATIVE_RPC. I'm having BR build the toolchain using 
> ct-ng; I looked at the  toolchain-crosstool-ng/Config.in and it selects 
> BR2_TOOLCHAIN_HAS_NATIVE_RPC because the ct-ng config that ships with BR 
> uses glibc 2.9. My ct-ng config uses glibc 2.14, which doesn't have 
> native RPC support.

Correct.

> I started to make a patch that allows for explicitly selecting 
> BR2_TOOLCHAIN_HAS_NATIVE_RPC like the external-toolchain allows,

Seems like the good solution yes.

> but I 
> ran across check_glibc function and the ext-toolchain-checked stamp and 
> it looks like quite a lot, so I wanted to find out if you actually want 
> all that for this fix.

What problems did you encounter exactly? It should be fairly similar to
what we do for external toolchains I believe, no?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

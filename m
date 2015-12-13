From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:56:30 +0100
Subject: [Buildroot] [PATCH] erlang: disable for sparc
In-Reply-To: <20151206151004.GA23217@waldemar-brodkorb.de>
References: <20151206151004.GA23217@waldemar-brodkorb.de>
Message-ID: <20151213225630.50edd839@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Sun, 6 Dec 2015 16:10:04 +0100, Waldemar Brodkorb wrote:
> Required atomic operations not available for sparc.
> Fixes autobuild failures:
> http://autobuild.buildroot.net/results/688278236e6d5bcd63b7d4413303eb115a38f3a7/
> http://autobuild.buildroot.net/results/7875a7425bfe1f43d46c9a1db9f96b54f7a99b19/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

While I agree that this would fix the problem, I am not too happy with
this solution. We have lots of packages that are affected by atomic
operations issues, not only on SPARC, so I'd prefer to have a better
understanding of the handling of those atomic operations and add proper
dependencies.

For example, we have BR2_ARCH_HAS_ATOMICS. What does this Config.in
option means exactly ?

There are some __sync_*() builtins and __atomic_*() builtins. There is
libatomic on some architectures.

This is a rather big mess, and to me adding one more "depends
on !BR2_sparc" is just a band-aid rather than a proper solution.

Gustavo ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

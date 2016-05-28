From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 15:53:09 +0200
Subject: [Buildroot] [PATCH] package/ipsec-tools: disable for musl
 toolchains
In-Reply-To: <1464439649-27918-1-git-send-email-romain.naour@gmail.com>
References: <1464439649-27918-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160528155309.1f6ca34c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 14:47:29 +0200, Romain Naour wrote:
> __P() is used for compatibility with old K&R C compilers. With
> ANSI C this macro has no effect.
> 
> Unlike for util-linux and ipkg packages where it was easy to remove
> each __P() macro, ipsec-tools use it all over the tree and require a
> "big" patch to enable musl support.

Well, instead of removing the __P usage, we could also add a patch that
adds a dummy definition of __P.

But OK, ipsec-tools has been broken on musl for a while and nobody
proposed a proper fix, so let's mark it as not available on musl for
now. If someone cares in the future, it will also be time to re-enable
it on musl.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 10:58:28 +0200
Subject: [Buildroot] Issues with the toolchain wrapper applied to the
 internal toolchain
In-Reply-To: <561AC198.9070206@mind.be>
References: <20151011120859.7e786a73@free-electrons.com>
 <561AC198.9070206@mind.be>
Message-ID: <20151014105828.54391fb9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, 11 Oct 2015 22:07:52 +0200, Arnout Vandecappelle wrote:

>  One solution for both issues would be to deal with buildroot-built toolchains
> explicitly in the toolchain wrapper, i.e. detect the existence of .real and exec
> that one directly. Would that be an acceptable solution?

I think there are other situations where a .real file could exist, for
example for FLAT toolchains, there is often a wrapper that will call
elf2flt, and the real compiler is also called <something>.real, if I
remember correctly.

So maybe we need to adjust this to .buildroot-real or something that is
less likely to cause any sort of mis-detection?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 23:04:58 +0200
Subject: [Buildroot] legal info: saving of external toolchain
In-Reply-To: <CAAXf6LXAP+nsmMm7fp0_xvzLNT8cAYof4DECUYhpSs1RzE3Zeg@mail.gmail.com>
References: <CAAXf6LXAP+nsmMm7fp0_xvzLNT8cAYof4DECUYhpSs1RzE3Zeg@mail.gmail.com>
Message-ID: <20131010230458.78e1a857@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 10 Oct 2013 16:51:41 +0200, Thomas De Schampheleire wrote:

> The legal info infrastructure currently does not do anything for the
> toolchain, for 'technical reasons'. I can't recall what these
> technical reasons where. At least for external toolchains I don't see
> a big problem to copy the toolchain also in the sources/ subdirectory.
> The developer then still has the obligation to also provide the
> sources that accompany this binary distribution of the toolchain
> (which is impossible for buildroot to do), but at least the binary
> version is already taken care of.
> 
> In fact, the legal-info target already calls toolchain-legal-info, but
> it does not do anything really.
> 
> What do you think about implementing this for external toolchains (at
> least)? The fact that the toolchain is now using the package
> infrastructure probably makes that a tad easier.

I do agree. The primary reason I turned the toolchain backends into
package was precisely to be able to leverage all the goodness of the
package infrastructure: source, external-deps and legal-info.

Note that you're only mentioning external toolchains, but it also
applies to the internal toolchain: verifying that we have proper
licensing information on mpfr, gmp, mpc, gcc, glibc, eglibc, uclibc,
binutils would be good.

For external toolchains it's a little bit more complicated, because the
tarballs are actually pre-compiled binaries. To comply with the
license, we would have to add a mechanism to also download the source
code of the external toolchain. For example, for the Sourcery CodeBench
ARM toolchain, the source is in
http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-2013.05-24-arm-none-linux-gnueabi.src.tar.bz2.
But we don't really have a good way of encoding that in Buildroot at
the moment, I'm afraid.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

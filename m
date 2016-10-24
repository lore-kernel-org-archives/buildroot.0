From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 16:57:10 +0200
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <bf335e58-9056-4b66-6c07-6b5e0570eaa7@imgtec.com>
References: <20161019221035.2350c181@free-electrons.com>
 <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
 <874m42lztg.fsf@dell.be.48ers.dk>
 <b4fb3016-266b-d9bf-bbe1-ec7169c7136a@imgtec.com>
 <20161024142840.4c398e72@free-electrons.com>
 <8c64e8e7-1907-5e74-c743-3d980539be06@mind.be>
 <bf335e58-9056-4b66-6c07-6b5e0570eaa7@imgtec.com>
Message-ID: <20161024165710.652d270a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Oct 2016 15:52:27 +0100, Vicente Olivert Riera wrote:

> I proposed basically the same idea on IRC few days ago, but instead of
> checking an env variable I was proposing to add an option to the wrapper
> in order to switch which flags should be used.

An option doesn't work, because it can easily be "lost" by the package
build system. An environment variable is much more difficult to loose.

> You didn't like the idea because "it's hard to distinguish between
> 'kernel-like' and 'userspace-like' packages" and because "you want to be
> able to use the buildroot-generated toolchain to build a kernel
> externally, without adding hacks".
> 
> I'm confused. With Thomas proposal you will need to declare that env
> variable if you want to be able to build a kernel with that
> buildroot-generated toolchain. That's a hack similar as adding an option
> called -foo, for instance.
> 
> Plus, I don't see how the problem of distinguishing between
> 'kernel-like' and 'userspace-like' package is solved if we use an env
> variable instead of an option.
> 
> I'm not saying that I don't like Thomas proposal. I do like it, and in
> fact, probably is cleaner than adding an option to the wrapper. What I
> don't understand is that you said you didn't like my idea due to those
> two reasons, and now you say that you "kind of like" Thomas' idea which
> (I think) still has the same issues as mine ('kernel-like' and
> 'userspace-like' packages distinguishing plus buildroot-generated
> toolchain reuse without hacks).
> 
> Am I missing something here?

You're probably just missing the fact that we are discussing, trying to
find approaches. Which means we sometimes contradict ourselves, go back
to previous proposals that were not considered good originally, etc.

But yes, you're right: the fact that the wrapper is not usable as-is to
build a Linux kernel or a bootloader outside of Buildroot without
passing some weird option or environment variable makes my proposal
not appealing at all.

Shouldn't we bite the bullet and stop doing shit with this wrapper? I.e
only make it pass the absolutely mandatory --sysroot option but not
other option whatsoever. Yes, this means potentially fixing broken
package build system, but if that's the right thing to do?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

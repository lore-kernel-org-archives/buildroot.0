From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 07:04:49 +0200
Subject: [Buildroot] couple autobuilder questions
In-Reply-To: <CAFt09wNCmDUwXzDHz_9c5Q=Qun6MecvmBCshPygh4inv+MoeRg@mail.gmail.com>
References: <CAFt09wMWfXRfi-KYQUXDJL9nnYu=w3cut_XeaoRQiv3_6+uzxw@mail.gmail.com>
 <20160329160513.64592050@free-electrons.com>
 <CAFt09wNCmDUwXzDHz_9c5Q=Qun6MecvmBCshPygh4inv+MoeRg@mail.gmail.com>
Message-ID: <20160330070449.7a163de2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 19:12:25 -0500, Matthew Weber wrote:

> > Also, in your discussion, you're focusing on the wrapper being 64 bits,
> > but the wrapper is only the tip of the iceberg: the *entire* toolchain
> > (gcc binaries, binutils binaries, gcc companion libraries) are built
> > for 64 bits.
> 
> True, I'd like to add a build machine to the mix which is solely 32bit
> and I'd gladly build the new toolchain variants to add to the mix.  We
> have some legacy configurations where pure 32bit hosts are still
> present.

We can already start by fixing the autobuild-run script so that you can
start your autobuilder instance. It will only use those toolchains that
can run on 32 bits machine, but there's a good proportion of them.

And then we can think of rebuilding the Buildroot toolchain for x86
32-bits. Speaking of that, I have on my long term todo list to improve
the way I generate the Buildroot external toolchains, which includes
building them for both x86 32 bits and 64 bits. But I have no idea when
this is going to be ready.


> >  * The detection of the failure reason for the autobuild.buildroot.org
> >    website is done on the Web server side, not by the autobuild-run
> >    script. And the PHP logic was adjusted to take into account the
> >    umask handling. See
> >    https://git.busybox.net/buildroot-test/commit/?id=e82328cf02a1f0aea90c7c243e8a48dbdb6e53ab.
> 
> That doesn't quite work, from my testing it needs the : removed after the make.*

Why ?

Looking at
http://autobuild.buildroot.org/results/df3/df36cc9b593b1f28febfb4868d68f084d29262ed/build-end.log,
the interesting line is:

make[1]: *** [/home/buildroot/autobuild/run/instance-2/output/build/jack2-v1.9.10/.stamp_built] Error 1

It does have this ":" after make[1], and the autobuild.b.o website
properly detected the failure reason to be jack2-v1.9.10.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

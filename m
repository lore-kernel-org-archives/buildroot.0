From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Oct 2013 11:29:38 +0200
Subject: [Buildroot] [git commit] toolchain-external: update Linaro ARM
 toolchain
In-Reply-To: <CAAXf6LXMvV4rrxbcAozT69PsEVp2CgpgDNhZXnQ6ytdWZz+SvA@mail.gmail.com>
References: <20131009143431.9A85B9B970@busybox.osuosl.org>
 <52564EFD.10506@mind.be> <20131010095744.5690a242@skate>
 <5257BE84.5020901@lucaceresoli.net>
 <CAAXf6LXMvV4rrxbcAozT69PsEVp2CgpgDNhZXnQ6ytdWZz+SvA@mail.gmail.com>
Message-ID: <20131011112938.16a751d7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 11 Oct 2013 11:16:33 +0200, Thomas De Schampheleire wrote:

> The principle of keep three toolchains that differ sufficiently seems
> ok to me. I don't think we should care about 'buggy' releases: Linaro
> is responsible of delivering quality toolchains. If it happens that a
> newly released toolchain is no good for some reason, we can still step
> that one back, or take the newer one if it was released in the mean
> time.
> 
> So, this proposal would for example have (fictional)
> Linaro 2012.11 (based on gcc 4.4)
> Linaro 2013.02 (gcc 4.4 but new glibc)
> Linaro 2013.08 (gcc 4.8)

Ok. So a bit like the Sourcery CodeBench toolchains are updated to
their latest patch level, but we keep several "major version" with
their latest patch level.

But in the case of Sourcery CodeBench toolchain, we do those patch
level version bumps without changing the Config.in option name, so
the bump is transparent to users.

For the Linaro toolchains, the Config.in option name contain the
precise version. So, what happens when we bump Linaro 2013.08 to Linaro
2012.09 (which also uses gcc 4.8, and therefore should replace Linaro
2012.08) ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

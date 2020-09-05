From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 5 Sep 2020 22:55:11 +0200
Subject: [Buildroot] More maintainers
In-Reply-To: <20200905223835.1e68d658@windsurf.home>
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 <87o8mlmoga.fsf@dell.be.48ers.dk>
 <CA+TH9VkA2ETrCvQF+mhb=PeKm8P=o2Jnesmooh4KCKSbzUcANQ@mail.gmail.com>
 <87blilmeo2.fsf@dell.be.48ers.dk>
 <CA+h8R2qYVjSwFZR0DcOpAdSY8nZKURLwW+a8tanxpEvDh__fSg@mail.gmail.com>
 <877dt8n2o7.fsf@dell.be.48ers.dk>
 <CAFSsvmqdBURoCVmbFRBUoYwd3VErpOp1GcG=xzxJETpbpAVrTg@mail.gmail.com>
 <20200905211650.0a229191@windsurf.home>
 <CA+TH9Vn8cdHTKmoT1LLY7F=ywtuH_bSLFxZX1aQZgH6yFT26TA@mail.gmail.com>
 <20200905223835.1e68d658@windsurf.home>
Message-ID: <CA+TH9VkgkuMUUy65L6njfjSuDeJ7wzXueJmX74XF9YQucd8RnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il giorno sab 5 set 2020 alle ore 22:38 Thomas Petazzoni
<thomas.petazzoni@bootlin.com> ha scritto:
>
> Hello Angelo,
>
> On Sat, 5 Sep 2020 22:10:51 +0200
> Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:
>
> > Honestly, I can't see a CI here or we have a big misunderstanding: CI
> > runs on review requests, not on the committed code.
>
> As I've explained, we simply can't do that in Buildroot: running just
> our current CI tests requires several hours of CPU time.
>
> > Simple:
> >
> > * A Developer opens a review request: the author only is notified, the
> > CI starts running.
> > * Commit has style problems, the author only is notified, red flag
> > * Commit message has grammar/syntax errors, the author only is
> > notified, red flag
> > * Commit doesn't have a minimal defconfig to build on all
> > architectures where it is supported: the author only is notified, red
> > flag
>
> I'm not sure what you mean here. You would require all commits to come
> with a snippet of configuration that allows the commit to be build
> tested ?

Yes, exactly.
>
> > * Commit compiles on some architectures and not on others: the author
> > only is notified, red flag
>
> There is no such thing as "Commit compiles" in the context of
> Buildroot. Packages have optional dependencies, we have 3 C libraries,
> we have 15 CPU architectures. How are you going to test all of those
> combinations, for all patches that are submitted ?
>
> If you have a magic solution for this, I'm interested!

Well, I'm completely sure of that.
Anyway, in the context of doing buildable and testable review
requests, the developer should attach to the commit a minimal
defconfig and minimal testing.
That minimal defconfig and that testing are chosen by the developer to
enhance confidence that the request is working.

> > * Commit doesn't have a runtime test attached: the author only is
> > notified, red flag
>
> How would a runtime test be "attached" to a commit?
>
> > * Commit has testing but testing fails, the author only is notified, red flag
>
> What does "Commit has testing" means ?
>
> > Imho, this is how a CI should work.
>
> See above all questions that are raised.
>
> In all what you have described, the difficult point is not e-mail vs.
> Github/Gitlab, it is to define and implement the CI jobs/tests that you
> are describing.
>
> > That way, the autobuild could be even superfluous because each commit
> > was already tested by CI. Yes, autobuild could catch some more
> > intricate problems, but it can run less frequently.
>
> See above: "commit compiles" is not something that can be answered
> within a bounded time in the context of Buildroot.
>
> I think you are confusing the type of CI that can be done on an
> application or library, where indeed it is possible for every commit to
> run the build on all supported platforms, run the unit tests, and have
> good confidence that all combinations have been tested.
>
> In the context of Buildroot, saying "a commit is good" requires
> building thousands of different configurations: number of CPU
> architectures * number of GCC versions * number of binutils versions *
> number of C libraries * number of optional dependencies of the package
> * number of optional dependencies of all dependencies of the package.

I'm not confusing, really, and from what I learned on Computer
Science, that type of testing you're saying here is not even possile.

What I'm saying here is that we should and must enforce a minimal "it
compiles" verification and "it runs" verification.

Recent history says that we had packages with a service never started
because the init script was wrong, we should avoid that.

Doing postmortem autopsy with autobuild is not going to raise the
review requests quality or lower the pressure on the maintainers.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Sep 2020 23:10:21 +0200
Subject: [Buildroot] More maintainers
In-Reply-To: <CA+TH9VkA2ETrCvQF+mhb=PeKm8P=o2Jnesmooh4KCKSbzUcANQ@mail.gmail.com>
 (Angelo Compagnucci's message of "Fri, 4 Sep 2020 21:36:25 +0200")
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200827223956.7cb87050@windsurf.home> <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 <87o8mlmoga.fsf@dell.be.48ers.dk>
 <CA+TH9VkA2ETrCvQF+mhb=PeKm8P=o2Jnesmooh4KCKSbzUcANQ@mail.gmail.com>
Message-ID: <87blilmeo2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

Hi,

 > I think it was clear I was referring to the way we manage patches via
 > ML/patchwork.
 > Doing a "git push" or "repo upload" to open a review request is
 > perfectly fine on my side.

Ehh, ok. I still don't see the big advantage of git push vs git
send-email, but ok.


 >> > But it's not the point here. 419 patches are waiting to be reviewed,
 >> > action must be taken.
 >> 
 >> Agreed, please help review patches.

 > I do what I can, you do what you can, others do what they can, we
 > anyway have this big number of patches piling up.
 > I still think we should improve the workflow or we can continue to not
 > seeing the problem and hope someone will hop in sooner or later.
 > But this is only my pov.

I think it is unrealistic to think that review bandwidth won't always be
an issue. Given the meta nature (a build system of buildsystems) of
Buildroot, no automation will ever be a substitute for real human
review.



 > I think that having an extensive CI that runs on each commit would
 > only benefit the work of the reviewers and the project as a whole.

 >> > If you move to github/gitlab you can test each one of the patches even
 >> > before starting a review and mark as change requested without human
 >> > intervention.
 >> 
 >> And why wouldn't you be able to do the same with the email based setup
 >> today? With tools like snowpatch (https://github.com/ruscur/snowpatch) or
 >> some basic scripting around the patchwork REST API nicely allows you to
 >> run (command line :P) tools whenever new patches are posted.

 > Honestly, we can do that, but you really want to setup and maintain a
 > complex infrastructure like that when we have gitlab with all the
 > features we need?

The complicated part is the actual CI logic. The interaction with
patchwork and email seems to me to be quite small effort (and largely
done already with snowpatch), and for running it, the difference between
gitlab with gitlab runners that we maintain ourselves or something like
this seems pretty small.


 > Probably finding some sponsorship to hack the system, but again, why
 > disregard the sponsorship of gitlab that offers the full package for
 > free to OSS projects?

I am not sure what you are getting at. We already use gitlab (+ our
runners) for defconfig and runtime tests. The only thing we are not
using is the pull request webui.


 >> The big problem is coming up with good automation and feedback that
 >> helps. check-package, test-pkg and our runtime tests are quite basic,
 >> but already a good start. Please help improving them.

 > They are not good because we don't care about continuous integration
 > on each review request.
 > If we do, it will be natural to invest time to setup all the best
 > checking rules we came up with, due to the fact that rules run on each
 > review request and we know the value of that.

check-package runs every time a maintainer applies a patch, and is often
used by contributors, so I doubt that is really the reason - I rather
think it is because it is quite a difficult problem.

This is also why we build random configurations in the autobuilder
rather than E.G. running specific tests for each package as the number
of variables are simply too big.


 >> Anyway, lets keep it constructive here and improve the tooling we have
 >> around the existing workflow rather some wild ideas of changing
 >> everything which is not going to fly.

 > Yeah, I know and it's sad it's not going to fly. We don't have the
 > workforce to do reviews, let's hope someone improve the tooling we
 > have.

 > I'm still of the idea that moving to a modern ready-made and
 > hassle-free CI/CD environment would only benefit the project as a
 > whole, spare some time on the maintainers and rise the contribution
 > quality.

Yes, and I would like a pony ;)

How would such CI setup work exactly. Lets take a random patch from
patchwork, E.G.:

https://patchwork.ozlabs.org/project/buildroot/patch/20200825000246.4035-1-joseph.kogut at gmail.com/

What should the CI exactly do to make human review unneeded? Sure, we
can come up with some more style checks like in check-package, but those
issues are NOT the reason why we have a bunch of pending patches.


So yes, lets please discuss concrete improvements to the automation
checks we already have or ways to get more people to help review rather
than yet another discussion about the merits of pull requests versus
emails.

-- 
Bye, Peter Korsgaard

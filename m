From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Nov 2013 11:59:34 +0100
Subject: [Buildroot] autobuild annotations
In-Reply-To: <CACjG4BL-99HruiHb48fwSD2PV+uCyUkvOra8zsyyTt7dWhxrvw@mail.gmail.com>
References: <CAAXf6LUcR-P7rrpiBOELDV=3GZNHn3kU9hu8bg63+xOZWs0u0Q@mail.gmail.com>
 <CACjG4BL-99HruiHb48fwSD2PV+uCyUkvOra8zsyyTt7dWhxrvw@mail.gmail.com>
Message-ID: <20131120115934.356d52c3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear arnaud aujon,

On Wed, 20 Nov 2013 11:38:32 +0100, arnaud aujon wrote:

> You're right I think there is something missing in the current
> workflow. I was wondering if Jenkins can be used to solve this
> problem and bring some meatrics and code conventions checking.
> 
> I noticed that free-electrons has a Jenkins instance building
> buildroot : http://jenkins.free-electrons.com/job/buildroot/ is it
> used by the community too ?

Yes. My colleague Maxime Ripard is maintaining that, and Peter, Maxime
and myself are receiving e-mails whenever a build fails.

> I think the advantage of Jenkins against the current flow is that
> there is plenty of plugins that can be (easily?) used to fulfil the
> project needs (comment on failure, meatrics, code convention
> checking...) Did you ever talk about that ?

Jenkins just doesn't work for random builds.

Jenkins is designed to build the same configuration over and over
again, and make comparisons from one build to another: the build was
working yesterday, it's failing today, here is the set of commits that
have been made between yesterday and today, and therefore the problem
is somewhere in these commits. Jenkins is really good for that, and we
already use it to build all the Buildroot defconfigs every day.

However, what autobuild.buildroot.org is doing are *random*
configurations. I.e you cannot compare one build to another. This
really doesn't fit well in the model of Jenkins in my opinion, and is
the reason why a small specific tool was written.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

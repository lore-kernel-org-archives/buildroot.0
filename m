From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 05 Sep 2013 22:49:12 +0200
Subject: [Buildroot] Build reproducibility
In-Reply-To: <CAAXf6LUjLb498scj-y3vb-DbRe+2as9H+shXAWHGU=CiTPf43g@mail.gmail.com>
References: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
 <20130903191306.601a2be0@skate>
 <CAAXf6LUjLb498scj-y3vb-DbRe+2as9H+shXAWHGU=CiTPf43g@mail.gmail.com>
Message-ID: <5233916.AB5rYWIjf1@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thursday 05 September 2013 21:56:01 Thomas De Schampheleire wrote:
> On Tue, Sep 3, 2013 at 7:13 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > On Mon, 2 Sep 2013 15:18:09 +0200, Thomas De Schampheleire wrote:
> >> > Of course, if within the Buildroot project we are interested in
> >> > fixing such missing dependencies, then we can find a way of adding
> >> > randomness into the build order in our autobuilders. But clearly,
> >> > we do want to expose this randomness to our users.
> >> 
> >> I think indeed we should try to set the dependencies right some way
> >> or another.
> >> 
> >> If we assume that a package does not have any configurable options
> >> that would change its dependencies, a simple way to check if all
> >> dependencies are properly expressed is through:
> >> make clean toolchain foo
> > 
> > This is already done by the autobuilders. Thanks to the randomness of
> > the configuration, if a package fails to express a mandatory
> > dependency, sooner or later the autobuilders will generate a
> > configuration that has the package enabled but not one of its unknown
> > dependencies. The autobuilders have triggered such cases very quickly
> > in the past when a new package was added, so I'm pretty confident we
> > have good coverage on this one.
> 
> I'm currently running 'make clean toolchain <pkg>' for each package,
> and preliminary results have already found several dependency
> problems. I will analyze the results when it's done and submit patches
> for them.
> The advantage of such a non-random test is that it will find problems
> faster than the autobuilders.

Just to avoid duplicate work, I am currently testing an automated system to 
detect dependencies of packages (based on inotify as I explain in my previous 
mail). First results can be found there:
http://www.sysmic.org/~jezz/dependencies.cooked

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr

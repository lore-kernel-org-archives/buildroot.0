From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Oct 2015 22:38:39 +0100
Subject: [Buildroot] Recommended way of working on project
In-Reply-To: <CAOcYpt0a2g1t9euFaFJGwifAQen-mf8yeXP8Xh5A=RUYgPtXgA@mail.gmail.com>
References: <CAOcYpt0a2g1t9euFaFJGwifAQen-mf8yeXP8Xh5A=RUYgPtXgA@mail.gmail.com>
Message-ID: <562FEEDF.9000204@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26-10-15 22:56, David Kosir wrote:
> Hi guys,
> 
> I need advice from someone who already did real-life projects with buildroot.
> 
> I've started a buildroot project and I'm wondering what is the best
> way of managing it.
> I will mostly use open-source packages that are already part of the
> buildroot, but I will need to update versions and change specific
> build options on many of them. Also, I will add few custom
> scripts/programs.
> 
> I was thinking what is the best way of handling it. I've read
> recommendations here [1]
> I see two recommended ways and third non-recommended but often approach:
> 
> 1) Use company-specific configuration and packages, don't interfere
> with buildroot files.
> 2) Use BR2_EXTERNAL and don't touch buildroot (probably use it as git
> submodule).
> 3) Fork buildroot and change whatever you like. Fetch new changes
> now-and-then, if possible to merge easily.

 Patching buildroot itself is not recommended, but it's not discouraged either.
Or did you find somewhere advising against it? In fact, some of the core
buildroot developers (Peter, me, and I think Thomas as well) regularly do that
in our buildroot projects. The approach 1) and 2) are really only about adding
packages.

 What we do discourage is public forks that try to add support for some specific
board, because these things should just be upstreamed.


> I know that 1) and 2) are recommended but I've already stumbled upon
> problem keeps growing and repeating:
> 
> - I need to use XY package but I need newer version
> - I create new XY-custom package in my <company>/<board> or BR2_EXTERNAL path
> - XY package is dependency for few other packages so I need to create
> them as *-custom package
> - I end up with 10 custom packages in two days and I expect to have 10
> more next days.

 Yep, gets complicated :-)

> 
> As my final product will basically be using all my custom packages +
> few basic buildroot packages, is there and good reason not to go with
> approach no 3) ?
> I see it often online, when people just fork buildroot and continue
> working on some stable tag, rarely even bothering on merging from
> mainline as their image works and there is no need to touch it.
> 
> While 1) and 2) look like "right" way of doing it (as they give easy
> buildroot merging) it feels like running parallel "mini-buildroot"
> copying mainline packages and doing minor changes to them.
> 
> When time comes to fetch new changes, in 1) and 2) I will need to
> looks for changes manually as I've copied old packages and in 3) I
> will have to do manual merge examining conflicts.
> 
> What are your real life project experiences, what is the best way?


 In fact, I typically use a combination of 2) and 3). New "private" packages go
into BR2_EXTERNAL, new to-be-upstreamed packages and local hacks are applied
directly on the buildroot tree. Merging upstream changes is usually not much of
a problem.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

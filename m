From: Manas Mangaonkar <manasmangaonkar@gmail.com>
Date: Wed, 13 Mar 2019 18:49:49 +0530
Subject: [Buildroot] [External] Re: Gsoc Interest : Follow upstream
 updates and CVEs of packages
In-Reply-To: <CANQCQpZ=D4zHeZu4_MM8iRmrMr5t941iEixvJwohVN4Kax3Thw@mail.gmail.com>
References: <CALKvhuOFNyav9hJ73YgEFMx8mig3j36GHAdXOnJvFykcaCUVGQ@mail.gmail.com>
 <CANQCQpa-bccz8tigO4K=oJ1jzBcOANOicS1n5XxpFKq0vAVdYA@mail.gmail.com>
 <CALKvhuP5XrG_b2pRDb5fHo=EVoXhm6q_ajq2ZUA4AWzwSG9PEg@mail.gmail.com>
 <CANQCQpZKU8viN3xRurpy9V+1vJ_T8QkT2kUaD1_uzPREOd9mbw@mail.gmail.com>
 <CANQCQpZ=D4zHeZu4_MM8iRmrMr5t941iEixvJwohVN4Kax3Thw@mail.gmail.com>
Message-ID: <CALKvhuNt9awxn-ks40nMfu2tDmyCWSpWd+O0-V44BxLjp-B1mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> With respect to what breakages?  Test builds or versions not listed in
> NVD?

For example if a packager,user tries to package something or build
something for buildroot.but then due to some upstream dependency issues
or other problems it does not build.Then this can be automatically reported
as a issue in the upstream repo.This is a git specific approach though.
but this could work for everything

> I don't think a NVD only approach makes sense.  It could be a
> start but there are tools that centralize feeds.  I'd suggest
> reviewing Debian, Gentoo, and other distros approaches and tooling for
> this situation.

As a packager at fedora,currently we have automated update posting on
bugzilling whenver we have updates available,but not automated build
breakage notifier due to upstream.
as far as i know same goes for Debian.There does exist one tool that
releases to Github then to pypi and then to fedora(which is fedora's own
gsoc project).
So modifying it with buildroot functionality and other custom functions for
buildroot and tracking cve would be something to consider.

Owasp tracking project looks interesting.

On Wed, Mar 13, 2019 at 6:35 PM Matthew Weber <matthew.weber@collins.com>
wrote:

> Manas,
>
> On Mon, Mar 11, 2019 at 9:53 AM Matthew Weber <matthew.weber@collins.com>
> wrote:
> >
> > On Thu, Mar 7, 2019 at 1:39 AM Manas Mangaonkar
> > <manasmangaonkar@gmail.com> wrote:
> > >
> > >
> > >
> > > On Wednesday, March 6, 2019, Matthew Weber <matthew.weber@collins.com>
> wrote:
> > > > Manas,
> > > >
> > > > On Wed, Mar 6, 2019 at 2:55 AM Manas Mangaonkar
> > > > <manasmangaonkar@gmail.com> wrote:
> > > >>
> > > >> Hi,
> > > >>
> > > >> My Name is Manas  [IRC: Pac23/Pac23xyz] i am a CE undergrad at the
> University of Mumbai,Came across the Following Upstream project and would
> love to work on it as part of Gsoc.
> > > >>
> > > >> I discussed this on the IRC and was told to ping here,afaik there
> already exists some code for this,can someone kindly link to the
> codebase/repo. I have seen some of it in the mailing list archive.
> > > >>
> > > >
> > > > I have been working a series to add CPE reporting to Buildroot so
> that
> > > > a manifest could be produced with each build.  In the series [1], the
> > > > [2] patch added the checking of CPE status in the pkg-stats script
> > > > (this is the script with the new release monitoring hooks).  We did
> > > > not look at the problem space of checking for valid CVE against each
> > > > the CPE.  I do wonder if adding the CPE id and CVE tracking directly
> > > > to release monitoring site would have more value then to our
> pkg-stats
> > > > or a new script.  Then a report could be ran at the
> release-monitoring
> > > > site level to list open CVE on the Buildroot project.
> > > >
> > > > I do owe a refresh of [1] as it has been awhile since I rebased and
> > > > sent a new version.
> > > >
> > > > Matt
> > > >
> > > > [1]
> http://patchwork.ozlabs.org/project/buildroot/list/?series=71318&state=*
> > > > [2] http://patchwork.ozlabs.org/patch/985550/
> > > >
> > >
> > >
> > > Hi,
> > >
> > > So I have couple of super basic questions
> > >
> > > I noticed the release site has a api, how do you plan to get this to
> integrate directly with the site?
> > >
> >
> > I have not explored that and was just suggesting it as a collaboration
> > that could be a path.  Another option for any CVE or other bug
> > tracking could be something like
> > https://www.owasp.org/index.php/OWASP_Dependency_Track_Project  .
> >
> > > What's the full form or significance of cpe? First time working with
> buildroot.
> >
> > It's one of the industry ways to label a package item
> > (
> https://csrc.nist.gov/projects/security-content-automation-protocol/specifications/cpe/
> ).
> > Not Buildroot specific and also not comprehensive (see OWASP for a
> > list of many feeds/sources that could be concentrated).
> >
> > >
> > > Originally I had drummed up a workflow of having a db that tracks nvd,
> sends emails of each breakage, update, and keeps track using our own db but
> using release monitoring sounds good.I guess
> > >
> > > Also having something that automatically indicates upstream of
> breakages on our end due to upstream issues will be nice.Soemthing like
> automated issue filing on GitHub using their hooks.
> >
> > With respect to what breakages?  Test builds or versions not listed in
> > NVD?   I don't think a NVD only approach makes sense.  It could be a
> > start but there are tools that centralize feeds.  I'd suggest
> > reviewing Debian, Gentoo, and other distros approaches and tooling for
> > this situation.
> >
>
> Just noticed we dropped upstream on this email thread.  Adding them
> back, would you mind responding again to the above items like you did
> this morning?
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190313/fef547bf/attachment.html>

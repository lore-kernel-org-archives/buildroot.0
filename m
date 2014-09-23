From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 23 Sep 2014 17:50:25 -0500
Subject: [Buildroot] RFC: CVE analysis
In-Reply-To: <5421EECD.6050806@gentoo.org>
References: <CANQCQpbSu1OUHvivMbQFGC3x6GPSWA3imp2GqGMjeqmYZKBstw@mail.gmail.com>
 <542088A8.2080902@zacarias.com.ar> <5421EECD.6050806@gentoo.org>
Message-ID: <CANQCQpa7Z62EC93N0yKbRz5Q5j3ZaepDbPfK=yi4hNnNCbRuPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joshua,

On Sep 23, 2014 5:14 PM, "Joshua Kinard" <kumba@gentoo.org> wrote:
>
> On 09/22/2014 16:38, Gustavo Zacarias wrote:
> > On 09/22/2014 05:21 PM, Matthew Weber wrote:
> >
> >> I was curious if anyone has done a script similar to the "make
> >> legal-info" that takes a package list and checks it against a CVE
> >> database?  We're looking at doing some automated tracking of
> >> vulnerabilities with our nightly builds and were at a point of putting
> >> something together.
> >>
> >> It might also be an interesting feature to expose on the Buildroot
> >> website.... maybe listing the current vulnerabilities of the last
> >> release and the current tip?
> >
> > Hi.
> > I usually track CVEs and bump/fix when appropiate.
> > It's mostly a mix of personal scripts, nothing too fancy that i'd like
> > normal people to see in the current state :)
> > The problem with actively pursuing security fixes is that it needs some
> > regular manpower in patching and testing, and that's without considering
> > backports (though the package infra is quite stable lately).
> > There are outstanding packages that have some severe vulnerabilities
> > like cups where i did a call for volunteers to bump/fix without much
> > success, and i can only do so much in my free time, with cups being
> > somewhat complicated to test because of varying combinations.
> > It's not a task that can really be fully automated either because you
> > can get a CVE for say PHP that fixes a vulnerability that only affects
> > windows operating systems - there must be some context analysis as well.
> > I normally try to maintain some format for my security bumps/fixes but
> > that's completely informal, like:
> >
> > Subject: Security bump PACKAGE to version x.y
> > Fixes:
> > CVE-yyyy-nnnn - short description
> >
> > But then some other people might catch the bump before myself and there
> > goes that.
> >
> > Something nicer would probably be like the .hash files for packages
> > where we could describe the bumps that affect security and the relevant
> > CVEs.
>
> I don't know if these two sites have a formal API that's queryable, but
you can
> generate RSS feeds based on criteria, so maybe something programmatic can
be setup:
>
> http://www.cvedetails.com/
> http://www.itsecdb.com/oval/
>

Yeah, I was also looking at the cve-search tool (offline database with
scheduled updates from those sites).  Where if we create buildroot scripts
that query that tool.... it would lessen the access to the public sites but
it would put a requirement on setting that database and apps up if you want
that buildroot feature.

>
> Also, these deal more with cyber-threat information, but has ties into
> vulnerability research and are both developed by the MITRE corporation
(who
> manages the CVE database):
>
> https://stix.mitre.org/
> http://taxii.mitre.org/
>
> --
> Joshua Kinard
> Gentoo/MIPS
> kumba at gentoo.org
> 4096R/D25D95E3 2011-03-28
>
> "The past tempts us, the present confuses us, the future frightens us.
And our
> lives slip away, moment by moment, lost in that vast, terrible
in-between."
>
> --Emperor Turhan, Centauri Republic
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140923/8d354e6c/attachment.html>

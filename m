From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 4 Feb 2020 16:36:39 -0600
Subject: [Buildroot] [PATCH 0/2] Add CVE reporting to pkg-stats
In-Reply-To: <1d6c0162-3703-14d7-80e3-17eba4a51451@railnova.eu>
References: <20200204215232.666841-1-thomas.petazzoni@bootlin.com>
 <1d6c0162-3703-14d7-80e3-17eba4a51451@railnova.eu>
Message-ID: <CANQCQpZNCCs_z4SwMb1dL0Xftkc364KLNuGqvZXvbJ_AsBxgbA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 4, 2020 at 4:32 PM Titouan Christophe
<titouan.christophe@railnova.eu> wrote:
>
> Hello Thomas^2 and all,
>
> On 2/4/20 10:52 PM, Thomas Petazzoni wrote:
> > Hello,
> >
> > This set of commit extends the pkg-stats tool to use the NVD database
> > (https://nvd.nist.gov/vuln/data-feeds) to see if the current version
> > of each Buildroot package is affected by a CVE.

Would be a neat feature to also have ran against LTS

> >
> > An example result can be seen here:
> >
> >   - Human readable HTML:       https://bootlin.com/~thomas/stats-cve.html
> >   - Machine parseable JSON:    https://bootlin.com/~thomas/stats-cve.json
>
> Really great to see this landing !
>
> >
> > Thanks to this, we can see that 60 of our packages are apparently
> > affected by a total of 185 CVEs.
> >
> > A new per-package variable, <pkg>_IGNORE_CVES, is introduced, and
> > allows to tell the tool to ignore some CVEs, for example because it is
> > fixed by a local patch in Buildroot, or because the CVE does not apply
> > to the Buildroot package (the CVE only affects a non-Linux operating
> > system, or affect a functionality of the package that isn't built in
> > Buildroot).
> >
> > Of course, the results are not perfect:
> >
> >   - The NVD database product names certainly don't 100% match the
> >     Buildroot package names. We might have to add some extra metadata
> >     information in each package (CPE ID ?) to map to the correct NVD
> >     database product name.
> >
> >   - Buildroot packages that have a version selection are not correctly
> >     handled.
>
> In this latter case, we should maybe display a comment in the CVE column
> of the HTML report that says "CVE checking failed", because the
> "correct" CSS class could let us think that everything is fine while a
> package is on fire.
>
> Probably bikeshed for this first iteration though.
>
> >
> > But overall, it already provide useful results. The plan is of course
> > to implement e-mail notification to Buildroot developers in charge of
> > packages with unfixed CVEs, in a second step.
> >
> > Thanks to Thomas DS and Titouan for all the help in the implementation
> > of this. We started at 2 PM today, and we have this first version to
> > show.
> >
> > Thomas DS: I told you we could have something done by the end of the day!
> >
> > Thomas
> >
> > Thomas Petazzoni (2):
> >    support/scripts/pkg-stats: add support for CVE reporting
> >    docs/manual: describe the new <pkg>_IGNORE_CVES variable
> >
> >   docs/manual/adding-packages-generic.txt |  14 +++
> >   support/scripts/pkg-stats               | 157 +++++++++++++++++++++++-
> >   2 files changed, 170 insertions(+), 1 deletion(-)
> >
>
> I'll run once more through the code tomorrow morning with a fresh brain,
> but overall looks okay.
>
>
> Best regards,
>
> Titouan



-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.

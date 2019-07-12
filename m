From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 12 Jul 2019 21:15:29 +0200
Subject: [Buildroot] Qt5 LTS handling [was: package/qt5: bump latest
 version to 5.12.4]
In-Reply-To: <93af8798-0395-2c9f-dd0f-aad677dc0909@mind.be>
References: <20190710173645.15459-1-ps.report@gmx.net>
 <20190710173645.15459-2-ps.report@gmx.net>
 <891f19e9-a64b-c025-b5cd-f7a0517fbc35@mind.be>
 <20190711210233.0b7eb0aa@gmx.net>
 <93af8798-0395-2c9f-dd0f-aad677dc0909@mind.be>
Message-ID: <20190712211529.00fbf6e0@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Fri, 12 Jul 2019 11:40:43 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 11/07/2019 21:02, Peter Seiderer wrote:
> > Hello Arnout,
> >
> > On Thu, 11 Jul 2019 00:12:59 +0200, Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> >> On 10/07/2019 19:36, Peter Seiderer wrote:
> >>> qt5multimedia:
> >>> - remove 0001-Fix-compile-failure-with-gstreamer-0-10.patch (taken from
> >>>   upstream [1])
> >>
> >>  For some reason, this gave a conflict for me...
> >>
> >>>
> >>> qt5webengine:
> >>> - add one additional license hash
> >>>   (src/3rdparty/chromium/third_party/blink/renderer/build/scripts/license.pyc)
> >>>
> >>> [1] https://code.qt.io/cgit/qt/qtmultimedia.git/commit/?id=935967a453b47ae7c8e9ad3d94eef3813eab58db
> >>>
> >>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> >>
> >>  Applied to master, thanks.
> >>
> >>  Do you know if this also fixes Bug 11776 [1] for qt5webengine? Apparently the
> >> bump to 5.13 should fix it, but I guess 5.12.4 probably fixes it too.
> >
> > No, the bug still exists with 5.12.4....
>
>  Darn. We could try to backport the fix, but I think it's complicated...
>
>
> >>  By the way, do we stick to 5.12.x or do we bump to 5.13 (for 2019.08)? If we
> >> bump, it would be nice to have that bump soonish... Still, it's good to have
> >> this 5.12.4 bump first because that can be backported to 2019.05.
> >
> > Will prepare the bump to 5.13.0 the next (few) weeks ;-), the question is how
> > to proceed:
> >
> > - keep LTS 5.6 (Standard Support Until 16.03.2019, according to [2]), bump Latest to 5.13
> > - bump LTS 5.6 to LTS 5.9 (Standard Support Until 31.05.2020), bump Latest to 5.13
> > - bump LTS 5.6 to LTS 5.12 (Standard Support Until 2021), bump Latest to 5.13
> > - drop LTS, only support Latest
>
>  At the last BR meeting it was decided to drop LTS entirely, because it is
> causing too much pain. Instead, we'd aim for an LTS version to be included in
> the 20xx.02 Buildroot release, and bump to a non-LTS release shortly after that.

For the record the link to the meeting notes, see [1]...

>
>  I'm not sure, however, if this is possible. It would mean that we would delay
> the bump to 5.13 until after 2020.02. So in practice, we'd skip 5.13 and jump to
> 5.14. It works out now, but since Qt releases an LTS every year-and-a-half,
> approximately, it will probably get us into trouble at some point...

Delaying a possible bump to 5.13 would be a pity, trying to get qt for buildroot
up-to-date for an customer (to keep up with the windows folks who are
happily bumping versions ;-) )...

Plus the option to maintain a back-portable Latest-LTS leeds to an
LTS-5.12 and Latest 5.13/5.14/6.0... solution...

>
>  Anyway, there is talk of Qt6, which will change the landscape again...
>
>
>  So actually, my proposal would be to forego the LTS entirely and just go for
> latest. That does mean that we end up with an unmaintained qt5 in our own LTS
> branch. For example, Qt 5.14 will probably get its last update around June 2020.
> Note that the current situation (LTS vs. Latest choice) would not be a solution
> for that - the Latest would still be in the unmaintained situation, so it would
> in practice not be useable.

Regards,
Peter

[1]  https://elinux.org/Buildroot:DeveloperDaysFOSDEM2019#Qt5_versions_to_support:_keep_5.6_or_a_newer_LTS.3F

>
>
>  Regards,
>  Arnout
>

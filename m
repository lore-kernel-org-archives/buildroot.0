From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jun 2017 23:27:18 +0200
Subject: [Buildroot] [PATCH 0/3] core: check hashes of license files
In-Reply-To: <5b73844f-e827-7d81-8a0e-56ded5de62de@lucaceresoli.net>
References: <cover.1497772831.git.yann.morin.1998@free.fr>
 <CA+NV+Vmd+uwWztf4Po71Kh3WHPVzPR++HSUdmBoF1oddsS14ew@mail.gmail.com>
 <20170619174707.GB3045@scaer>
 <CAAXf6LVAgOoLDEc-HUJJOOm9Oq8k5cG5q2VkK+ZNVJyGhtM4Cw@mail.gmail.com>
 <20170620152813.GA2892@scaer>
 <5b73844f-e827-7d81-8a0e-56ded5de62de@lucaceresoli.net>
Message-ID: <20170625212718.GH3673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2017-06-23 23:50 +0200, Luca Ceresoli spake thusly:
> On 20/06/2017 17:28, Yann E. MORIN wrote:
> > Thomas, All,
> > 
> > On 2017-06-19 21:32 +0200, Thomas De Schampheleire spake thusly:
> >> 2017-06-19 19:47 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> >>> On 2017-06-19 22:47 +0530, Rahul Bedarkar spake thusly:
> >>>> On Sun, Jun 18, 2017 at 1:31 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >>>>>
> >>>>> Hello All!
> >>>>>
> >>>>> This small series is a proposal to check the hashes of the license files
> >>>>> during legal-info, to catch the packages whose license changes but where
> >>>>> the text of the new license is in the same file.
> >>>>
> >>>> Thanks for this series. Checking hashes of the license files during
> >>>> legal-info stage looks logical but we discussed about doing that after
> >>>> downloading sources so that change in license file is noticed early
> >>>> (as a part of build test after version bump).
> >>>
> >>> It is not possible to do at download time. It can only be done after
> >>> the package has been extracted and patched.
> >>>
> >>> That is why, when you run legal-info on a non-built (but configured)
> >>> tree, you'll notice that Buildroot extracts and patches the packages
> >>> before saving their legal-info.
> >>>
> >>> Besides, if one uses the support/scripts/test-pkg script to test the
> >>> version bump, then legal-info is run by the script.
> >>>
> >>> So, I still believe it is better done during legal-info.
> >>>
> >>
> >> Yann, I think Rahul means that the checking of the hashing should be
> >> checked as part of the standard 'make pkg' target, whichever subtarget
> >> it is, be it -build, -install or what not.
> > 
> > OK, I see.
> > 
> > Still, I believe it is better suited to keep that for during the
> > legal-info step.
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> >> But, I don't think we should mix such topics: legal info topics should
> >> stay in the -legal-info target.
> >> One solution could be to make '-legal-info' part of the standard build
> >> process, although it will slow down the build and some/many people
> >> will not like that.
> >> An alternative is to split '-legal-info' in two parts:
> >> -legal-info-checks and actual -legal-info. The first part would verify
> >> some important things, i.e. presence of valid LICENSE, presence of all
> >> files specified in LICENSE_FILES, hash checking on these files. It
> >> could be added to the standard 'make pkg' group. The second part would
> >> do the actual creation of the manifest, copying the sources, etc. and
> >> remains on-demand only.
> 
> Thomas' analysis is technically correct, but implementing what he
> describes it is a bit complex for the benefits it grants IMO.

Well, I don't think if is very complex either.

My position is about keeping sheeps together: checking the license files
is part of legal-info.

And especially since what we really want is to check them at the very
moment we want to aggregate the legal-info structure: only then do we
have to ensure their correctness.

Regards,
Yann E. MORIN.

> So I agree
> with Yann to keep it simple and require patch submitters to use test-pkg
> before submitting patches. And of course we can change this choice in
> the future.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

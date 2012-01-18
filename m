From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Jan 2012 12:30:52 +0100
Subject: [Buildroot] [PATCH v2] bash: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <CA+gTGJFtJVTOeS8su7P2FnP4OMLFhbpvg6JMAymkL2uLs5+ogQ@mail.gmail.com>
References: <1326820937-28384-1-git-send-email-arnout@mind.be>
 <87wr8qnd1c.fsf@macbook.be.48ers.dk>
 <CA+gTGJFtJVTOeS8su7P2FnP4OMLFhbpvg6JMAymkL2uLs5+ogQ@mail.gmail.com>
Message-ID: <201201181230.52774.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 18 January 2012 07:37:30 Arkady Gilinsky wrote:
> On Wed, Jan 18, 2012 at 1:07 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> >
> >  Arnout> From: Arkady Gilinsky <arcadyg@gmail.com>
> >
> >  Arnout> There are some bash features that can not be detected
> >  Arnout> automatically during configure stage while
> >  Arnout> cross-compiling. This commit adds the ability to force support
> >  Arnout> of such features.
> >
> > Ok, but does it make sense to make these things configurable? I haven't
> > checked, but presumably these are supported on all Linux archs, and
> > don't affect the binary size significantly (compared to bash size)?

 I don't think it does (that's what I meant to say in my review), but I
didn't want to force the issue without prior feedback.

> >
> > Couldn't we just always forcibly enable these instead?

 Completely agree with that.

> 
> I agree with you, Peter, that these features supported on many/almost
> all Linux archs, but
> current version of bash configuration in Buildroot has 'job_control'
> feature set to off.
> I didn't find the reason why (may be you know), so I decided to leave
> the ability to set it off
> for anybody who do not want/able to set this feature on.
> Also the default setting is off to not to break any existing build.
> If you find that these features should be forced set to on, inform me
> I will make an appropriate patch.

 I'll post a v3 that does just that.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

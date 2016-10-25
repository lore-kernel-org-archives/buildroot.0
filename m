From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 25 Oct 2016 08:14:28 -0500
Subject: [Buildroot] [PATCH v2] skeleton: /etc/network/interface.d/*
	support
In-Reply-To: <87twc1kkr2.fsf@dell.be.48ers.dk>
References: <1471361908-51757-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161022232831.030a10ad@free-electrons.com> <8737jnnubv.fsf@dell.be.48ers.dk>
 <20161023141720.626b89d6@free-electrons.com>
 <CANQCQpamR1dU8zTt_XwX_u2MgzLW3dBvw5e3Tc=RmGfhwW3g+Q@mail.gmail.com>
 <87twc1kkr2.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpZ5EyFnKAjzkyunDLOW2tn0g+dq6q2mF4UhXW16TKBcsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue, Oct 25, 2016 at 1:25 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
>
> Hi,
>
>  >> > We afaik provide no explicit guarantees on the ordering of the various
>  >> > _TARGET_FINALIZE hooks
>  >>
>  >> Correct.
>  >>
>  >> >, but it afaik will run in (package-)alphabetical
>  >> > order, E.G. before the finalize hooks of skeleton so this doesn't work
>  >> > :/
>  >>
>  >> Hum, my thinking was that it did not matter if the "source" line is
>  >> before or after the lo definition. However, the skeleton package
>  >> completely overwrites the file, so indeed, it doesn't work.
>
>  > So leave it as is in the skeleton.mk?
>
> I think that is the only place we can add it, yes.
>
> With that said, there's afaik no packages using interface.d, so if this
> is just for project customization then you might as well handle it there
> (E.G. you might already have a custom interfaces or appending the line
> to it in your post-build is easy).

Agree, but in this case we thought it might make sense to include by
default, so that we encourage the practice of using that style of
interface configuration which follows the behavior/intent of larger
Linux distros.  Especially since the user intentionally enables
ifupdown for more advanced use cases.

I'm good either way.

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.

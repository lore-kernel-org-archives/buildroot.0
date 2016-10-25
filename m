From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Oct 2016 08:25:53 +0200
Subject: [Buildroot] [PATCH v2] skeleton: /etc/network/interface.d/*
	support
In-Reply-To: <CANQCQpamR1dU8zTt_XwX_u2MgzLW3dBvw5e3Tc=RmGfhwW3g+Q@mail.gmail.com>
 (Matthew Weber's message of "Mon, 24 Oct 2016 21:22:37 -0500")
References: <1471361908-51757-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161022232831.030a10ad@free-electrons.com>
 <8737jnnubv.fsf@dell.be.48ers.dk>
 <20161023141720.626b89d6@free-electrons.com>
 <CANQCQpamR1dU8zTt_XwX_u2MgzLW3dBvw5e3Tc=RmGfhwW3g+Q@mail.gmail.com>
Message-ID: <87twc1kkr2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

Hi,

 >> > We afaik provide no explicit guarantees on the ordering of the various
 >> > _TARGET_FINALIZE hooks
 >> 
 >> Correct.
 >> 
 >> >, but it afaik will run in (package-)alphabetical
 >> > order, E.G. before the finalize hooks of skeleton so this doesn't work
 >> > :/
 >> 
 >> Hum, my thinking was that it did not matter if the "source" line is
 >> before or after the lo definition. However, the skeleton package
 >> completely overwrites the file, so indeed, it doesn't work.

 > So leave it as is in the skeleton.mk?

I think that is the only place we can add it, yes.

With that said, there's afaik no packages using interface.d, so if this
is just for project customization then you might as well handle it there
(E.G. you might already have a custom interfaces or appending the line
to it in your post-build is easy).

-- 
Venlig hilsen,
Peter Korsgaard 

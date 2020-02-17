From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 17 Feb 2020 08:14:34 +0100
Subject: [Buildroot] [PATCH] package/libftdi1: fix python support
In-Reply-To: <87wo8ohull.fsf@dell.be.48ers.dk>
References: <20200206095421.12987-1-yegorslists@googlemail.com>
 <87imkiyd32.fsf@dell.be.48ers.dk>
 <CAGm1_kvMR9y5FtiAUNcMDT8V4diTFNk=3KSD7twQzkXw0jm-tQ@mail.gmail.com>
 <875zgiy8dq.fsf@dell.be.48ers.dk>
 <CAGm1_ksGCvr8bmLMjrrNaGQvcaGS=2GuC7yqQcvTBE93_1Z-Jw@mail.gmail.com>
 <871rr6xxcl.fsf@dell.be.48ers.dk>
 <CAGm1_ktss6p4wNv7FrZSgH8N=jQbnRTepEHNk_r6+MoGxy23Xg@mail.gmail.com>
 <CAGm1_kvBo0hfYTayZJ0AGQTFfAsU=5ur2O7rvOHcas6sXBbcxw@mail.gmail.com>
 <87wo8ohull.fsf@dell.be.48ers.dk>
Message-ID: <CAGm1_kvNUOwXKD9NJjC==WgsH0HptJicL+wU8BEt64567_gO_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 15, 2020 at 2:02 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:
>
> Hi,
>
>  >> >  > P.S. another issue is that as you can see cmake has found the host's
>  >> >  > own SWIG version and not BR's version which is 4.0.x.
>  >> >
>  >> > Hmm, indeed. We do add our host-swig to the path, so I guess something
>  >> > is hardcoded to look in /usr/bin first?
>  >> >
>  >> > Care to take a look?
>  >>
>  >> Will do.
>
>  > I have looked at the problem. CMake 3.10.2 doesn't know anything about
>  > SWIG4.0 so it looks for the SWIG binaries in this order (see
>  > Modules/FindSWIG.cmake):
>
>  > find_program(SWIG_EXECUTABLE NAMES swig3.0 swig2.0 swig)
>
>  > This way swig3.0 on our host will be detected first. I've added
>  > swig4.0 to my "/usr/share/cmake-3.10/Modules/FindSWIG.cmake" and it
>  > now detects the SWIG built with BR. So for now, the only solution is
>  > either to install an up-to-date CMake via "pip install cmake" or to
>  > bump our CMake requirement to a newer version.
>
> Or if swig is backwards compatible (I guess it is?), we could just add a
> swig3.0 symlink as well?

Sure. Will take care of this.

Yegor

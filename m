From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Sep 2016 22:23:25 +0200
Subject: [Buildroot] RTAI math module compilation
In-Reply-To: <CAEqQue3VOmTHMNOavNZrP93sagLki-VaUVYoO4EcXf95b2Sf=w@mail.gmail.com>
References: <CAEqQue108OTCsmAejX1sR6q8HL2zCj7jXtaB927b=kHo=UQTrA@mail.gmail.com>
 <78c4ab72-52be-571c-e81a-a0f78c1e2e7f@mind.be>
 <87vaxi2zip.fsf@dell.be.48ers.dk>
 <CAEqQue3VOmTHMNOavNZrP93sagLki-VaUVYoO4EcXf95b2Sf=w@mail.gmail.com>
Message-ID: <972d0f7c-d2fe-8be9-0973-c6acde90c6e4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Please don't top-post, but reply in-line like so.]


On 29-09-16 21:34, servo gmrt wrote:
> Hi,
> 
> RTAI supports to ARM ,m68,  PPC and x86.
> 
> I am using it in my project.
> 
> Recently I compiled RTAI-4.0.1 with 3.8.13 kernel. It is working fine.

 I guess for x86 then? Because I don't see a usable patch for 3.8 ARM or
PowerPC, as I wrote below.


> I found some changes and modifications are required for building rtai_math.ko
> module.
> 
> I did the changes in generated makefile after that it started building. (I
> followed http://mail.rtai.org/pipermail/rtai/2012-December/025250.html )
> 
> Rtai releases are not as fast as Linux Kernel and buildroot.Don't remove the
> RTAI module from buildroot.

 It doesn't make sense to keep RTAI if it is not possible to actually use it.
Your problem shows that it is not usable at the moment. So unless you or someone
else are willing to send patches to fix the issues with it, it makes no sense
for us to keep it around. People who do need it can always recover it from git
history and try to fix the failures.

 Regards,
 Arnout

[Quoted text kept because I refer to it above.]


> On Tue, Sep 27, 2016 at 1:40 AM, Peter Korsgaard <peter@korsgaard.com
> <mailto:peter@korsgaard.com>> wrote:
> 
>     >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be
>     <mailto:arnout@mind.be>> writes:
> 
>     Hi,
> 
>      >  Perhaps we should remove RTAI. The most recent patch for x86 is 3.8, and the
>      > most recent patch for ppc is 2.6.29... Oh, and there is a new version
>     5.0-test2
>      > released in May that goes up to 4.1 for x86 (and drops ppc).
> 
>     So x86 is the only supported arch? I see that test2 isn't even announced
>     on rtai.org <http://rtai.org> :/
> 
>     I personally don't have any issues removing RTAI if it doesn't get
>     updated / nobody uses it.
> 
>     If you DO use it, please speak up.
> 
>     --
>     Bye, Peter Korsgaard
> 
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 2 Nov 2017 22:30:51 +0000
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <20171102232155.11995715@windsurf>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf> <20171102232155.11995715@windsurf>
Message-ID: <1509661850.7985.41.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Thu, 2017-11-02 at 23:21 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Quick feedback on all the build issues.
> 
> On Tue, 31 Oct 2017 23:05:19 +0100, Thomas Petazzoni wrote:
> 
> > 
> > On Tue, 31 Oct 2017 08:00:13 +0100 (CET), Thomas Petazzoni wrote:
> > 
> > > ? ? ? ? ?arc |?????????????????busybox-1.27.2 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_2cb531
> > > b9f9c75bb5dae10c02f2afeca225c65947&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=SAoW0E6nimRIdKo5CmAKyfsXXQO
> > > z_SQmi2vzF0vzHlU&s=ZI69s1d8Fhd0U0CQ_OKm3nRZMN96MGVA18cf7tkNTqg&e= | ORPH??
> > 
> > 
> > ? CC??????console-tools/setlogcons.o
> > libbb/appletlib.c:206:8: error: 'NUM_APPLETS' undeclared (first use in this function); did you mean 'PF_APPLETALK'?
> > ? max = NUM_APPLETS;
> > 
> > What is going on here?!?
> 
> It still occurred only once,
> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_-3Freason-3Dbusybox-2D1.27.2&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSS
> Ees0GFDDl656eViXO7breS55ytWkhpk5R81I&m=SAoW0E6nimRIdKo5CmAKyfsXXQOz_SQmi2vzF0vzHlU&s=wzUJlrejybSwFO6Qu3hTo_4dl74GCFzSh_RgSlNUAbY&e=. Not sure what
> this means.

As I just wrote let's not spend too much time on this one before we see more manifestations.

> > > ?????????arc |???????????????????ffmpeg-3.3.5 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-
> > > 3A__autobuild.buildroot.net_results_b8fd41b127ab7702a2b69998076d737ea2e092b5&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55
> > > ytWkhpk5R81I&m=SAoW0E6nimRIdKo5CmAKyfsXXQOz_SQmi2vzF0vzHlU&s=id9_4gCi8sNYG1DOhijn81A1Q54eebDnpM1PyF0n3RQ&e= |?????
> > > ?????????arc |???????????????????ffmpeg-3.3.5 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_43c90f
> > > bad3662101ef4eb5958f73700d1ff57b38&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=SAoW0E6nimRIdKo5CmAKyfsXXQO
> > > z_SQmi2vzF0vzHlU&s=jQSJNcBcuOTAEj4CB77TeJherexKlUNtXrlf6NAS4MU&e= |?????
> > > ?????????arc |???????????????????ffmpeg-3.3.5 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_a152a1
> > > 90108986392346efbba001b9dd0bdc89bc&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=SAoW0E6nimRIdKo5CmAKyfsXXQO
> > > z_SQmi2vzF0vzHlU&s=KF6aCgUc-UaJozlh0VzdCWa7_6K5deiQzaatTTvXPs8&e= |?????
> > > ?????????arc |???????????????????ffmpeg-3.3.5 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_60d442
> > > 46fe6a54b02b53564761807204b9a190d0&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=SAoW0E6nimRIdKo5CmAKyfsXXQO
> > > z_SQmi2vzF0vzHlU&s=F9ANvupxEY3G1UFbyoeVY8IN30fn5d92A8cRAsN1d6I&e= |???????
> > 
> > libavcodec/vp9dsp_template.c:1685:1: internal compiler error: Segmentation fault
> > 
> > Alexey, could you have a look ?
> 
> Alexey, this continues to happen:
> https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_-3Freason-3Dffmpeg-2D3.3.5&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEe
> s0GFDDl656eViXO7breS55ytWkhpk5R81I&m=SAoW0E6nimRIdKo5CmAKyfsXXQOz_SQmi2vzF0vzHlU&s=3_daceeHk2UEFoExTryReYH8JdlkdARTaxBDDQVNuf4&e=. Should we disable
> this package on ARC ?

Please not disable ffmpeg for ARC :)
The fix is in ARC tools update [the one to the final release].

> > > ?????????arc |??????????????stress-ng-0.06.15 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_296b14
> > > 584c200593f88af75cdda65c4ca03cd863&d=DwIFaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=SAoW0E6nimRIdKo5CmAKyfsXXQO
> > > z_SQmi2vzF0vzHlU&s=TMAIAi0joOmhtuYC0EOziiVpJPEqM-9kDTxX6WI40Io&e= |???????
> > 
> > stress-fp-error.c: In function 'stress_fp_error':
> > stress-fp-error.c:100:10: error: 'FE_INVALID' undeclared (first use in this function); did you mean 'EINVAL'?
> > ????EDOM, FE_INVALID);
> > ??????????^~~~~~~~~~
> > 
> > We already exclude nios2, we should probably exclude ARC as well.
> > Alexey, do you confirm?
> 
> Alexey, I've disabled stress-ng on ARC. If you get to fix the <fenv.h>
> support in glibc, we can re-enable it.

Sure, sounds like a plan!

So it looks like so far we don't have any critical failures for ARC and
the only thing to look at is "stress-ng".

Thanks for all the help with fixing our issues!

-Alexey

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Sep 2013 18:48:38 +0200
Subject: [Buildroot] Build reproducibility
In-Reply-To: <87ioyi73el.fsf@dell.be.48ers.dk>
References: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
 <CAAXf6LVmyWojaBTfpTpZsNcXr+bCSkFMT__iYQjTAvO9ryEqnw@mail.gmail.com>
 <2d076e17ea7c855166044994876e2add@sysmic.org>
 <20130830145254.1e5a1f53@skate>
 <CAAXf6LVPfKZP+3k1AfXek28Y6bgVwxbJ4iPYRq6nihry=egaig@mail.gmail.com>
 <5224B8C9.7060609@mind.be> <87r4d6775s.fsf@dell.be.48ers.dk>
 <20130903091612.3216fb83@skate> <87ioyi73el.fsf@dell.be.48ers.dk>
Message-ID: <20130903184838.37f44e53@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

(Adding Fabio to the CC list)

On Tue, 03 Sep 2013 09:47:14 +0200, Peter Korsgaard wrote:

>  Thomas> This would certainly be nice to have (as it also helps
>  Thomas> top-level parallel build, as was discussed with Fabio
>  Thomas> Porcedda some time ago), but:
> 
> [snip]
> 
> Indeed. For the record, I also don't think we should do this, I was
> just stating what was needed if we wanted to do so.
> 
> As long as the dependencies are correct, I don't think seperate
> staging dirs are needed for toplevel parallel builds.

I disagree on this one. Since there is no way to be sure that all the
possible optional dependencies have been taken into account, I believe
separate staging dirs are a requirement to ensure that toplevel
parallel builds are reproducible.

Whenever we bump a package, some additional optional dependencies may
have been added by the upstream developers, and we rarely go deep into
the configure.ac script or other build system files to verify that the
addition or removal of optional dependencies. Having to do such review
work would be very time-consuming and terribly annoying. So the only
way to be sure that the optional dependencies are all properly taken
into account when doing top-level parallel build is by ensuring that
the staging dir used when building a package only contains the
dependencies that have been explicitly listed by the package .mk file.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

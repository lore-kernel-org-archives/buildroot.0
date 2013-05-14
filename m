From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 May 2013 10:31:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-05-13
In-Reply-To: <20130514093947.747a41d3@skate>
References: <20130514063004.8012052C105@lolut.humanoidz.org>
 <87vc6mrpv4.fsf@dell.be.48ers.dk> <20130514093947.747a41d3@skate>
Message-ID: <20130514103114.522bd93c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 May 2013 09:39:47 +0200, Thomas Petazzoni wrote:

> >  Thomas> Build statistics for 2013-05-13
> >  Thomas> ===============================
> > 
> >  Thomas>         success : 89 
> >  Thomas>        failures : 35 
> >  Thomas>        timeouts : 35 
> >  Thomas>           TOTAL : 124
> > 
> > What are the timeouts?
> 
> On my autobuilder, I run the Buildroot build within a "timeout" command
> that errors out when the build takes more than 2 hours.
> 
> Originally, I introduced this because once particular PowerPC external
> toolchain had a 'ld' bug that got triggered on some packages, and was
> causing 'ld' to enter an infinite loop, which was basically halting the
> autobuilder. So this timeout thing was introduced, and I've kept it
> until now.
> 
> I'm rather surprised by the number of timeouts for yesterday, I'll need
> to investigate. They also don't seem to show up on the web interface. I
> suspect something might be wrong in just the e-mail generation script,
> I'll have a look into that.

I was right: there was a copy/paste mistake in the mail script, and it
was showing the number of failures as the number of timeouts. This is
now fixed by
http://git.buildroot.net/buildroot-test/commit/?id=900e908329ed2222f540c4f106f1430e6a7c0ffd.


> However, please beware that the Git commit id from the build results
> coming from my autobuilders are wrong since about a day or so. I was
> using the same Git clone for the two builds, each doing a git pull on
> its own at the start of a build. And I think I finally hit the case
> where the two git pull were done in parallel: the Git repository
> contained some spurious merge commits over the history of the last day.
> I've halted my autobuilders, and I'll be fixing the script to have one
> Git clone for each instance of the build.

This is also fixed now.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

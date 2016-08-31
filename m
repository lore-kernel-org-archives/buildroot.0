From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 22:50:56 +0200
Subject: [Buildroot] Is there an equivalent of yocto's devshell?
In-Reply-To: <5637116E3E13BE46B0D936BF364783C1F6A7E7@MAIA.sede.videotec.com>
 (Ottavio Campana's message of "Wed, 31 Aug 2016 16:12:37 +0000")
References: <5637116E3E13BE46B0D936BF364783C1F6A7E7@MAIA.sede.videotec.com>
Message-ID: <87a8fszmq7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ottavio" == Ottavio Campana <o.campana@videotec.com> writes:

 > Hello,
 > I'm quite new to buildroot, and I am trying to check how I can use it
 > in one project. I am very familiar with yocto, so I am trying to
 > re-learn how to do things with buildroot.

 > Particularly, I am not able to find if buildroot offers a feature
 > similar to the devshell of yocto. The devshell is a shell with all the
 > environment variables already set, so that it is possibile to invoke
 > commands such as make in the same way that the build process does. By
 > working in the devshell, a developer can work already in the correct
 > environment for cross-compiling, which can save a lot of time.

 > Does something similar to the devshell exist in buildroot?

I have never used this 'devshell', but I take it that it is something
that adds the cross compiler to the path and possibly sets up some
environment variables like CC/CXX/CROSS_COMPILE/ARCH to point to the
cross compiler?

If so, we don't have anything quite like that, but writing a little
shell script for your project adding output/host/usr/bin to your path
and exporting those environment variables shouldn't take many minutes.

Or does it do something more special than that?

-- 
Bye, Peter Korsgaard

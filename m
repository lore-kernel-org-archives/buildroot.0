From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 13 Jun 2013 09:58:42 -0500
Subject: [Buildroot] [RFC] ti-gfx: add new package
In-Reply-To: <EE4E4767751A8B40949306E403F4DDD802EEB1D7@sv03ultra002.ultratronik.de>
References: <CALo-6+j77P2RsdYRO9BR04rUX-j0HmxzXtBuHzo_UQ1wDjXbHQ@mail.gmail.com>
 <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
 <CALo-6+ihs6caa98RCvZmZKZ5pUsfXjXPPBJn_zG4J6eBBpsuAw@mail.gmail.com>
 <CAEBucnC-HdSyDttBo4te_=eOR259ebSAwWQuE_W3zcyLVjwSQA@mail.gmail.com>
 <EE4E4767751A8B40949306E403F4DDD802EEB1D7@sv03ultra002.ultratronik.de>
Message-ID: <CAEBucnD1-qa-mf5w1o9JaAFQArd_tTO0K=7rCC3k3LNMazDdFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Naumann,

Thanks for working on this patch.  Hopefully, this cleaned up and
included in the next release.

> I'm happily jumping on integrating the egl stuff in buildroot (and qt), thanks for you start Spenser.
> As for Charles concerns, I too see the kernel build being triggered by ti-gfx, but that's natural since the modules depend on it. I have no problems with that. However, since I'm using a 3.1 kernel, the newclkapi patch broke the ti-gfx build for me. I just removed it, but maybe this can be solved better.

To solve this problem, an ifdef on the kernel version should be done.
I'll try to figure out which version incorporated the clock changes
and add this to the patch.

> To go further with the qt support, I have added staging headers and libs, see patch below. I can now build qt5 with the gui module (which needs the eglfs support). However, when preparing an out of tree qt-project with buildroots qmake, the subsequent make step says it's got nothing to do. Looking into it, the SOURCES from the .pro file did not get picked up, but I have no idea why. Maybe this is another post though.

I'll leave this one for someone more experience in QT and I agree that
this issue does seem external to the inclusion of the ti-gfx package.

The patch below looks good to me.  I'm hoping to get some run time
testing on a couple of boards (Beagleboard xM/Beaglebone Black) done
by next week.  Then, this patch should be ready for inclusion or at
least moving to a proper patch review.

Thanks,

Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate

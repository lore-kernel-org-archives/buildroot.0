From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Sep 2013 00:46:01 +0200
Subject: [Buildroot] [PATCHv2 2/4] kmod: allow to build a host variant
In-Reply-To: <20130902234844.5e078d47@skate> (Thomas Petazzoni's message of
 "Mon, 2 Sep 2013 23:48:44 +0200")
References: <1377624514-10510-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1377624514-10510-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <87fvtn7xgj.fsf@dell.be.48ers.dk> <20130902234844.5e078d47@skate>
Message-ID: <87zjru7sgm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> We also need to set HOST_KMOD_AUTORECONF = YES because of the
 >> configure.ac patch (arguably we should default HOST_<pkg>_AUTORECONF =
 >> <pkg>_AUTORECONF).

 Thomas> Ah, yes, right. I didn't see the problem since the configure.ac patch
 Thomas> is only to support gcc < 4.6.x on the host, which wasn't my case. But
 Thomas> certainly useful in general indeed.

Not only that, but if you don't have (the right version of) autotools on
your build host it also fails.

Anyway, fixed.

-- 
Bye, Peter Korsgaard

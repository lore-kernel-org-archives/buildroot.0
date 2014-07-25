From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 25 Jul 2014 13:00:38 +0200
Subject: [Buildroot] issues without busybox
In-Reply-To: <98386AE2-7424-4E70-8839-6B642B9938F4@whospot.com>
 (gilles@whospot.com's message of "Mon, 21 Jul 2014 12:57:50 -0700")
References: <98386AE2-7424-4E70-8839-6B642B9938F4@whospot.com>
Message-ID: <878unhbt49.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles  <gilles@whospot.com> writes:

 > Folks,

 > Buildroot is a fantastic effort for small footprint devices. However,
 > in my case - where I'd rather have something a bit more SystemV like
 > with MMU, no busybox, a lot of things are broken.

 > Just naming a few I recently fixed to get past some issues:

 > - init network script S40network which tries to use ifup/ifdown only provided in ifupdown package not included.
 > - S45connman sript (if used) which relies on start-stop-daemon only provided with dpkg.

I don't quite understand why you want to get completely rid of
busybox? It is not like it is very big or anything.

As you have noticed, buildroot today implicitly requires busybox in the
rootfs. You can replace various components provided by busybox
(sysvinit, coreutils, bash, ..), but you still need busybox for
ifup/ifdown and start-stop-daemon (and probably others) - Is that a real
problem?

-- 
Bye, Peter Korsgaard

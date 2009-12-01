From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 01 Dec 2009 10:26:51 +0100
Subject: [Buildroot] [PATCH] implement futimes
In-Reply-To: <C73880A1.85EA%sergio@ammirata.net> (Sergio M. Ammirata's message
	of "Sun\, 29 Nov 2009 19\:48\:49 -0500")
References: <C73880A1.85EA%sergio@ammirata.net>
Message-ID: <87vdgrgi3o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergio" == Sergio M Ammirata, Ph D <sergio@ammirata.net> writes:

Hi,

 Sergio> http://lists.uclibc.org/pipermail/uclibc/2009-November/043209.html
 >> 
 >> That line should already be fixed by coreutils-7.4-rename-m4-fix.patch
 >> (see 0ef93af1e4 from July 31st) - Could you try it again and see if that
 >> patch doesn't get applied or what happens?
 >> 

 Sergio> This is the patch you are talking about:
 Sergio> http://git.buildroot.net/buildroot/commit/?id=0ef93af1e4e0b019da650bfc305053
 Sergio> d0b79dc1d0
 Sergio> It only fixes the problem partially.

 Sergio> My patch is for the same flag on a different file:
 Sergio> coreutils-7.4/configure

You still need to ensure coreutils doesn't consider configure out of
date and reruns auto* / configure. I committed a slightly more
complicated patch to git (c14fb7c1dde) that fixes it for me.


 Sergio> http://lists.uclibc.org/pipermail/uclibc/2009-November/043210.html
 >> 
 >> We had similar reports from people running a recent Ubuntu version, but
 >> so far noone has been able to track down what the problem is. I cannot
 >> reproduce it here (Debian), and I don't like adding stuff if I don't
 >> understand the problem.
 >> 
 >> Could you provide more info about this?

 Sergio> I am using ubuntu 8.04. Without the patch to define the
 Sergio> position of M4, the "configure" step fails complaining about
 Sergio> not finding M4. Obviously, it cannot find it as part of the
 Sergio> build process.

But it should find the one in output/host/usr/bin/m4 that we're
building?

 Sergio> I will send you my perl patch shortly.
 >> 
 >> Thanks. I haven't seen it yet though?

 Sergio> Here is my microperl patch:

Thanks, please provide a commit description of what it does and why.

-- 
Bye, Peter Korsgaard

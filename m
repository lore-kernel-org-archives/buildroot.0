From: Dominic Newton <dominic.newton@in-2-technology.co.uk>
Date: Fri, 24 Jun 2011 18:46:20 +0100
Subject: [Buildroot] Compiling problem with NPTL threads on x86
In-Reply-To: <4E037C99.2030308@in-2-technology.co.uk>
References: <4E037C99.2030308@in-2-technology.co.uk>
Message-ID: <4E04CD6C.3000200@in-2-technology.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK problem looks more or less solved.

NPTL threads are mainly supported by the latest uclibc release, but the 
devil is in the detail. Some target architecture variants are not 
supported. The buildroot menuconfig may show that NPTL threads are 
available as an options, but when uclibc is configured the local logic 
throws this out. A good check is to run uclibc-menuconfig and test out 
the options on that.

So with this proviso I have compiled s basic system for a couple of 
platforms with all thread variants and have tested each one - they work !

Dominic Newton

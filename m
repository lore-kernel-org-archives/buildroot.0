From: Matias Garcia <mgarcia@rossvideo.com>
Date: Wed, 04 May 2011 16:52:08 -0400
Subject: [Buildroot] Codesourcery multi-lib selection in buildroot
Message-ID: <4DC1BC78.4050103@rossvideo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm building an OS for a PowerPC e500v2 core. Originally, I used a stock 
buildroot toolchain (uclibc), but was not able to optimize a 
time-critical section of our application. With the CodeSourcery 
compiler, I am. Unfortunately, even setting -te500v2 in the buildroot 
optimizations (and hacking it into the TARGET_LDFLAGS) doesn't fix all 
cases. Certain packages within buildroot seem to link against the wrong 
library (linker complains that one library is compiled with hard-float 
and another with soft-float, etc). Is there a way to tell buildroot (or 
Make in general) to always link against a certain library set?

Cheers,
Matias
-- 
	*Matias Garcia*
/Embedded Software Developer/
Ross Video | Live Production Technology
www.rossvideo.com <http://www.rossvideo.com>
+1 (613) 228 1198 x4264

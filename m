From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2011 21:10:23 +0200
Subject: [Buildroot] Codesourcery multi-lib selection in buildroot
In-Reply-To: <4DC1BC78.4050103@rossvideo.com>
References: <4DC1BC78.4050103@rossvideo.com>
Message-ID: <20110505211023.142dec32@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 04 May 2011 16:52:08 -0400
Matias Garcia <mgarcia@rossvideo.com> wrote:

> I'm building an OS for a PowerPC e500v2 core. Originally, I used a
> stock buildroot toolchain (uclibc), but was not able to optimize a 
> time-critical section of our application. With the CodeSourcery 
> compiler, I am. Unfortunately, even setting -te500v2 in the buildroot 
> optimizations (and hacking it into the TARGET_LDFLAGS) doesn't fix
> all cases. Certain packages within buildroot seem to link against the
> wrong library (linker complains that one library is compiled with
> hard-float and another with soft-float, etc). Is there a way to tell
> buildroot (or Make in general) to always link against a certain
> library set?

We have to make sure that this -te500v2 flag is passed to all packages
during their build process. Which packages are causing problems
exactly ?

Another solution is to try the recent proposal of Peter Korsgaard to
use a wrapper for external toolchain components, that would enforce the
use of selected compiler flags so that the selected sysroot would
always be correct.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

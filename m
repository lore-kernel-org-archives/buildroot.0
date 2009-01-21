From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 21 Jan 2009 21:07:43 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <87skncsurl.fsf@macbook.be.48ers.dk>
References: <1232523725.11888.11.camel@elrond.atmel.com>
	<87skncsurl.fsf@macbook.be.48ers.dk>
Message-ID: <1232568463.11888.74.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-21 klockan 13:34 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  Ulf> Using gcc-4.2.4, bu-2.18, uclibc-0.9.30
>  Ulf> wchar, largefile,ipv6, NWFPE
> 
> Again, it would be neat to have such a list with the toolchain config
> that really matters.

You have it now, and it is easy to generate.

"scripts/buildall.sh" will do it for you
by running "scripts/mkpkg" on all listed packages

Calling it "buildall" is not 100% correct, 
since a few packages are not built.
database and qtopia, X windows related packages 
are notable exceptions as well as java and games.

The comments after OK/FAIL etc, are manually added.

buildall.sh creates the log directory and 
then the log/OK and log/FAIL.
log/FAIL contains one log file per built package.

> 
>  Ulf> nmk	valgrind                       DISABLED	x86 specific  
> 
> i386/x86-64/powerpc
> 
> 
>  Ulf> mk	libconfuse                     FAIL	"error: 'input' defined but not used"
> 
> How is that an error?
> 

Ask the compiler writer, I was also confused, but that is
maybe appropriate for a package named "libconfuse" ;-)
There is a comment just before the "error".
"cc1: warnings being treated as errors" so the maintainer
wants to make dead sure that the lexer.c is real clean.

>  Ulf> nmk	database                       DISABLED	Need to enter subdirectory 
> 
> ? So you didn't test sqlite/mysql?

No, I just did an ls of package to start with, and never bothered to
update, There is a significant number of packages that does not build
so until I run out of FAILs, this just adds compile time.
Feel free to add package 


> 
>  Ulf> mk	libcurl                        FAIL	"checking for socklen_t
>  Ulf> equivalent... unknown"
> 
> I have recently built that on armv4l without problems.

Since I am not running a regular make, problems could occur,
If the dependencies in the Makefile are incomplete.
The make maybe runs in the correct order for other reasons.



> 
>  Ulf> mk	madplay                        OK	"Depends on python"
>  Ulf> mk	mpg123                         FAIL	"Depends on python"
> 
> That sounds unlikely - Do you have a build log?

Have build logs for everything.
For the release toochain, the mpg123 build 
aborts with a segmentation fault.

BR
Ulf Samuelsson

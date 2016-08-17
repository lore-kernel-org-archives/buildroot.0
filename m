From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 20:15:01 +0200
Subject: [Buildroot] [PATCH] stella: fix compiler search in configure
	script
In-Reply-To: <1470910831-18439-1-git-send-email-vzakhar@synopsys.com> (Vlad
 Zakharov's message of "Thu, 11 Aug 2016 13:20:31 +0300")
References: <1470910831-18439-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <87d1l7qn2y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vlad" == Vlad Zakharov <Vladislav.Zakharov@synopsys.com> writes:

 > In configure script there are some tests that are looking for
 > a suitable compiler. For this purpose script tries to compile
 > and link some C++ code that is hardcoded in the body of script.

 > The problem is that only linker flags ($LDFLAGS) are passed to the
 > compiler when the script is compiling test code. Therefore some
 > necessary command line options can be lost and this would lead to
 > errors.

 > This exactly happens to ARC:
 >   1. -matomic option is lost as it compiler option,
 >   2. test code compilation fails,
 >   3. the script decides not to use arc-buildroot-linux-uclibc-g++,
 >   4. scipt checks host compiler (x86_64-linux-gnu-g++ in your case),
 >   5. package is being built for x86_64, not for ARC.

 > About last 2 steps - I don't know why configure script should try
 > to build stella for host machine. As for me an error should be
 > raised and a build should be stopped. But this is up to stella
 > developers.

 > Current patch adds compiler options ($CPPLFAGS) when compiling

You are actually passing CXXFLAGS. Committed with that fixed.

Don't forget to submit the patch upstream!

-- 
Venlig hilsen,
Peter Korsgaard 

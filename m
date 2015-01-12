From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 20:58:11 +0100
Subject: [Buildroot] [PATCH] squid: fix automake breakage
In-Reply-To: <1420679367-24134-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420679367-24134-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150112205811.6cb75c60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed,  7 Jan 2015 22:09:27 -0300, Gustavo Zacarias wrote:
> Squid bundles a copy of libltdl (from libtool) which autoreconfigures on
> its own.
> For some odd reason when automake was bumped to version 1.15 and if the host
> system has another automake version, for example 1.14, the ACLOCAL and
> AUTOMAKE variables don't expand properly when the internal autoreconf is
> triggered hence calling the missing handler which in turn tries to use
> an incorrect automake version.
> The solution is to pass unexpanded ACLOCAL and AUTOMAKE variables that
> defer the evaluation to a later moment and avoid the issue.
> 
> Fixes:
> http://autobuild.buildroot.net/results/73f/73fcffafbea320f8c64378bbe8a96922b5e7c6b5/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Even though I am not too happy about the fix, I applied it in order to
fix the autobuilder issues.

I'd like to understand better why the libltdl bundled in Squid thinks
it should autoreconf itself.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 09:03:48 +0200
Subject: [Buildroot] [git commit] support/testing: add test of
 BR2_CCACHE with an external toolchain
In-Reply-To: <86ba6b0f-662b-ebd9-868f-a422e46821cc@mind.be>
References: <20170724163121.A64CB81DD3@busybox.osuosl.org>
 <20170724175458.GF2918@scaer>
 <86ba6b0f-662b-ebd9-868f-a422e46821cc@mind.be>
Message-ID: <20170725090348.5d073604@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Jul 2017 00:54:30 +0200, Arnout Vandecappelle wrote:

> > You don't need to list all tests in there, if you want to execute all
> > of them.i  
> 
>  I think Thomas first implemented it that way. But then gitlab-CI just reports a
> single pass/fail for the entire test suite, without details about what failed.
> AFAIK gitlab-CI reporting doesn't have xUnit integration that could be used to
> report detailed results from a single run.

I didn't implement it in a single pass, simply because I knew I wanted
Gitlab CI to show the breakdown per test, and not a global pass/fail
status. But Arnout's explanation remains true: if we simply do
a "./support/testing/run-tests -a", then we would have a single entry
in the Gitlab CI report that says if the entire test suite has passed
or fail. I believe the current situation, where each test is known as a
separate "thing" by Gitlab CI is better.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

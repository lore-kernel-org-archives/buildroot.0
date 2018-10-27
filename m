From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Oct 2018 22:58:41 +0200
Subject: [Buildroot] [PATCH] iproute2: fix build on glibc < 2.21 / uClibc
In-Reply-To: <20181027154538.4299-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 27 Oct 2018 17:45:38 +0200")
References: <20181027154538.4299-1-peter@korsgaard.com>
Message-ID: <87tvl714zi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/fc9/fc99b1ad49080f552ce611d5a7a2f9fe171b5a2c/
 > http://autobuild.buildroot.net/results/5f7/5f74c258a3adafa5aecd4abc378eef0573143764/

 > q_{etf,taprio}.c uses CLOCK_TAI, which isn't exposed by glibc < 2.21 or
 > uClibc, breaking the build. Provide a fallback definition like it is done
 > for IPPROTO_MPLS and others.

 > Patch submitted upstream:
 > https://lwn.net/ml/netdev/20181027153102.32302-1-peter%40korsgaard.com/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

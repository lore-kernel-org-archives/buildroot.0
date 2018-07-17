From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 22:06:14 +0200
Subject: [Buildroot] [PATCH 2018.02.x] procps-ng: disable for musl libc
In-Reply-To: <3f2a94307e6c380842726b8158e8ec2e9d24372a.1530616293.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 3 Jul 2018 14:11:33 +0300")
References: <3f2a94307e6c380842726b8158e8ec2e9d24372a.1530616293.git.baruch@tkos.co.il>
Message-ID: <87in5dk4p5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The recent procps-ng security bump in commit 88ec06ad484 (procps-ng:
 > security bump to version 3.3.15) of the 2018.02.x branch, introduced use
 > of fopencookie() which is a GNU extension that musl version 1.1.8 does
 > not implement. Backporting the security fixes alone is not feasible.
 > Disable procps-ng for musl libc toolchains.

 > Propagate this dependency to procps-ng reverse dependencies that used to
 > allow build with musl, openvmtools and tovid.

 > Fixes:
 > http://autobuild.buildroot.net/results/eac/eac700c61e277689b46fd617b6ddcbf94b5271e5/
 > http://autobuild.buildroot.net/results/baa/baac54b934d5ac07d3604ae3c6016595e4d7014a/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 21:25:08 +0200
Subject: [Buildroot] [PATCH] package/exim: fix parallel build
In-Reply-To: <20200502181504.28690-1-luca@lucaceresoli.net> (Luca Ceresoli's
 message of "Sat, 2 May 2020 20:15:04 +0200")
References: <20200502181504.28690-1-luca@lucaceresoli.net>
Message-ID: <877dxjtwx7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > exim does build in parallel correctly, but has a concurrency bug in
 > generating version info files which happens either in the build step or in
 > the install step.

 > Add a patch to fix the bug.

 > Fixes:
 >   http://autobuild.buildroot.net/results/ebf/ebfccad007e216564889645a07f5487747116331//
 >   http://autobuild.buildroot.net/results/56a/56a8457efcb32579ad6da99a769b6438dd0db267//
 >   http://autobuild.buildroot.net/results/6a1/6a1f8a352649baf767b094cb6bbe2a7397fa7fac//
 >   http://autobuild.buildroot.net/results/5ed/5ed1c42b3d33198f32d1267e5cc2b1fa1211495a//
 >   http://autobuild.buildroot.net/results/b30/b304569948fd481ce33ecd052a1036153c5d459e//
 >   http://autobuild.buildroot.net/results/d2c/d2c7abfe08672e53ff890127f787f8d2e84860f4//

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

 > ---

 > I cannot test that this is really a fix since I never was able to reproduce
 > the problem locally. However I could easily check that the reversion script
 > is actually executed twice. The timing of these executions can cause errors
 > like the one found by the autobuilders. Thus I'm reasonably sure this
 > commit fixes a bug.

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 May 2014 09:33:13 +0200
Subject: [Buildroot] [git commit] tcl: needs threads
In-Reply-To: <20140511051353.GC4096@tarshish> (Baruch Siach's message of "Sun, 
 11 May 2014 08:13:53 +0300")
References: <20140508211528.D9EA29CB25@busybox.osuosl.org>
 <20140511051353.GC4096@tarshish>
Message-ID: <871tw0ahxi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Thu, May 08, 2014 at 11:14:17PM +0200, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=a1134320e6ff0e34df79459a490b43d6582497bc
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Fixes http://autobuild.buildroot.net/results/486/48696710a270ac69d6d62654779f164075cb3451/
 >> 
 >> Tcl itself has a --disable-threads configure flag, but it unconditially
 >> configures its packages with --enable-threads, causing build failure.

 > Actually it's only the itcl extension that enables threading unconditionally 
 > in the version we use. This has changed in the development tree. See 
 > http://core.tcl.tk/itcl/ci/d0b8b2fa30f9f74b0779ea871eb5883b43d6096b?sbs=0 . So 
 > on the next version bump a no threads build should work again.

Ok, thanks! We presumably also need to exclude the 'threads' extension
then.

-- 
Bye, Peter Korsgaard 

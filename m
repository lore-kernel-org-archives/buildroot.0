From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 3 Dec 2013 14:04:46 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-02
In-Reply-To: <20131203073003.0FA7E1014F4@stock.ovh.net>
References: <20131203073003.0FA7E1014F4@stock.ovh.net>
Message-ID: <529DE4FE.8020900@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/03/2013 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2013-12-02
> ===============================

> Detail of failures
> ===================

>        mips |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/d05e23031ea5542610c26c89908ae64c741fd330/

This failure is caused by another failure on gnutls package. This 
problem has already fixed upstream so it will be available on the next 
gnutls release: 
https://gitorious.org/gnutls/gnutls/commit/346e323228f5cc71664c2f49541f816f88914342

To apply upstream patch on buildroot we would need to make too many 
changes because a lot of things have been added since the latest 
release, so, I think is better if we just wait until the next gnutls 
release and fix this doing a version bump.

>    mips64el |                      gpsd-3.10 | NOK | http://autobuild.buildroot.net/results/0a95190399548ca50b13040382e4928606585558/

This seems to be a bug on the gpsd source code. I have already submitted 
a bug upstream: https://savannah.nongnu.org/bugs/index.php?40785

>    mips64el |                   squid-3.3.10 | NOK | http://autobuild.buildroot.net/results/1e3c583c88f44eafe9047bf32886e0ec03f41549/

This build failure is due to using gcc-4.6.3 which needs a patch to fix 
that problem: 
https://dev.openwrt.org/browser/trunk/toolchain/gcc/patches/4.6.3/040-gcc_bug_49696.patch?rev=37621
Higher versions of gcc already include that patch, so to get rid of that 
autobuild failure just upgrade the gcc of the toolchain used on the 
autobuildbot.

Best regards,
-- 
Vincent

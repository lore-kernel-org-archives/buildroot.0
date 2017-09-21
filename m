From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Sep 2017 21:32:47 +0200
Subject: [Buildroot] [PATCH] flashrom: fix static build with uClibc
In-Reply-To: <c35f0becf1a31f14275820c0f1c3e5d1742ded47.1505895438.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 20 Sep 2017 11:17:18 +0300")
References: <c35f0becf1a31f14275820c0f1c3e5d1742ded47.1505895438.git.baruch@tkos.co.il>
Message-ID: <87h8vvu9sw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Define HAVE_STRNLEN to avoid local strnlen() definition.
 > Fixes:
 > http://autobuild.buildroot.net/results/7dc/7dc4298e3a07c73e03f70205516d68a0f4c2d297/
 > http://autobuild.buildroot.net/results/e36/e362848eb45f6b8100131361e6e5faa546f0bbd8/
 > http://autobuild.buildroot.net/results/69e/69ef10ec710f418b4d10c1edb4f2ce2e49b522bf/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > It seems like only uClibc is affected. Build with musl succeeds even
 > though the resulting binary contains a global strnlen symbol.

Committed, thanks.

-- 
Bye, Peter Korsgaard

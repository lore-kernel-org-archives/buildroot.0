From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 10:11:08 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: export O= to
 post-build/image scripts for out-of-tree builds
In-Reply-To: <20170714130417.18857-1-peter@korsgaard.com>
References: <20170714130417.18857-1-peter@korsgaard.com>
Message-ID: <20170715101108.5c7fffb5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 15:04:17 +0200, Peter Korsgaard wrote:
> Sometimes it can be interesting to call back into buildroot from a
> post-build/image script (E.G. make printvars or similar). For this to work
> correctly with out-of-tree builds we need to pass O= to make, but this is
> currently not available in the environment of post-build/image scripts.
> 
> In concept, O could be derrived from BUILD_DIR (E.G. by stripping /build),
> but directly exporting O is cleaner.
> 
> O= cannot be exported globally as it interferes with various build systems,
> so instead add it to EXTRA_ENV.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/Makefile.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

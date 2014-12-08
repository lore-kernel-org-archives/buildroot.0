From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 10:34:44 +0100
Subject: [Buildroot] [PATCH] ruby: fix verconf.h related build failure
In-Reply-To: <1417821815-9924-1-git-send-email-ps.report@gmx.net>
References: <1417821815-9924-1-git-send-email-ps.report@gmx.net>
Message-ID: <20141208103444.00348ed5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Sat,  6 Dec 2014 00:23:35 +0100, Peter Seiderer wrote:
> See [1] for failure analysis.
> 
> Fixes:
>    http://autobuild.buildroot.net/results/c94fef5d2cfb00a336905ae3c110d7680f6d5416/
>    http://autobuild.buildroot.net/results/4375cb1e325a336dbf59f22f975be9165ad0648a/
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2014-December/114273.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/ruby/ruby.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks for this patch. I had a look, and did some testing. It appears
that the issue doesn't appear on a systematic fashion (like one time
out of 5 to 10 builds), which typically leads one to think it's a
parallel build problem.

But we're building Ruby with $(MAKE1), which means we're not doing
parallel build, so the problem should appear every time, no? Do you
have an explanation as to why the problem only appears from time to
time?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

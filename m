From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 15:23:04 +0200
Subject: [Buildroot] [PATCH] make: fix glob building failure for uClibc
In-Reply-To: <1405400315-11707-1-git-send-email-yuvaraj.patil@wipro.com>
References: <1405400315-11707-1-git-send-email-yuvaraj.patil@wipro.com>
Message-ID: <20140719152304.6693a143@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yuvaraj Patil,

On Tue, 15 Jul 2014 10:28:34 +0530, Yuvaraj Patil wrote:
> Before declaring externel references to glob64 and globfree64, 
> check if uClibC has GNU glob support
> 
> fixes:
> http://autobuild.buildroot.net/results/22927ef1d6c2eeba02361f4b041fe3ee8d5c4704/
> 
> Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
> ---
>  package/make/make-uClib-glob.patch |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 package/make/make-uClib-glob.patch

Thanks a lot for this patch. However, there is a new 'make' release
(4.0) that requires fork(), so it won't work on !MMU platforms such as
Blackfin. So I've committed
http://git.buildroot.net/buildroot/commit/?id=1aa42ad4aed013c03d1e17f4cfe2ace2194f423d,
which makes make not available on Blackfin, and therefore "fixes" the
problem.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

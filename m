From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 22:08:13 +0100
Subject: [Buildroot] [PATCH] package/arptables: add patch to fix musl
 build issue
In-Reply-To: <1449030783-19533-1-git-send-email-joerg.krause@embedded.rocks>
References: <1449030783-19533-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151217220813.5aab367a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed,  2 Dec 2015 05:33:03 +0100, J?rg Krause wrote:
> Due to clashes in the namespace between the Linux Kernel headers and the
> netinet headers building arptables with the musl C library fails.
> 
> Best advice from the musl developers is to not include both headers in a
> userspace tool (see the thread on the musl mailing list [1], especially [2]).
> 
> Since arptables only requires a few definitions from the Linux Kernel headers
> we opt-out the clashing header files and define the needed definitions.
> 
> Patch sent upstream [3].
> 
> Fixes:
> http://autobuild.buildroot.net/results/b72/b721e4fa24a0728c20fd2ec0663c2b5981387642/
> http://autobuild.buildroot.net/results/4e9/4e9e0ed9454d258ef4333e847dc394ff22378ca4/
> http://autobuild.buildroot.net/results/b39/b3951f700ab1664e06e14d95964875fc8e3dd8f4/
> http://autobuild.buildroot.net/results/716/716e81f49f8894b7248f394919c8f22efb908277/
> 
> [1] http://www.openwall.com/lists/musl/2012/10/09/1
> [2] http://www.openwall.com/lists/musl/2012/10/11/1
> [3] http://marc.info/?l=netfilter&m=144903021705206&w=2
> 
> Cc: Brendan Heading <brendanheading@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/arptables/0004-Fix-musl-build-issue.patch | 71 +++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 package/arptables/0004-Fix-musl-build-issue.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

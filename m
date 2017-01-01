From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jan 2017 09:35:20 +0100
Subject: [Buildroot] [PATCH] skalibs: make ld use dummy file when
 configuring
In-Reply-To: <1483134910-12507-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1483134910-12507-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20170101093520.50a2ce32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Dec 2016 22:55:10 +0100, Eric Le Bihan wrote:
> For some architectures, like Xtensa or HPPA, ld from binutils requires
> the output file to be a regular file, as mentioned in a bug report on
> the mailing list [1].
> 
> So, use a dummy file as output file for ld, instead of /dev/null, when
> trying to detect some libraries at configuration time.
> 
> Fixes http://autobuild.buildroot.net/results/288/288fc31cd10ffe3cd93371c7be37d79452a91768/
> 
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=19526
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  ...e-linker-use-dummy-file-when-testing-libs.patch | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

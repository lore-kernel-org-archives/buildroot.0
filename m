From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 23:18:15 +0100
Subject: [Buildroot] [PATCH v2] postgresql: uses fork(), needs mmu
In-Reply-To: <1426629987-26889-1-git-send-email-ps.report@gmx.net>
References: <1426629987-26889-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150317231815.5f51a28f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 17 Mar 2015 23:06:27 +0100, Peter Seiderer wrote:
> Additional revert 'postgresql: enable bfin compile' ([2]) which
> is now useless (Blackfin is a noMMU architecture).
> 
> Fixes ([1]):
>   postmaster/fork_process.o: In function `_fork_process':
>   fork_process.c:(.text+0x22): undefined reference to `_fork'
> 
> [1] http://autobuild.buildroot.org/results/c9c/c9c93156fe64e89f35627aa592c47d8c5181ed7d
> [2] http://git.buildroot.net/buildroot/commit/?id=6f177dac73a289db28772fb3e20347aba5cd5e67
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Thanks, but you forgot to propagate the BR2_USE_MMU dependency to the
packages that select BR2_PACKAGE_POSTGRESQL and that don't already
depend on BR2_USE_MMU. I've done that and applied.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

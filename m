From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:12:30 +0100
Subject: [Buildroot] [PATCH v2] mpd: fix build for ARC
In-Reply-To: <1488366214-19802-1-git-send-email-vzakhar@synopsys.com>
References: <1488366214-19802-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20170301221230.0ef8e330@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Mar 2017 14:03:34 +0300, Vlad Zakharov wrote:
> mpd package fails for both internal and external ARC toolchain as check
> for pthread support fails. Such checks fails because _REENTRANT flag is
> not defined in gcc even when -pthread is passed.
> 
> So we add patch to gcc that defines _REENTRANT  on ARC when -pthread is
> passed.
> 
> Also it disables mpd package for external ARC toolchain as it fails due
> to the same issue.
> 
> This patch should be reverted as soon as the patch for GCC becomes a
> part of ARC toolchain.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/7d7/7d70b62ad996830fbeca46dffcc7a1dc030e575d//
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
> Changes v1..v2:
>   - Sign off on gcc patch

Applied to master, thanks. Peter, I think this one qualifies for the
LTS branch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

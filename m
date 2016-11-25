From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 23:00:52 +0100
Subject: [Buildroot] [PATCH v2 1/2] toolchain-external: support gcc < 4.3
In-Reply-To: <20161123234035.6393-1-arnout@mind.be>
References: <20161123234035.6393-1-arnout@mind.be>
Message-ID: <20161125230052.3a30de9a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Nov 2016 00:40:34 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> We currently support gcc as old as 4.3. However, Buildroot works
> perfectly well with even older gcc versions (tested with 4.1). So we
> can add an option BR2_TOOLCHAIN_EXTERNAL_GCC_OLD to support that. The
> help text of this option is written with plenty of discouragement.
> 
> We use _OLD and not something like _PRE_4_3, because at some point we
> will likely remove the 4.3 option and what would then require a name
> change.
> 
> We don't set any _AT_LEAST option in this case because it's no use -
> there is no lower bound on the version in this case. We therefore leave
> BR2_TOOLCHAIN_GCC_AT_LEAST empty (the implicit default). When it is
> empty, we don't do a version check at all in check_gcc_version
> (previously we errored out when it was empty).
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: rebase on next, slightly reword commit message

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

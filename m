From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:02:59 +0200
Subject: [Buildroot] [PATCH] binutils: Fix 2.26 build failures if
 makeinfo is missing
In-Reply-To: <1467721645-19613-1-git-send-email-joel@jms.id.au>
References: <1467721645-19613-1-git-send-email-joel@jms.id.au>
Message-ID: <20160705150259.66f7a462@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 21:57:25 +0930, Joel Stanley wrote:
> This patch was introduced for the ARC toolchain in caf515e25e699eb. From
> that commit message:
> 
>     Build failed when "makeinfo" was missing on the build host.
>     This was happening because "makeinfo" is required to build .info targets
>     and make exited with error. The issue hadn't appeared before as there was
>     prebuilt documentation in ARC binutils tarballs, so no attempts had been
>     made to build docs.
> 
>     Missing "makeinfo" only stops us from building docs
>     ("missing" script already throws a warning on that regard).
>     Let's continue to build other targets.
> 
>     Now exit code of the script called "missing" is checked.
>     The value 127 means that "makeinfo" is not available on the build host.
> 
>     So when such value occurs, 0 is returned to the top level makefile.
>     Documentation is not being built but further build of binutils continues.
> 
> This was first discovered when building the OpenPower firmware:
> 
>  https://github.com/open-power/op-build/issues/507#issuecomment-230390711
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Thanks for your contribution. However, I have already submitted a
different patch series, which takes a different approach to solve this
problem:

  http://patchwork.ozlabs.org/patch/644679/
  http://patchwork.ozlabs.org/patch/644677/
  http://patchwork.ozlabs.org/patch/644678/
  http://patchwork.ozlabs.org/patch/644676/
  http://patchwork.ozlabs.org/patch/644680/

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

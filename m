From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2016 19:32:29 +0200
Subject: [Buildroot] [PATCH v2] linux: Allow kernel strip modules itself
In-Reply-To: <1474294325-6340-1-git-send-email-abrodkin@synopsys.com>
References: <1474294325-6340-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20160919193229.49735a86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Sep 2016 17:12:05 +0300, Alexey Brodkin wrote:
> We used to do a special handling of Linux kernel modules
> when stripping target binaries because there's some special
> precious data in modules that we must keep for them to properly
> operate. This is for example true for stack unwinding data etc.
> 
> It turned out there're cases when our existing
> "strip --strip-unneeded" doesn't work well. For example this removes
> .debug_frame section used by Linux on ARC for stack unwinding, refer to
> [1] and [2] for more details.
> 
> Now Linux kernel may strip modules as a part of "modules_install" target
> if INSTALL_MOD_STRIP=1 is passed in command line. And so we'll do
> allowing kernel decide how to strip modules in the best way.
> 
> Still note as of today Linux kernel strips modules uniformly for all
> arches with "strip" command, so this commit alone doesn't solve mentioned
> problem but it opens a possibility to add later a patch to the kernel
> which will strip modules for ARC differently - and that's our plan for
> mainline kernel.
> 
> [1] https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/86
> [2] http://lists.busybox.net/pipermail/buildroot/2016-September/172161.html
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

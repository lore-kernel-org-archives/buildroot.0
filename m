From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 16:08:43 +0200
Subject: [Buildroot] [PATCH] ltrace: use current master
In-Reply-To: <1406239161-23777-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1406239161-23777-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <20140727160843.2a728bb4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Belloni,

On Thu, 24 Jul 2014 23:59:21 +0200, Alexandre Belloni wrote:
> ltrace 0.7.3 is the latest release but it is actually broken on ARM
> since PTRACE_SINGLESTEP emulation has been removed, see:
> 
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=425fc47adb5bb69f76285be77a09a3341a30799e
> 
> It fails with:
> PTRACE_SINGLESTEP: Input/output error
> 
> Using master solves that until a new release is made.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  package/ltrace/Config.in               |  1 +
>  package/ltrace/ltrace-02-arm-plt.patch | 30 ++++++++++++++++++++++++++++++
>  package/ltrace/ltrace.mk               | 13 +++++++++----
>  3 files changed, 40 insertions(+), 4 deletions(-)
>  create mode 100644 package/ltrace/ltrace-02-arm-plt.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

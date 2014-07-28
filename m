From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 08:34:47 +0200
Subject: [Buildroot] [PATCH] ltrace: use current master
In-Reply-To: <1406239161-23777-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1406239161-23777-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <20140728083447.03b596b8@free-electrons.com>
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

This commit is causing some build issues on PowerPC:
http://autobuild.buildroot.net/results/b4b/b4b1a7b5ebee4063e87e08c06024526db54bc77f/build-end.log.

Could you have a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

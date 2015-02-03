From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 15:58:31 +0100
Subject: [Buildroot] [PATCH] skeleton: make /run a proper
 directory/filesystem
In-Reply-To: <1417128109-25880-1-git-send-email-gustavo@zacarias.com.ar>
References: <1417128109-25880-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150203155831.469c64ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 27 Nov 2014 19:41:49 -0300, Gustavo Zacarias wrote:
> Making /var/run and /run symlinks to /tmp is bad since the underlying
> tmpfs filesystem is mode 1777 which leads to possible security attack
> vectors via badly owned/mask-mode pidfiles and state files residing there.
> 
> So make /run a proper directory with /var/run symlinked to it.
> Eventually all startup scripts and state info should be pointed to /run
> directly as per the linux fhs and good practice.
> 
> Add a tmpfs filesystem entry for /run so that busybox inittab, systemv
> inittab and systemd automount mounts it there to avoid breaking the
> system.
> 
> While at it fix inconsistent spacing in /etc/fstab by using tabs and
> drop the "static file system information" header whatever that means.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

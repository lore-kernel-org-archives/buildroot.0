From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Nov 2012 09:50:08 +0100
Subject: [Buildroot] [PATCH v2 5/6] cpanminus: requires host-qemu
In-Reply-To: <1352794248-15617-5-git-send-email-arnout@mind.be>
References: <1352794248-15617-1-git-send-email-arnout@mind.be>
 <1352794248-15617-5-git-send-email-arnout@mind.be>
Message-ID: <20121113095008.68bb25a7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 13 Nov 2012 09:10:47 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Must also disable all non-supported architectures, including x86
> (which doesn't have a working fork()).
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> It still only works half the time.  For instance, in one arm configuration
> I have qemu sitting there consuming 100% CPU without any output, system
> calls, or nothing...

From my point of view, cpanminus should be marked as broken, or even
removed unless another solution that qemu is found. The usage of
host-qemu simply doesn't work: if the kernel headers used for the
toolchain built by Buildroot are newer than the kernel version on the
build machine, it will break... so it really isn't a viable solution.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

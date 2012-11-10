From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Nov 2012 10:47:56 +0100
Subject: [Buildroot] [PATCH 4/4] cpanminus: requires host-qemu
In-Reply-To: <1352489646-30635-4-git-send-email-arnout@mind.be>
References: <1352489646-30635-1-git-send-email-arnout@mind.be>
 <1352489646-30635-4-git-send-email-arnout@mind.be>
Message-ID: <20121110104756.3d08566b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri,  9 Nov 2012 20:34:06 +0100, Arnout Vandecappelle
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

I don't think it is worth spending too much time getting cpanminus to
work with host-qemu. The entire idea of using host-qemu is broken due
to the potential incompatibility between the kernel headers used to
build the target C library and applications and the kernel currently
running on the build machine.

So any usage of host-qemu to do cross-compilation is doomed to fail,
unless we force very old kernel headers versions.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

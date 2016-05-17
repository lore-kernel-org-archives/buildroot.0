From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:35:33 +0200
Subject: [Buildroot] package/quagga: Add systemd service
In-Reply-To: <5735DB24.6060009@gmail.com>
References: <1463141985-23802-1-git-send-email-nroach44@gmail.com>
 <5735DB24.6060009@gmail.com>
Message-ID: <20160517223533.2ca3c0a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 May 2016 21:48:20 +0800, Nathaniel Roach wrote:

> Firstly, do we want to run any binary under /sbin? Do we change the 
> output folder of quagga's ./configure? Do we make a folder with symlinks?

Why wouldn't we want to run a binary from /sbin? What's the problem
with that?

Moreover, keep in mind that when systemd is used, /usr/sbin and /sbin
are the same thing.

> Secondly, I'll change Requires=quagga at zebra.service to Wants= as we 
> allow building quagga without zebra, and the other dameons can still 
> talk on the network without it.

This is too systemd specific for my knowledge, so I'll trust what you
submit.

Since you said yourself that you will send an updated version with
additional fixes, I've marked this one as Changes Requested in
patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Sep 2013 09:24:25 +0200
Subject: [Buildroot] [PATCH v3 1/1] change package tarball compression
 to xz whenever possible
In-Reply-To: <1378448055-3056-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1378448055-3056-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20130909092425.6a16e694@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Fri,  6 Sep 2013 08:14:15 +0200, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

I've seen you committed this patch, but unfortunately it breaks all
Github downloads. It assumes Github provides a .tar.xz file, but it
doesn't: even if you request a .tar.xz file from Github, it gives you a
gzip compressed file:

$ wget http://github.com/gandro/input-event-daemon/tarball/v0.1.3/input-event-daemon-v0.1.3.tar.xz
[...]
$ file input-event-daemon-v0.1.3.tar.xz 
input-event-daemon-v0.1.3.tar.xz: gzip compressed data, from Unix

This is causing a huge number of build failures in the autobuilders.
For example, cpuload:
http://autobuild.buildroot.org/results/bcd/bcdf4bdca4d5f8ffc9c84afcadf1b057fc03e009/build-end.log.

So I believe this patch should be reverted, or at least the parts
affecting Github downloads.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 17:38:21 +0200
Subject: [Buildroot] [PATCH] package/quagga: unconditionally create
 /etc/quagga
In-Reply-To: <20190819213658.32433-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 19 Aug 2019 23:36:58 +0200")
References: <20190819213658.32433-1-thomas.petazzoni@bootlin.com>
Message-ID: <87pnki1zf6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > /etc/quagga is listed in QUAGGA_PERMISSIONS, but is only created when
 > some of the quagga sub-options are enabled. When none of those
 > sub-options are enabled, /etc/quagga is not created, causing a build
 > failure when the filesystem images are created:

 > makedevs: line 1: recursive failed for /home/thomas/projets/outputs/quagga-minimal/build/buildroot-fs/tar/target/etc/quagga: No such file or directory

 > Since it is too cumbersome to maintain which sub-options exactly lead
 > to /etc/quagga being created, simply create /etc/quagga
 > unconditionally. It will simply be empty when the quagga package
 > doesn't install anything in it.

 > For the record, here is the list of files installed in /etc/quagga
 > when all quagga sub-options are enabled:

 >   bgpd.conf.sample bgpd.conf.sample2 isisd.conf.sample
 >   ospf6d.conf.sample ospfd.conf.sample pimd.conf.sample
 >   ripd.conf.sample ripngd.conf.sample vtysh.conf.sample
 >   zebra.conf.sample

 > Fixes:

 >   http://autobuild.buildroot.net/results/cdb66589909fd3996186f7db7d1f19a3b03d58a0/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard

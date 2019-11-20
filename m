From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 23:22:27 +0100
Subject: [Buildroot] [PATCH v2 2/2] support/testing: add lxc test
In-Reply-To: <20191120133952.22978-2-patrick.havelange@essensium.com>
References: <20191120133952.22978-1-patrick.havelange@essensium.com>
 <20191120133952.22978-2-patrick.havelange@essensium.com>
Message-ID: <20191120232227.7071626f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Patrick,

On Wed, 20 Nov 2019 14:39:52 +0100
Patrick Havelange <patrick.havelange@essensium.com> wrote:

> The test starts a simple container with an iperf3 server.
> The container is using the tini init system, with a shared rootfs.
> An iperf3 client is started from the host to check that the container
> is really up and running.
> 
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

I've applied to next, after doing some small changes. See below.

>  .gitlab-ci.yml                                |  1 +
>  support/testing/tests/package/test_lxc.py     | 56 +++++++++++++++++++
>  .../tests/package/test_lxc/kernel_config_frag | 20 +++++++
>  .../test_lxc_rootfs_overlay/usr/bin/iperf3.sh |  2 +
>  .../usr/share/lxc/config/minimal-iperf3.conf  |  4 ++
>  .../usr/share/lxc/config/minimal.conf         |  6 ++
>  6 files changed, 89 insertions(+)

An entry in the DEVELOPERS file was missing, so I added it.

> +            infra.filepath("tests/package/test_lxc/kernel_config_frag"),

This file name was not really great. The other kernel config fragments
in our tests were named like this:

./conf/minimal-x86-qemu-kernel.config
./conf/docker-compose-kernel.config
./conf/f2fs-kernel-fragment.config
./tests/core/squashfs-xattr-kernel.config

So I renamed your to:

./tests/package/test_lxc/lxc-kernel.config

> +            infra.filepath("tests/package/test_lxc/test_lxc_rootfs_overlay"))

Repeating the name of the test in the rootfs overlay subdirectory
doesn't seem to be very useful. Also, the other overlays we have in the
tests use rootfs-overlay, so I've switched to that as well.

Applied to next with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

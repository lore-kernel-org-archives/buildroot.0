From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Dec 2010 16:51:23 +0100
Subject: [Buildroot] [PATCH 49/55] Improve handling of mdev/udev
In-Reply-To: <f92465f9de8bcd24cf2c974b158a600a84e96422.1291582352.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 5 Dec 2010 21:53:20 +0100")
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<f92465f9de8bcd24cf2c974b158a600a84e96422.1291582352.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r5dgfldw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Yegor Yefremov introduced udev/mdev integration, but it relies on
 Thomas> devtmpfs and does not use tmpfs on /dev, which is the purpose of
 Thomas> mdev/udev. This commit improves how mdev and udev are handled in
 Thomas> Buildroot.

 Thomas> At compile time, only a minimal /dev is created in the filesystem,
 Thomas> with only "console" and "null". This is done thanks to a small device
 Thomas> table in target/generic/device_table_mdev_udev.txt. This is done
 Thomas> directly at the configuration level (fs/Config.in).

While I agree we need the minimal device table for /etc/shadow and
similar permissions, do we really need to support mdev/udev without
devtmpfs? It's been in the kernel now for close to 2 years, it's very
small and it simplifies (and speeds up) the boot sequence quite a lot.

-- 
Bye, Peter Korsgaard

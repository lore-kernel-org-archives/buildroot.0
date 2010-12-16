From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Dec 2010 15:16:09 +0100
Subject: [Buildroot] [PATCH 44/55] Add network scripting folders to
	fs/skeleton
In-Reply-To: <0de22121b72a0f2b6e8998510883a44150f67e81.1291582352.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 5 Dec 2010 21:53:15 +0100")
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<0de22121b72a0f2b6e8998510883a44150f67e81.1291582352.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vd2thkgm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> From: Yegor Yefremov <yegor_sub1@visionsystems.de>
 Thomas> Those folders are currently created using makedevs according to the
 Thomas> specifications in device_table.txt. However, as makedevs is no longer
 Thomas> executed when dynamic device creation methods are selected (devtmpfs,
 Thomas> udev, mdev), those folders must be created differently. We choose to
 Thomas> put them directly into the default filesystem skeleton.

While this is not wrong, it's also not complete. Even with dynamic dev,
we still need a device_table.txt to get proper permissions on
/bin/busybox, /etc/shadow, /etc/passwd and so on.

-- 
Bye, Peter Korsgaard

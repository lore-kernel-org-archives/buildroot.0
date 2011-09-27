From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Sep 2011 23:46:08 +0200
Subject: [Buildroot] How to build application code once rootfs is
 produced
In-Reply-To: <CAM0R0VOdXwchNESLaCusk1EejijvEiKndO5QjJ11EX6MnegzQQ@mail.gmail.com>
References: <CAM0R0VOdXwchNESLaCusk1EejijvEiKndO5QjJ11EX6MnegzQQ@mail.gmail.com>
Message-ID: <20110927234608.4be04bfa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 26 Sep 2011 04:58:26 -0500,
morris moore <txmmoore@gmail.com> a ?crit :

> mmoore at mmoore:~/beagle/buildroot-2011.08/output/host/usr$
> arm-unknown-linux-uclibcgnueabi/bin/cc t.c
> cc: error trying to exec 'cc1': execvp: No such file or directory

Don't use that binary, it's internal to the toolchain. I would rather
recommend:

$ export PATH=/home/mmoore/beagle/buildroot-2011.08/output/host/usr/bin/:$PATH
$ arm-unknown-linux-uclibcgnueabi -o foobar foobar.c

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

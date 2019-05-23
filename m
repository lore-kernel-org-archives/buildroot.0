From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 May 2019 16:33:13 +0200
Subject: [Buildroot] [PATCH v1] package/busybox: Avoid "can't create
 /proc/sys/kernel/hotplug" error
In-Reply-To: <20190523131444.36058-1-andriy.shevchenko@linux.intel.com> (Andy
 Shevchenko's message of "Thu, 23 May 2019 16:14:44 +0300")
References: <20190523131444.36058-1-andriy.shevchenko@linux.intel.com>
Message-ID: <87ftp5s0k6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andy" == Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

 > At runtime on most of the modern kernels [1] S10mdev script produces an error:
 > /etc/init.d/S10mdev: line 9: can't create /proc/sys/kernel/hotplug: nonexistent directory

 > since the commit

 >   caae7fa1d737 ("busybox: register mdev as hotplug helper when selected")

 > added it unconditionally.

 > Check the presence of procfs node before writing to it.

 > [1]: Linux kernels with the commit
 >        86d56134f1b6 ("kobject: Make support for uevent_helper optional.")
 >      applied.

But how can mdev work on such setups?

-- 
Bye, Peter Korsgaard

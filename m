From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 25 Sep 2012 14:38:57 +0200
Subject: [Buildroot] Error when building defconfig
Message-ID: <CAGduivwG505TRkZ8SnD_MXcyuF6qWwLPoc3CTnZtE5HZ2Uwv0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using the HEAD of the git tree of buildroot, and I just tried to build a
"default" config. I did : $ cp ./configs/qemu_x86_defconfig .config && make

The menuconfig appeared, I saved the conf and exited. I did not change any
option myself. Then I tried to make again, after a short while, I had this error
:

#error It appears you have defined _FILE_OFFSET_BITS=64. Unfortunately, uClibc
was built without large file support enabled.

Followed by many of the same kind.  Enabling large file support in make
menuconfig fix this, but my issue is more the fact that taking a defconfig and
trying to build it doesn't work.

I reproduced the same error with qemu_arm_versatile_defconfig

I tried to look where a patch could be applied, but I'm still very new to
buildroot so... I would need a bit of help :)

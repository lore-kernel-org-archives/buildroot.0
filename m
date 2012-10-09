From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Oct 2012 16:15:18 +0200
Subject: [Buildroot] Error when building defconfig
In-Reply-To: <CAGduivwG505TRkZ8SnD_MXcyuF6qWwLPoc3CTnZtE5HZ2Uwv0w@mail.gmail.com>
 (Maxime Hadjinlian's message of "Tue, 25 Sep 2012 14:38:57 +0200")
References: <CAGduivwG505TRkZ8SnD_MXcyuF6qWwLPoc3CTnZtE5HZ2Uwv0w@mail.gmail.com>
Message-ID: <87haq3ag09.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 Maxime> Hi,

 Maxime> I'm using the HEAD of the git tree of buildroot, and I just
 Maxime> tried to build a "default" config. I did : $ cp
 Maxime> ./configs/qemu_x86_defconfig .config && make

 Maxime> The menuconfig appeared, I saved the conf and exited. I did not
 Maxime> change any option myself. Then I tried to make again, after a
 Maxime> short while, I had this error :

 Maxime> #error It appears you have defined
 Maxime> _FILE_OFFSET_BITS=64. Unfortunately, uClibc was built without
 Maxime> large file support enabled.

You have to do a make clean before changing to a new .config.

-- 
Bye, Peter Korsgaard

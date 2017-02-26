From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 22:59:07 +0100
Subject: [Buildroot] [PATCH] libuv: add dependency on
	BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1487890185-32361-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 23 Feb 2017 23:49:45 +0100")
References: <1487890185-32361-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87h93glil0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The libuv library uses __sync atomic built-ins:
 > $ readelf -a -W output/target/usr/lib/libuv.so.1.0.0 | grep __sync
 >    122: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __sync_val_compare_and_swap_4

 > but this is not currently taken into account in the libuv package,
 > causing some build failures in packages using libuv as an optional
 > dependency, such as janus-gateway and mosquitto.

 > Therefore, this commit updates the libuv package with this additional
 > dependency. The reverse dependencies of libuv are also updated: cmake,
 > luv, luvi and moarvm.

 > Fixes:

 >  - http://autobuild.buildroot.net/results/bdaa67d763c0d8d377a04529c74f73bee7d4ccef/
 >    (janus-gateway)

 >  - http://autobuild.buildroot.net/results/2bc84ba2d1167018e2d48e5183ead22b6425dcf5/
 >    (mosquitto)

Committed after removing the cmake reference/changes after we reverted
cmake, thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Dec 2013 09:15:24 +0100
Subject: [Buildroot] [PATCH] pandaboard: fix defonf build with recent
	kernels
In-Reply-To: <1386201464-19380-1-git-send-email-thomas@cozybit.com> (Thomas
 Pedersen's message of "Wed, 4 Dec 2013 15:57:44 -0800")
References: <1386201464-19380-1-git-send-email-thomas@cozybit.com>
Message-ID: <87haaniuhv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Pedersen <thomas@cozybit.com> writes:

 > The patch "pandaboard: Fix defconfig build" locked the
 > default pandaboard kernel to 3.8.11. This is inconvenient,
 > however, and we can make the default pandaboard kernel
 > build and boot with a few changes:

 > 1. specify the correct load address
 > 2. append the flattened device tree to the uImage

 > Note the default device tree is now for the pandaboard-ES,
 > so users of other board revisions will need to set the
 > correct DTS_NAME.

Thanks. There afaik has been quite some breakage in the kernel related
to pandaboard, what version have you tested with?

In general we try to stick to known (fixed) kernel version in the
defconfigs, to not get the users into that kind of trouble by default.

-- 
Bye, Peter Korsgaard

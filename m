From: Nikula Jouko <Jouko.Nikula@espotel.com>
Date: Wed, 25 Sep 2013 05:14:34 +0000
Subject: [Buildroot] [PATCH] i2c-tools: Add i2c-dev.h to staging
 directory for userspace i2c drivers.
In-Reply-To: <5241C1C8.4010809@carallon.com>
References: <1380017924-20072-1-git-send-email-jouko.nikula@espotel.com>
 <20130924172041.57ec6b88@skate> <5241C1C8.4010809@carallon.com>
Message-ID: <E720F69E63F812489DA4D50AB9BE43F48B1A818F@ESEXE002.espotel.espotel.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Will Wagner
Sent: 24. syyskuuta 2013 19:46

>> This header is already part of the kernel headers, so it should 
>> already be part of the toolchain. Do you have a specific case where 
>> this header is missing?

>The contents of the header are different, the one from i2c-tools contains more.

Yes. In the kernel documentation (Documentation/i2c/dev-interface) it is explained as follows:

"So let's say you want to access an i2c adapter from a C program. The
first thing to do is "#include <linux/i2c-dev.h>". Please note that
there are two files named "i2c-dev.h" out there, one is distributed
with the Linux kernel and is meant to be included from kernel
driver code, the other one is distributed with i2c-tools and is
meant to be included from user-space programs. You obviously want
the second one here."

>We also carry a patch similar to this. Our patch has an addition which is a dependency on linux (assuming it is selected in the config). This ensures that the >header from the kernel gets over ridden by the one from i2c-tools and not the other way around.

Makes sense. Could this patch be mainlined, instead of what I sent?

Regards
	- Jouko

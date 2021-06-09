From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Jun 2021 20:52:22 +0200
Subject: [Buildroot] [PATCH v5 0/5] Introduce bmap-tools as target +
 host package
In-Reply-To: <6e9afcd08150926a669d4df1198461e0acc7f063.camel@orolia.com>
References: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
 <6e9afcd08150926a669d4df1198461e0acc7f063.camel@orolia.com>
Message-ID: <20210609205222.785b065d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicolas,

On Wed, 09 Jun 2021 09:35:38 +0200
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> The first error in the run log is:
> 
> qemu-system-arm: Invalid SD card size: 60 MiB
> SD card size has to be a power of 2, e.g. 64 MiB.
> 
> So I set a fixed image size of 64M.

This is weird, because all the ext2/3/4 test cases in our test
infrastructure also do not specify a size, and so they get the default
of 60 MiB.

Could you try:

./support/testing/run-tests tests.fs.test_ext.TestExt4

and see if it works for you ?

Which version of Qemu are you using? I'm using 4.2.1.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

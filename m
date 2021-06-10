From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jun 2021 14:31:30 +0200
Subject: [Buildroot] [PATCH v5 0/5] Introduce bmap-tools as target +
 host package
In-Reply-To: <ba7a6ec514891b5494d6232db9513443514ed1fc.camel@orolia.com>
References: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
 <6e9afcd08150926a669d4df1198461e0acc7f063.camel@orolia.com>
 <20210609205222.785b065d@windsurf>
 <08bb8c91-0304-8613-492c-aa133412a1e3@gmail.com>
 <ba7a6ec514891b5494d6232db9513443514ed1fc.camel@orolia.com>
Message-ID: <20210610143130.0ab608d7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicolas,

On Thu, 10 Jun 2021 09:39:43 +0200
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> Sure,
> 
> My qemu version is:
> $ qemu-system-arm  --version
> QEMU emulator version 5.2.0 (Debian 1:5.2+dfsg-10)
> 
> The Ext4 test passes:
> $ ./support/testing/run-tests tests.fs.test_ext.TestExt4 -o tests -d dl
> 09:03:31 TestExt4                                 Starting
> 09:03:34 TestExt4                                 Building
> ah09:08:12 TestExt4                                 Building done
> Downloading to /home/ncarrier/workspace/buildroot/dl/tmp_43sbo0r
> Renaming from /home/ncarrier/workspace/buildroot/dl/tmp_43sbo0r to
> /home/ncarrier/workspace/buildroot/dl/kernel-vexpress-5.10.7
> Downloading to /home/ncarrier/workspace/buildroot/dl/tmpnj5e2uiw
> Renaming from /home/ncarrier/workspace/buildroot/dl/tmpnj5e2uiw to
> /home/ncarrier/workspace/buildroot/dl/vexpress-v2p-ca9-5.10.7.dtb
> 09:08:20 TestExt4                                 Cleaning up
> .
> ----------------------------------------------------------------------
> Ran 1 test in 289.374s
> 
> OK
> 
> But its file system image has a size of 16M which _is_ a power of two:

Sorry, I picked the wrong test. Could you try the Ext3 tests, i.e
tests.fs.test_ext.TestExt3 ? This one doesn't specify a size, so it
should fallback to the default, which is 60MB.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
